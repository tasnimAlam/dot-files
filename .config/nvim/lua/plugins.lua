-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

require "packer".init {
  package_root = os.getenv("HOME") .. "/.local/share/nvim/site/pack"
}

return require("packer").startup(
  {
    function()
      -- Packer can manage itself as an optional plugin
      use {"wbthomason/packer.nvim", opt = true}
      use {"mhartington/formatter.nvim"}
      use {"maxmellon/vim-jsx-pretty", ft = {"js", "jsx", "ts", "tsx"}}
      use {"junegunn/fzf", run = "./install --all"}
      use {"junegunn/fzf.vim"}
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
      use "jiangmiao/auto-pairs"
      use "mattn/emmet-vim"
      use "morhetz/gruvbox"
      use "matze/vim-move"
      use {"rrethy/vim-hexokinase", run = "make hexokinase"}
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
      use {
        "tami5/lspsaga.nvim",
        config = function()
          require "lsp-saga-config"
        end
      }
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
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-calc",
          "octaltree/cmp-look"
        },
        config = function()
          require "cmp-config"
        end
      }
      use "hrsh7th/vim-vsnip"
      use "hrsh7th/cmp-vsnip"
      use "rafamadriz/friendly-snippets"
      use {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp"
      }
      use "onsails/lspkind-nvim"
      use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
          require("lualine").setup(
            {
              options = {
                theme = "tokyonight"
              }
            }
          )
        end
      }
      use {"nvim-telescope/telescope-project.nvim"}
      use "voldikss/vim-floaterm"
      use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
      use "nvim-treesitter/nvim-treesitter-textobjects"
      use {"nvim-treesitter/nvim-treesitter-angular"}
      use "ludovicchabant/vim-gutentags"
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
      use "navarasu/onedark.nvim"
      use {
        "akinsho/nvim-toggleterm.lua"
        -- config = function()
        --   require "toggleterm-config"
        -- end
      }
      use {
        "abecodes/tabout.nvim",
        config = function()
          require "tabout-config"
        end
      }
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
      use "windwp/nvim-ts-autotag"
      use {
        "ThePrimeagen/harpoon",
        requires = {
          {"nvim-lua/plenary.nvim"}
        }
      }
      use {"folke/tokyonight.nvim"}
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
