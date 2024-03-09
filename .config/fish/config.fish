set os (uname)
set -U fish_greeting ""
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR nvim
set -gx BROWSER chromium
set -gx LC_ALL en_US.UTF-8
set -gx DMENU_BLUETOOTH_LAUNCHER dmenu-wl


# Docker 
# set -gx DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

set fish_key_bindings fish_user_key_bindings

# Fzf config
set fzf_preview_file_cmd cat
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix"

# Set path 
fish_add_path ~/bin
fish_add_path /usr/local/bin /usr/local/sbin
fish_add_path ~/.local/bin/
fish_add_path ~/.emacs.d/bin/
fish_add_path ~/.config/emacs/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin ~/.config/yarn/global/node_modules/.bin ~/.npm-global/bin
fish_add_path ~/.composer/vendor/bin
fish_add_path ~/.deno/bin/

if test "$os" = Linux
    fish_add_path ~/Documents/dot-files/scripts/
end
if test "$os" = Darwin
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
    fish_add_path ~/Projects/scripts/
end



# NNN config
set -x NNN_FIFO "/tmp/nnn.fifo"
set -x NNN_PLUG "f:fzopen;u:getplugs;p:preview-tui;c:xdgdefault;m:nmount;t:thumbnail;d:dragdrop;i:ipinfo;k:pskill;j:autojump;e:-!sudo -E nvim $nnn*;E:suedit;s:x2sel;"
set -x NNN_COLORS 2136
set -x NNN_FCOLORS c1e2272e006033f7c6d6abc4

set -x CHROME_BIN /usr/bin/chromium


if test "$os" = Linux
    set -x NNN_BMS "d:~/Downloads/;w:~/Documents/sports-cloud-webapp;u:~/Documents/ui2/;r:~/Documents/rust-projects/rust_test/;.:~/Documents/dot-files/;p:~/Pictures/"
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
