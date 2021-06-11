-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

require "packer".init {
  package_root = os.getenv("HOME") .. "/.local/share/nvim/site/pack"
}

return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}
    use "mhartington/formatter.nvim"
    use "editorconfig/editorconfig-vim"
    -- use 'prettier/vim-prettier'
    use "pangloss/vim-javascript"
    use "yuezk/vim-js"
    use "maxmellon/vim-jsx-pretty"
    use {"junegunn/fzf", run = "./install --all"}
    use "junegunn/fzf.vim"
    use "junegunn/gv.vim"
    use "tpope/vim-fugitive"
    use "tpope/vim-surround"
    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    use "tpope/vim-unimpaired"
    use "tpope/vim-dispatch"
    use "airblade/vim-gitgutter"
    use "jiangmiao/auto-pairs"
    use "itchyny/vim-cursorword"
    use "mattn/emmet-vim"
    use {"kristijanhusak/vim-js-file-import", run = "npm install"}
    use "unblevable/quick-scope"
    use "rust-lang/rust.vim"
    use "morhetz/gruvbox"
    use "matze/vim-move"
    use {"rrethy/vim-hexokinase", run = "make hexokinase"}
    use "AndrewRadev/splitjoin.vim"
    use "tommcdo/vim-exchange"
    use "jdhao/better-escape.vim"
    use "honza/vim-snippets"
    use "kevinhwang91/nvim-bqf"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "phaazon/hop.nvim"
    use "neovim/nvim-lspconfig"
    use "glepnir/galaxyline.nvim"
    use "nvim-telescope/telescope-project.nvim"
    use {"neoclide/coc.nvim", branch = "release"}
    use "voldikss/vim-floaterm"
    use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
    use "sindrets/diffview.nvim"
    use "stsewd/fzf-checkout.vim"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/nvim-treesitter-angular"
    use "ludovicchabant/vim-gutentags"
    use "mbbill/undotree"
  end
)
