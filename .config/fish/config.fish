if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx EDITOR nvim
set fish_key_bindings fish_user_key_bindings
set -U fish_greeting ""

# Fzf config
set fzf_preview_file_cmd cat
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git

# Set path 
set PATH $PATH ~/bin/
set PATH $PATH /opt/homebrew/bin/
set PATH $PATH /opt/homebrew/sbin/
set PATH $PATH /usr/local/bin/
set PATH $PATH /usr/local/sbin/
set PATH $PATH ~/Projects/scripts/
set PATH $PATH ~/.emacs.d/bin/
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/.yarn/bin
set PATH $PATH ~/.local/bin
set PATH $PATH ~/.config/yarn/global/node_modules/.bin

# NodeJS path
set PATH $PATH /opt/homebrew/opt/node@14/bin
set PATH $PATH ~/.npm-global/bin
set PATH $PATH ~/.composer/vendor/bin

# NNN config
set -x NNN_PLUG "f:fzplug;u:getplugs;p:preview_tui;j:autojump;k:pskill;d:dragdrop;"
set -x NNN_BMS "h:~/;d:~/Downloads/;w:~/Projects/sports-cloud-webapp;u:~/Projects/ui2/;r:~/Projects/rust-projects/rust_test/;"
set -x NNN_COLORS "2136"
set -x NNN_FIFO "/tmp/nnn.fifo"
set -x NNN_FCOLORS "c1e2272e006033f7c6d6abc4"

# Zoxide init
zoxide init fish | source

# Starship init
starship init fish | source
fish_add_path /opt/homebrew/bin
