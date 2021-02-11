vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

-- Add your packages

paq 'prettier/vim-prettier'
paq 'ayu-theme/ayu-vim'
paq 'pangloss/vim-javascript'
paq 'yuezk/vim-js'
paq 'maxmellon/vim-jsx-pretty'
paq 'Yggdroot/indentLine'
paq {'junegunn/fzf', { hook = './install --all' }}
paq 'junegunn/fzf.vim'
paq 'junegunn/gv.vim'
paq 'itchyny/lightline.vim'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-surround'
paq 'tpope/vim-commentary'
paq 'tpope/vim-repeat'
paq 'tpope/vim-unimpaired'
paq 'tpope/vim-dispatch'
paq 'airblade/vim-gitgutter'
paq 'jiangmiao/auto-pairs'
paq 'kaicataldo/material.vim'
paq 'itchyny/vim-cursorword'
paq 'lfv89/vim-interestingwords'
paq 'easymotion/vim-easymotion'
paq 'wincent/ferret'
paq 'mhinz/vim-grepper'
paq 'mattn/emmet-vim'
paq {'kristijanhusak/vim-js-file-import', { hook = 'npm install'}} 
paq 'unblevable/quick-scope'  
paq {'neoclide/coc.nvim', { branch  = 'release'}} 
paq 'rust-lang/rust.vim'
paq 'mcchrish/nnn.vim'
paq 'lambdalisue/fern.vim'
paq 'lambdalisue/fern-git-status.vim'
paq 'morhetz/gruvbox'
paq 'vim-airline/vim-airline'
paq 'vim-airline/vim-airline-themes'
paq 'matze/vim-move'
paq {'rrethy/vim-hexokinase', { hook = 'make hexokinase' }} 
paq 'AndrewRadev/splitjoin.vim'
paq 'tommcdo/vim-exchange'
paq 'jdhao/better-escape.vim'
paq 'honza/vim-snippets'
paq 'kevinhwang91/nvim-bqf'
paq 'nvim-treesitter/nvim-treesitter'

