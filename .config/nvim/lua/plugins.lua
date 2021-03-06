-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

require "packer".init {
  package_root = os.getenv("HOME") .. "/.local/share/nvim/site/pack"
}

return require("packer").startup(
  {
    function()
      -- Packer can manage itself as an optional plugin
      use {"wbthomason/packer.nvim", opt = true}
      use {"mhartington/formatter.nvim"}
      use "editorconfig/editorconfig-vim"
      use {"pangloss/vim-javascript", ft = {"js", "jsx", "ts", "tsx"}}
      use {"yuezk/vim-js", ft = {"js", "jsx", "ts", "tsx"}}
      use {"maxmellon/vim-jsx-pretty", ft = {"js", "jsx", "ts", "tsx"}}
      use {"junegunn/fzf", run = "./install --all"}
      use {"junegunn/fzf.vim"}
      use {"junegunn/gv.vim", cmd = {"GV"}}
      use {"tpope/vim-fugitive", event = "BufEnter", cmd = {"Git", "Gstatus", "Gblame", "Gpush", "Gpull"}}
      use "tpope/vim-surround"
      use "b3nj5m1n/kommentary"
      use "tpope/vim-repeat"
      use "tpope/vim-unimpaired"
      use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}}
      use "jiangmiao/auto-pairs"
      use "mattn/emmet-vim"
      use {"kristijanhusak/vim-js-file-import", run = "npm install", ft = {"js", "jsx", "ts", "tsx"}}
      -- use "unblevable/quick-scope"
      use {"rust-lang/rust.vim", ft = {"rs"}}
      use "morhetz/gruvbox"
      use "matze/vim-move"
      use {"rrethy/vim-hexokinase", run = "make hexokinase"}
      use {"AndrewRadev/splitjoin.vim", cmd = {"SplitjoinJoin", "SplitjoinSplit"}}
      use "tommcdo/vim-exchange"
      use {"jdhao/better-escape.vim"}
      use "honza/vim-snippets"
      use {"kevinhwang91/nvim-bqf"}
      use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
      use {"kyazdani42/nvim-tree.lua"}
      use "kyazdani42/nvim-web-devicons"
      use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, cmd = "Telescope"}
      }
      use "nvim-telescope/telescope-fzy-native.nvim"
      use {"phaazon/hop.nvim", event = "BufRead"}
      use "neovim/nvim-lspconfig"
      use "glepnir/galaxyline.nvim"
      use "nvim-telescope/telescope-project.nvim"
      use {"neoclide/coc.nvim", branch = "release"}
      use "voldikss/vim-floaterm"
      use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
      use {"sindrets/diffview.nvim"}
      use {"stsewd/fzf-checkout.vim"}
      use "nvim-treesitter/nvim-treesitter-textobjects"
      use {"nvim-treesitter/nvim-treesitter-angular", ft = {"ts", "tsx", "html"}}
      use "ludovicchabant/vim-gutentags"
      use {"mbbill/undotree", cmd = "UndotreeToggle"}
      use "ggandor/lightspeed.nvim"
      -- use "stevearc/aerial.nvim"
      use {"lukas-reineke/indent-blankline.nvim", event = "BufRead"}
      use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}
      use {"JoosepAlviste/nvim-ts-context-commentstring", ft = {"js", "jsx", "ts", "tsx"}}
      use "mhinz/vim-startify"
      -- use {"camspiers/snap"}
      use "projekt0n/github-nvim-theme"
    end,
    config = {
      display = {
        open_fn = require("packer.util").float
      },
      profile = {
        enable = true,
        threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
      }
    }
  }
)
