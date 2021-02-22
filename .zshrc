# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wpdev/.oh-my-zsh"
# export EDITOR="/usr/local/bin/nvim"
export EDITOR=nvim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# 10ms for key sequences
KEYTIMEOUT=1

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-open
  zsh-autosuggestions
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
# alias go='git checkout '
alias eb='cd ~/Sites/blocks/wp-content/plugins/essential-blocks; pwd'
alias pl='cd ~/Sites/wp/wp-content/plugins;pwd'
alias tem='cd ~/Documents/templately-frontend; pwd'
# alias .='nvim .'
alias t='tmux'
alias n='nvim'
alias nn='nnn'
alias python='python3'
alias ^l="clear"
alias -s txt=nvim
alias vr="source ~/.vimrc"
alias dot="cd ~/Documents/dot-files;pwd"
alias cat="bat"
alias ll="exa -1 --icons --group-directories-first"
alias lst="ll -s time"
 
bindkey '^o' autosuggest-accept

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:/Users/wpdev/.composer/vendor/bin"
fpath+=${ZDOTDIR:-~}/.zsh_functions

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# nnn config
export NNN_PLUG='f:fzopen;u:getplugs;t:preview_tui;v:_viu $nnn;'
export NNN_BMS='d:~/Documents;h:~/;D:~/Downloads/;e:~/Sites/blocks/wp-content/plugins/essential-blocks;p:~/Sites/wp/wp-content/plugins/;t:~/Documents/templately-frontend/;s:~/Documents/svn-repo/;'
export NNN_COLORS="2136"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:node_modules/.bin"
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

eval "$(zoxide init zsh)"

# nvim config
# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
