set -U fish_greeting ""
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR nvim
set -gx BROWSER chromium
set fish_key_bindings fish_user_key_bindings

# Fzf config
set fzf_preview_file_cmd cat
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git

# Set path 
fish_add_path ~/bin
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
fish_add_path /usr/local/bin /usr/local/sbin
fish_add_path ~/Projects/scripts/
fish_add_path ~/.local/bin/
fish_add_path ~/.emacs.d/bin/
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin ~/.config/yarn/global/node_modules/.bin ~/.npm-global/bin

fish_add_path ~/.composer/vendor/bin

# NNN config
set -x NNN_FIFO "/tmp/nnn.fifo"
set -x NNN_PLUG "f:fzopen;u:getplugs;p:preview-tui;c:croc;m:mailattach;w:wordcount;i:ipinfo;k:pskill;j:autojump;e:-!sudo -E nvim $nnn*"
set -x NNN_BMS "h:~/;d:~/Downloads/;w:~/Projects/sports-cloud-webapp;u:~/Projects/ui2/;r:~/Projects/rust-projects/rust_test/;.:~/Documents/dot-files/"
set -x NNN_COLORS 2136
set -x NNN_FCOLORS c1e2272e006033f7c6d6abc4

# Zoxide init
zoxide init fish | source

# Starship init
starship init fish | source

set -gx PNPM_HOME "/home/shourov/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
