-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd([[packadd packer.nvim]])

require("packer").init(
  {
    package_root = os.getenv("HOME") .. "/.local/share/nvim/site/pack"
  }
)

return require("packer").startup(
  {
    function()
      -- Packer can manage itself as an optional plugin
      use({"wbthomason/packer.nvim", opt = true})

      -- Lsp
      use(
        {
          "neovim/nvim-lspconfig",
          config = function()
            require("plugins.lsp")
          end
        }
      )
      use(
        {
          "tami5/lspsaga.nvim",
          config = function()
            require("plugins.lspsaga")
          end
        }
      )
      use("onsails/lspkind-nvim")
      use("jose-elias-alvarez/nvim-lsp-ts-utils")
      use({"simrat39/rust-tools.nvim", ft = {"rs"}})
      use(
        {
          "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("plugins.trouble")
          end
        }
      )

      -- Formatter
      -- use({
      -- 	"jose-elias-alvarez/null-ls.nvim",
      -- 	config = function()
      -- 		require("plugins.null-ls")
      -- 	end,
      -- })

      use(
        {
          "mhartington/formatter.nvim",
          config = function()
            require("plugins.formatter")
          end
        }
      )

      -- Comments
      use(
        {
          "numToStr/Comment.nvim",
          config = function()
            require("plugins.comment")
          end
        }
      )

      -- Autocomplete
      use(
        {
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
            require("plugins.cmp")
          end
        }
      )
      use(
        {
          "tzachar/cmp-tabnine",
          run = "./install.sh",
          requires = "hrsh7th/nvim-cmp"
        }
      )

      -- Treeesitter
      use(
        {
          "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate",
          config = function()
            require("plugins.treesitter")
          end
        }
      )
      use("nvim-treesitter/nvim-treesitter-textobjects")
      -- use({ "nvim-treesitter/nvim-treesitter-angular" })
      use({"ShooTeX/nvim-treesitter-angular"})
      use("windwp/nvim-ts-autotag")
      use({"maxmellon/vim-jsx-pretty", ft = {"js", "jsx", "ts", "tsx"}})
      -- use({
      -- 	"narutoxy/dim.lua",
      -- 	requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
      -- 	config = function()
      -- 		require("dim").setup({})
      -- 	end,
      -- })

      -- Status line and bufferline
      use(
        {
          "nvim-lualine/lualine.nvim",
          requires = {"kyazdani42/nvim-web-devicons", opt = true},
          config = function()
            require("plugins.lualine")
          end
        }
      )
      use(
        {
          "akinsho/nvim-bufferline.lua",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("plugins.bufferline")
          end
        }
      )

      -- NvimTree
      use(
        {
          "kyazdani42/nvim-tree.lua",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("nvim-tree").setup({})
          end
        }
      )

      -- Icons
      use({"kyazdani42/nvim-web-devicons"})

      -- Telescope and Fzf
      use({"junegunn/fzf", run = "./install --all"})
      use({"junegunn/fzf.vim"})
      use(
        {
          "nvim-telescope/telescope.nvim",
          requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, cmd = "Telescope"}
        }
      )
      use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
      use({"nvim-telescope/telescope-project.nvim"})

      -- Snippets
      use("hrsh7th/vim-vsnip")
      use("hrsh7th/cmp-vsnip")
      use("rafamadriz/friendly-snippets")
      use({"mbbill/undotree", cmd = "UndotreeToggle"})
      use({"lukas-reineke/indent-blankline.nvim", event = "BufRead"})
      use(
        {
          "lewis6991/gitsigns.nvim",
          requires = {"nvim-lua/plenary.nvim"},
          config = function()
            require("plugins.gitsigns")
          end
        }
      )
      use({"JoosepAlviste/nvim-ts-context-commentstring", ft = {"js", "jsx", "ts", "tsx"}})

      -- Theme
      use({"folke/tokyonight.nvim"})
      -- use "morhetz/gruvbox"
      -- use "navarasu/onedark.nvim"
      use("rebelot/kanagawa.nvim")

      -- Terminal
      use(
        {
          "akinsho/nvim-toggleterm.lua",
          config = function()
            require("plugins.toggleterm")
          end
        }
      )
      use("voldikss/vim-floaterm")

      -- Navigation and search
      -- use("ggandor/lightspeed.nvim")
      use({"mfussenegger/nvim-treehopper"})
      use({"gelguy/wilder.nvim", run = "UpdateRemotePlugins"})
      use(
        {
          "numToStr/Navigator.nvim",
          config = function()
            require("Navigator").setup()
          end
        }
      )

      -- Dashboard
      use(
        {
          "goolord/alpha-nvim",
          requires = {"kyazdani42/nvim-web-devicons"},
          config = function()
            require("plugins.alpha")
          end
        }
      )

      -- Helper
      use(
        {
          "max397574/better-escape.nvim",
          config = function()
            require("plugins.better-escape")
          end
        }
      )
      use(
        {
          "abecodes/tabout.nvim",
          config = function()
            require("plugins.tabout")
          end,
          wants = {"nvim-treesitter"},
          after = {"nvim-cmp"}
        }
      )
      use({"rmagatti/alternate-toggler"})
      use(
        {
          "AckslD/nvim-neoclip.lua",
          config = function()
            require("plugins.neoclip")
          end
        }
      )
      use("nathom/filetype.nvim")
      use("tpope/vim-surround")
      use("tpope/vim-repeat")
      use("tpope/vim-unimpaired")
      use("jiangmiao/auto-pairs")
      use("mattn/emmet-vim")
      use("matze/vim-move")
      use({"rrethy/vim-hexokinase", run = "make hexokinase"})
      use("tommcdo/vim-exchange")
      use({"kevinhwang91/nvim-bqf"})
      use({"APZelos/blamer.nvim"})
      use(
        {
          "rlane/pounce.nvim",
          config = function()
            require("plugins.pounce")
          end
        }
      )
      use("lewis6991/impatient.nvim")
      use(
        {
          "pianocomposer321/yabs.nvim",
          requires = {"nvim-lua/plenary.nvim"},
          config = function()
            require("plugins.yabs")
          end
        }
      )
      use(
        {
          "chentoast/marks.nvim",
          config = function()
            require("plugins.marks")
          end
        }
      )
      use(
        {
          "SmiteshP/nvim-gps",
          requires = "nvim-treesitter/nvim-treesitter",
          config = function()
            require("nvim-gps").setup()
          end
        }
      )
      use({"amadeus/vim-convert-color-to"})
      use({"windwp/nvim-spectre"})
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
