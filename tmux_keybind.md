# tmux Keybindings

Personal tmux cheatsheet, generated from `~/.tmux.conf`.

- **Prefix:** `Ctrl+Space` (primary), `Ctrl+\` (secondary)
- `mode-keys vi` (copy mode is vim-style), `status-keys emacs` (command prompt is emacs-style)
- Windows and panes are **1-indexed**, and renumber automatically when one is killed
- Mouse is on; history is 50 000 lines

Notation: `prefix + x` means press the prefix, release, then `x`.
Bindings marked **no prefix** are pressed directly.

---

## Panes

### Navigate

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` (**no prefix**) | Move left / down / up / right — **vim-aware**: passes through to vim/nvim when a vim process owns the pane |
| `prefix + h/j/k/l` | Move left / down / up / right |
| `prefix + Arrow` | Move by arrow key (tmux default) |
| `prefix + o` | Fuzzy pane switcher (`tmux-fzf-pane-switch`) |
| `prefix + s` | EasyMotion jump — labels every pane, tap a label (`tmux-easymotion`) |
| `prefix + z` | Toggle zoom on current pane |
| `prefix + m` / `prefix + M` | Mark / unmark pane |
| `prefix + q` | Jump to the marked pane |

### Split & create

| Key | Action |
|-----|--------|
| `prefix + \|` | Split horizontally (side by side) — inherits current directory |
| `prefix + -` | Split vertically (stacked) — inherits current directory |
| `prefix + M-p` (**no prefix**) | Toggle floating pane (`tmux-floax`) |

`"` and `%` are unbound — use `|` and `-`.

### Resize

**No prefix.** Hold `Alt+Shift` and tap the direction to keep resizing. Step is 2 cells.

| Key | Action |
|-----|--------|
| `Alt+Shift+H` | Shrink from the right / grow left |
| `Alt+Shift+J` | Grow down |
| `Alt+Shift+K` | Grow up |
| `Alt+Shift+L` | Grow right |
| `prefix + Alt+Arrow` | Resize by 5 (tmux default) |
| `prefix + Ctrl+Arrow` | Resize by 1 (tmux default) |
| `prefix + Space` | Cycle to the next preset layout |

### Other

| Key | Action |
|-----|--------|
| `prefix + Ctrl+s` | Toggle `synchronize-panes` — typing goes to every pane in the window |
| `prefix + x` | Kill pane — **no confirmation prompt** |
| `prefix + !` | Break the current pane out into its own window |

---

## Windows

| Key | Action |
|-----|--------|
| `Alt+h` (**no prefix**) | Previous window |
| `Alt+l` (**no prefix**) | Next window |
| `prefix + c` | New window — inherits current directory |
| `prefix + 1`…`9` | Jump to window by number |
| `prefix + w` | Interactive window/session tree |
| `prefix + ,` | Rename window (auto-rename is off, so names stick) |
| `prefix + &` | Kill window (confirms first) |
| `prefix + .` | Move window to another index |

---

## Sessions

| Key | Action |
|-----|--------|
| `prefix + t` | **sesh picker** — fuzzy-find sessions, zoxide dirs, and configs |
| `prefix + L` | Jump to last session (`sesh last`) |
| `prefix + (` / `prefix + )` | Previous / next session |
| `prefix + d` | Detach |
| `prefix + $` | Rename session |
| `prefix + X` | Kill session — **confirms first** |

`detach-on-destroy off`: killing a session drops you into another one instead of exiting tmux.

### Inside the sesh picker (`prefix + t`)

| Key | Filter |
|-----|--------|
| `Ctrl+a` | Everything |
| `Ctrl+t` | tmux sessions only |
| `Ctrl+g` | Config dirs |
| `Ctrl+x` | zoxide dirs |
| `Ctrl+f` | `fd` directory search under `~` |
| `Ctrl+d` | Kill the highlighted session |
| `Tab` / `Shift+Tab` | Down / up |

---

## Copy mode (vi)

| Key | Action |
|-----|--------|
| `prefix + [` | Enter copy mode |
| `v` | Start selection |
| `y` | Yank selection to the **system clipboard** via `wl-copy`, then exit |
| `h/j/k/l`, `w`, `b`, `/`, `?`, `g`, `G` | vim motions and search |
| `prefix + P` | Paste the tmux buffer |
| `prefix + ]` | Paste (tmux default) |
| `q` / `Escape` | Leave copy mode |

Pane navigation works inside copy mode too:

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Move to pane left / down / up / right |
| `Ctrl+\` | Move to last pane |
| `Ctrl+Space` | Cycle to next pane |

---

## Plugin shortcuts

| Key | Plugin | Action |
|-----|--------|--------|
| `prefix + u` | `tmux-fzf-url` | Fuzzy-pick a URL from the pane and open it |
| `prefix + f` | `tmux-thumbs` | Label every match on screen (paths, hashes, IPs) — tap a label to copy it via `wl-copy` |
| `Alt+p` (**no prefix**) | `tmux-floax` | Toggle floating pane |
| `prefix + o` | `tmux-fzf-pane-switch` | Fuzzy pane switcher |
| `prefix + s` | `tmux-easymotion` | Label-jump between panes |

`tmux-spotlight` is installed but no key is set in the config — it uses its own default.

---

## Config

| Key | Action |
|-----|--------|
| `prefix + r` | Reload `~/.tmux.conf` (shows "Tmux reloaded") |
| `prefix + Ctrl+l` | Clear the screen (sends a literal `Ctrl+l`, since bare `Ctrl+l` is pane navigation) |
| `prefix + :` | Command prompt |
| `prefix + ?` | List every active binding |

Plugins are managed by TPM: `prefix + I` installs, `prefix + U` updates, `prefix + alt+u` prunes removed ones.

---

## Rebound tmux defaults

These no longer do what stock tmux does:

| Key | Stock tmux | Here |
|-----|-----------|------|
| `prefix + l` | Last window | Select pane right |
| `prefix + L` | Last session | `sesh last` |
| `prefix + q` | Show pane numbers | Jump to marked pane |
| `prefix + s` | Session tree | EasyMotion pane jump |
| `prefix + t` | Clock | sesh picker |
| `prefix + f` | Find window | tmux-thumbs |
| `prefix + o` | Next pane | Fuzzy pane switcher |
| `prefix + x` | Kill pane, **with** confirm | Kill pane, **no** confirm |
| `Ctrl+b` | Prefix | Unbound — prefix is `Ctrl+Space` |

`Ctrl+\` is the secondary prefix, so it cannot also be bound as a vim-navigator "last pane" key outside copy mode — tmux matches prefix keys before the root key table.

---

## Reference: options

| Option | Value |
|--------|-------|
| `prefix` / `prefix2` | `C-Space` / `C-\` |
| `default-terminal` | `tmux-256color` (+ `Tc` override for truecolor) |
| `escape-time` | `0` |
| `mouse` | `on` |
| `base-index` / `pane-base-index` | `1` / `1` |
| `renumber-windows` | `on` |
| `history-limit` | `50000` |
| `status-position` | `top` |
| `detach-on-destroy` | `off` |
| `automatic-rename` | `off` |
| `aggressive-resize` | `on` |
| `status-interval` | `10` |

`TERM` changes only apply to newly created panes; restart the server (`tmux kill-server`) for it to take effect everywhere.
