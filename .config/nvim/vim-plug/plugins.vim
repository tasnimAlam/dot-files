"  ------------------------- Plugins ----------------------------------


call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret'
Plug 'mhinz/vim-grepper'
Plug 'mattn/emmet-vim'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'unblevable/quick-scope'  
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'mcchrish/nnn.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tommcdo/vim-exchange'
Plug 'jdhao/better-escape.vim'
Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'
Plug 'andymass/vim-matchup'
if has("nvim")
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
  Plug 'kyazdani42/nvim-web-devicons' 
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'tjdevries/nlua.nvim'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
endif
Plug 'codota/tabnine-vim'
call plug#end()
