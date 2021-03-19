-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  
  use 'prettier/vim-prettier'
  use 'ayu-theme/ayu-vim'
  use 'pangloss/vim-javascript'
  use 'yuezk/vim-js'
  use 'maxmellon/vim-jsx-pretty'
  use {'junegunn/fzf',  run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'
  use 'itchyny/lightline.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-dispatch'
  use 'airblade/vim-gitgutter'
  use 'jiangmiao/auto-pairs'
  use 'itchyny/vim-cursorword'
  use 'lfv89/vim-interestingwords'
  use 'easymotion/vim-easymotion'
  use 'wincent/ferret'
  use 'mhinz/vim-grepper'
  use 'mattn/emmet-vim'
  use {'kristijanhusak/vim-js-file-import', run = 'npm install'} 
  use 'unblevable/quick-scope'  
  use 'neoclide/coc.nvim' 
  use 'rust-lang/rust.vim'
  use 'mcchrish/nnn.vim'
  use 'morhetz/gruvbox'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'matze/vim-move'
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'} 
  use 'AndrewRadev/splitjoin.vim'
  use 'tommcdo/vim-exchange'
  use 'jdhao/better-escape.vim'
  use 'honza/vim-snippets'
  use 'kevinhwang91/nvim-bqf'
  use 'nvim-treesitter/nvim-treesitter'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
    
end)
