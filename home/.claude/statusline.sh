#!/usr/bin/env bash
# Claude Code statusline script
# Reads JSON from stdin, outputs a formatted status line with ANSI colors.

input=$(cat)

# ANSI color helpers
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
GRAY='\033[90m'

SEP="${DIM}|${RESET}"

# -- Helper: color a percentage value by threshold --
# Usage: color_pct <value>
# Prints the colored percentage string.
color_pct() {
  local val="$1"
  local rounded
  rounded=$(printf '%.0f' "$val" 2>/dev/null) || rounded="$val"
  if   [ "$rounded" -ge 80 ] 2>/dev/null; then
    printf '%b' "${RED}${rounded}%${RESET}"
  elif [ "$rounded" -ge 50 ] 2>/dev/null; then
    printf '%b' "${YELLOW}${rounded}%${RESET}"
  else
    printf '%b' "${GREEN}${rounded}%${RESET}"
  fi
}

# -- Helper: render a progress bar for a percentage value --
# Usage: bar <value> [width]
# Prints a colored bar like [▓▓▓▓░░░░] colored by threshold.
bar() {
  local val="$1"
  local width="${2:-10}"
  local rounded
  rounded=$(printf '%.0f' "$val" 2>/dev/null) || rounded=0
  [ "$rounded" -lt 0 ] 2>/dev/null && rounded=0
  [ "$rounded" -gt 100 ] 2>/dev/null && rounded=100
  local filled=$(( (rounded * width + 50) / 100 ))
  [ "$filled" -gt "$width" ] && filled="$width"
  local empty=$(( width - filled ))

  local color="$GREEN"
  if   [ "$rounded" -ge 80 ] 2>/dev/null; then color="$RED"
  elif [ "$rounded" -ge 50 ] 2>/dev/null; then color="$YELLOW"
  fi

  local fill_str="" empty_str="" i=0
  for (( i=0; i<filled; i++ )); do fill_str="${fill_str}▓"; done
  for (( i=0; i<empty;  i++ )); do empty_str="${empty_str}░"; done

  printf '%b' "${DIM}[${RESET}${color}${fill_str}${RESET}${GRAY}${empty_str}${RESET}${DIM}]${RESET}"
}

# -- Helper: format a countdown from now until a unix epoch timestamp --
# Usage: countdown_to <epoch_seconds>
# Prints e.g. "2h13m" or "45m"
countdown_to() {
  local target="$1"
  local now
  now=$(date +%s)
  local diff=$(( target - now ))
  if [ "$diff" -le 0 ]; then
    printf 'soon'
    return
  fi
  local hours=$(( diff / 3600 ))
  local mins=$(( (diff % 3600) / 60 ))
  if [ "$hours" -gt 0 ]; then
    printf '%dh%dm' "$hours" "$mins"
  else
    printf '%dm' "$mins"
  fi
}

# -- Helper: smart reset label for 7-day limit --
# If less than 24h remain -> countdown; else -> weekday name
smart_reset_label() {
  local target="$1"
  local now
  now=$(date +%s)
  local diff=$(( target - now ))
  if [ "$diff" -le 0 ]; then
    printf 'soon'
    return
  fi
  if [ "$diff" -lt 86400 ]; then
    countdown_to "$target"
  else
    # Print the weekday name of the reset time in local timezone
    date -d "@${target}" '+%a' 2>/dev/null \
      || date -r "$target" '+%a' 2>/dev/null \
      || printf '?'
  fi
}

# ---- Segment 1: Model name ----
model=$(printf '%s' "$input" | jq -r '.model.display_name // empty' 2>/dev/null)
seg_model=""
if [ -n "$model" ]; then
  seg_model="${BOLD}${model}${RESET}"
fi

# ---- Segment 2: Context window % ----
seg_ctx=""
ctx_pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
if [ -n "$ctx_pct" ]; then
  seg_ctx="${GRAY}ctx${RESET} $(bar "$ctx_pct") $(color_pct "$ctx_pct")"
fi

# ---- Segment 3: 5-hour session limit ----
seg_5h=""
five_pct=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty' 2>/dev/null)
five_resets=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.resets_at // empty' 2>/dev/null)
if [ -n "$five_pct" ]; then
  seg_5h="${GRAY}5h${RESET} $(bar "$five_pct") $(color_pct "$five_pct")"
  if [ -n "$five_resets" ]; then
    countdown=$(countdown_to "$five_resets")
    seg_5h="${seg_5h} ${DIM}resets ${countdown}${RESET}"
  fi
fi

# ---- Segment 4: 7-day weekly limit ----
seg_7d=""
week_pct=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty' 2>/dev/null)
week_resets=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.resets_at // empty' 2>/dev/null)
if [ -n "$week_pct" ]; then
  seg_7d="${GRAY}7d${RESET} $(bar "$week_pct") $(color_pct "$week_pct")"
  if [ -n "$week_resets" ]; then
    reset_label=$(smart_reset_label "$week_resets")
    seg_7d="${seg_7d} ${DIM}${reset_label}${RESET}"
  fi
fi

# ---- Segment 5: Plugin badges ----
# The statusline JSON schema does not currently document a dedicated plugin/badge field.
# We attempt a best-effort read of any top-level "badges" or "plugins" string fields,
# and fall through silently if absent.
seg_plugins=""
plugin_badge=$(printf '%s' "$input" | jq -r '.badges // empty' 2>/dev/null)
if [ -z "$plugin_badge" ]; then
  plugin_badge=$(printf '%s' "$input" | jq -r '.plugin_badge // empty' 2>/dev/null)
fi
if [ -n "$plugin_badge" ]; then
  seg_plugins="$plugin_badge"
fi

# ---- Assemble output ----
parts=()
[ -n "$seg_model"   ] && parts+=("$seg_model")
[ -n "$seg_ctx"     ] && parts+=("$seg_ctx")
[ -n "$seg_5h"      ] && parts+=("$seg_5h")
[ -n "$seg_7d"      ] && parts+=("$seg_7d")
[ -n "$seg_plugins" ] && parts+=("$seg_plugins")

# Join with separator
output=""
for part in "${parts[@]}"; do
  if [ -z "$output" ]; then
    output="$part"
  else
    output="${output}  ${SEP}  ${part}"
  fi
done

printf '%b\n' "$output"
