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
      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup({toggler = {block = "gBc"}, opleader = {block = "gB"}})
        end
      }
      use "tpope/vim-repeat"
      use "tpope/vim-unimpaired"
      use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}}
      use "jiangmiao/auto-pairs"
      use "mattn/emmet-vim"
      use {"rust-lang/rust.vim", ft = {"rs"}}
      use "morhetz/gruvbox"
      use "matze/vim-move"
      use {"rrethy/vim-hexokinase", run = "make hexokinase"}
      use {"AndrewRadev/splitjoin.vim", cmd = {"SplitjoinJoin", "SplitjoinSplit"}}
      use "tommcdo/vim-exchange"
      use {
        "max397574/better-escape.nvim",
        config = function()
          require("better_escape").setup {
            mapping = {"kj"},
            timeout = vim.o.timeoutlen,
            clear_empty_lines = false,
            keys = "<Esc>"
          }
        end
      }
      use "honza/vim-snippets"
      use {"kevinhwang91/nvim-bqf"}
      use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require "nvim-tree".setup {}
        end
      }
      use {"kyazdani42/nvim-web-devicons"}
      use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, cmd = "Telescope"}
      }
      use "neovim/nvim-lspconfig"
      use "jose-elias-alvarez/nvim-lsp-ts-utils"
      use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup {}
        end
      }
      use "simrat39/rust-tools.nvim"

      use {
        "hrsh7th/nvim-cmp",
        requires = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-nvim-lsp",
          "quangnguyen30192/cmp-nvim-ultisnips",
          "hrsh7th/cmp-nvim-lua",
          "octaltree/cmp-look",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-calc"
        }
      }
      use {"L3MON4D3/LuaSnip"}
      use "hrsh7th/vim-vsnip"
      use {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp"
      }
      use "onsails/lspkind-nvim"

      use "glepnir/galaxyline.nvim"
      use {"nvim-telescope/telescope-project.nvim"}
      use "voldikss/vim-floaterm"
      use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
      use {"stsewd/fzf-checkout.vim", cmd = {"GBranches"}}
      use "nvim-treesitter/nvim-treesitter-textobjects"
      use {"nvim-treesitter/nvim-treesitter-angular"}
      use "ludovicchabant/vim-gutentags"
      -- use {"kristijanhusak/vim-js-file-import", run = "npm install", ft = {"js", "jsx", "ts", "tsx"}}
      use {"mbbill/undotree", cmd = "UndotreeToggle"}
      use "ggandor/lightspeed.nvim"
      use "stevearc/aerial.nvim"
      use {"lukas-reineke/indent-blankline.nvim", event = "BufRead"}
      use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
          require("gitsigns").setup()
        end
      }
      use {"JoosepAlviste/nvim-ts-context-commentstring", ft = {"js", "jsx", "ts", "tsx"}}
      use "projekt0n/github-nvim-theme"
      use "navarasu/onedark.nvim"
      use {"akinsho/nvim-toggleterm.lua"}
      use {"abecodes/tabout.nvim"}
      use {"rmagatti/alternate-toggler"}
      use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-treesitter/nvim-treesitter"}
        }
      }
      use {"AckslD/nvim-neoclip.lua"}
      use {"ellisonleao/glow.nvim", run = "GlowInstall"}
      use {"gelguy/wilder.nvim", run = "UpdateRemotePlugins"}
      use {
        "luukvbaal/nnn.nvim",
        config = function()
          require("nnn").setup()
        end
      }
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
