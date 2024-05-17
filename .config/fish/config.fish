set os (uname)
set -U fish_greeting ""
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR nvim
set -gx BROWSER chromium
set -gx LC_ALL en_US.UTF-8
set -gx DMENU_BLUETOOTH_LAUNCHER dmenu-wl


# Fzf config

set -Ux fifc_editor nvim
set fish_key_bindings fish_user_key_bindings
fzf_configure_bindings --variables=\e\cv

set fzf_preview_file_cmd cat
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

set -x FZF_DEFAULT_OPTS "--reverse --bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)'"
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix"
set -gx FZF_CTRL_T_OPTS " --walker-skip .git,node_modules,target --preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
set -gx FZF_ALT_C_OPTS " --walker-skip .git,node_modules,target --preview 'tree -C {}'"

# Set path 
fish_add_path ~/bin
fish_add_path /usr/local/bin /usr/local/sbin
fish_add_path ~/.local/bin/
fish_add_path ~/.config/emacs/bin/
fish_add_path ~/.config/doom//bin/
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin ~/.config/yarn/global/node_modules/.bin ~/.npm-global/bin
fish_add_path ~/.composer/vendor/bin
fish_add_path ~/.deno/bin/
fish_add_path ~/go/bin/

if test "$os" = Linux
    fish_add_path ~/Documents/dot-files/scripts/
end
if test "$os" = Darwin
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
    fish_add_path ~/Projects/scripts/
end


# NNN config
set -x NNN_FIFO "/tmp/nnn.fifo"
set -x NNN_PLUG "f:fzopen;m:send_email;u:getplugs;p:preview-tui;c:croc_send;h:nmount;t:thumbnail;d:dragdrop;i:ipinfo;k:pskill;j:autojump;e:-!sudo -E nvim $nnn*;E:suedit;s:x2sel;"

# Colors
set BLK 03
set CHR 03
set DIR 04
set EXE 02
set REG 07
set HARDLINK 05
set SYMLINK 05
set MISSING 08
set ORPHAN 01
set FIFO 06
set SOCK 03
set UNKNOWN 01
set -x NNN_COLORS "#04020301;4231"
set -x NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$UNKNOWN"
# set -x NNN_PREFER_SELECTION 1

set -x CHROME_BIN /usr/bin/chromium


if test "$os" = Linux
    set -x NNN_BMS "d:~/Downloads/;w:~/Documents/sports-cloud-webapp;u:~/Documents/ui2/;r:~/Documents/rust-projects/rust_test/;.:~/Documents/dot-files/;p:~/Pictures/;v:~/Videos/tutorials/"
end

if test "$os" = Darwin
    set -x NNN_BMS "d:~/Downloads/;w:~/Documents/sports-cloud-webapp;u:~/Documents/ui2/;r:~/Projects/rust-projects/rust_test/;.:~/Projects/dot-files/"
end

#  Abbreviations
if status --is-interactive
    abbr --add --global kll kill -9
end

# Zoxide init
zoxide init fish | source

# Starship init
starship init fish | source

# set -gx PNPM_HOME "/home/shourov/.local/share/pnpm"
# set -gx PATH "$PNPM_HOME" $PATH
