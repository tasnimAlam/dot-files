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
      use {
        "mhartington/formatter.nvim",
        config = function()
          require "plugins.formatter"
        end
      }
      use {"maxmellon/vim-jsx-pretty", ft = {"js", "jsx", "ts", "tsx"}}
      -- use {"junegunn/fzf", run = "./install --all"}
      -- use {"junegunn/fzf.vim"}
      -- use {"tpope/vim-fugitive", event = "BufEnter", cmd = {"Git", "Gstatus", "Gblame", "Gpush", "Gpull"}}
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
      -- use "morhetz/gruvbox"
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
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require "plugins.treesitter"
        end
      }
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
      use {
        "neovim/nvim-lspconfig",
        config = function()
          require "plugins.lsp"
        end
      }
      use {
        "tami5/lspsaga.nvim",
        config = function()
          require "plugins.lspsaga"
        end
      }
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
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-calc",
          "octaltree/cmp-look"
        },
        config = function()
          require "plugins.cmp"
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
      use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("bufferline").setup {}
        end
      }
      use "nvim-treesitter/nvim-treesitter-textobjects"
      use {"nvim-treesitter/nvim-treesitter-angular"}
      -- use "ludovicchabant/vim-gutentags"
      use {"mbbill/undotree", cmd = "UndotreeToggle"}
      use "ggandor/lightspeed.nvim"
      use {"lukas-reineke/indent-blankline.nvim", event = "BufRead"}
      use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
          require("gitsigns").setup()
        end
      }
      use {"JoosepAlviste/nvim-ts-context-commentstring", ft = {"js", "jsx", "ts", "tsx"}}
      -- use "navarasu/onedark.nvim"
      use {"folke/tokyonight.nvim"}
      use {
        "akinsho/nvim-toggleterm.lua",
        config = function()
          require "plugins.toggleterm"
        end
      }
      use {
        "abecodes/tabout.nvim",
        config = function()
          require "plugins.tabout"
        end,
        wants = {"nvim-treesitter"},
        after = {"nvim-cmp"}
      }
      use {"rmagatti/alternate-toggler"}
      use {
        "AckslD/nvim-neoclip.lua",
        config = function()
          require "plugins.neoclip"
        end
      }
      -- use {"ellisonleao/glow.nvim", run = "GlowInstall"}
      use {"gelguy/wilder.nvim", run = "UpdateRemotePlugins"}
      use "windwp/nvim-ts-autotag"
      use "nathom/filetype.nvim"
      -- use {"ThePrimeagen/harpoon", require = "nvim-lua/plenary.nvim"}
      --     use "lewis6991/impatient.nvim"
      use {
        "goolord/alpha-nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = function()
          require "plugins.alpha"
        end
      }
      use {"APZelos/blamer.nvim"}
      use {"mfussenegger/nvim-treehopper"}
    end,
    config = {
      --      compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
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
