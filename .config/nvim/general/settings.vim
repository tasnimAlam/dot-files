set hidden                  " TextEdit might fail if hidden is not set.
set nobackup                " Some language servers have issues with backup files
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes          " Always show the signcolumn, otherwise it would shift the text each time
set tabstop=2               " Set tab space
set cursorline              " Highlight current line
set hlsearch                " Highlight searched pattern
set shiftwidth=2            " Set shift width
set expandtab               " Insert space when tab is pressed
set laststatus=2            " Always display status line
set noswapfile              " Do not create swap file
set noshowmode              " Hide '-- INSERT --' from status line
set encoding=utf-8          " Set file encoding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=20
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed     "OSX
  set rtp+=/usr/local/opt/fzf
else
  set clipboard=unnamedplus "Linux
endif
set number                  " Display line number
set relativenumber          " Display relative line number
set rtp+=~/.fzf             " Set Fuzzy Finder
syntax on                   " Enable syntax hilighting
filetype plugin indent on   " Detect filetype that is edited, enable indent, plugin for specific file
set completeopt+=noinsert
set regexpengine=1
set modifiable
if has("nvim")
    set inccommand=nosplit
endif
set notimeout
set ttimeout
set scrolloff=8
set showtabline=1

