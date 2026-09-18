#!/usr/bin/env bash

# Version 1.0
# written by Seyloria

### INFO ###
# You can launch the script with "-exclude" flag, followed by a comma
# seperated list of sink id's you want to hide in the menu
# Example:
# ~/myscripts/sinkswitch.sh -exclude 46,63,57

# Catches sink ID's to exclude
exclude_ids=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -exclude)
      IFS=',' read -ra exclude_ids <<< "$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

# Returns 0 (true) if the given sink ID is in the exclude list
is_excluded() {
  local id="$1"
  for x in "${exclude_ids[@]}"; do
    [[ "$id" == "$x" ]] && return 0
  done
  return 1
}

# Stores all the sinks
declare -A sinks

# Stores the currently active default sink ID
default_sink=""


# Parse wpctl status output to populate sinks array and find default
# Reads each line of the filtered sink section, extracts the sink ID and name,
# and sets `default_sink` if the line contains the '*' marker.
while IFS= read -r line; do
    # Match lines with optional * + number + name
    if [[ $line =~ \**[[:space:]]*([0-9]+)\.\ ([^[]+) ]]; then
        id="${BASH_REMATCH[1]}"
        name="${BASH_REMATCH[2]}"
        name="${name%"${name##*[![:space:]]}"}"  # strip the run of spaces before [vol:
        sinks["$id"]="$name"
        # Check for * somewhere before the number in the line
        if [[ $line =~ \* ]]; then
            default_sink="$id"
        fi
    fi
done < <(wpctl status |
sed -n '
  /^Audio$/,/^[A-Z]/ {
    /^[[:space:]]*├─ Sinks:/ {
      :loop
      n
      /^ │[[:space:]]*[0-9*]/ p
      /^ │[[:space:]]*$/ q
      b loop
    }
  }
')

# Builds the menu. bemenu returns the chosen line verbatim — it has no
# equivalent of fzf's --with-nth, which let the old version hide an ID column.
# So the label is mapped back to its sink ID here instead.
declare -A id_of
menu=()
for id in $(for i in "${!sinks[@]}"; do
              printf "%s\t%s\n" "$i" "${sinks[$i]}"
           done | sort -k2 | cut -f1); do
    is_excluded "$id" && continue

    flag=" "
    [[ "$id" == "$default_sink" ]] && flag="▶"

    label="$flag | ${sinks[$id]}"
    # Two identical device names would collide in the map, so disambiguate.
    [[ -v id_of["$label"] ]] && label="$label ($id)"

    id_of["$label"]="$id"
    menu+=("$label")
done

# Displays the menu. BEMENU_OPTS supplies font and height, as with every other menu.
selected=$(printf '%s\n' "${menu[@]}" | bemenu -i -l 10 -p "Audio output:")

[[ -z "$selected" ]] && exit 0  # user cancelled

# Map the chosen label back to its sink ID
new_default="${id_of["$selected"]}"
[[ -z "$new_default" ]] && exit 0

# Set new default sink
wpctl set-default "$new_default"
