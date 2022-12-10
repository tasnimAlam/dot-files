return {
  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()
      require("luasnip").filetype_extend("typescript", { "javascript" })
    end,
  },
  ["mfussenegger/nvim-treehopper"] = {},
  ["NvChad/nvterm"] = { disable = true },
  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },
  ["junegunn/fzf"] = { run = "./install --all" },
  ["junegunn/fzf.vim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lsp"
    end,
  },
  -- ["nathom/filetype.nvim"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },
  ["folke/which-key.nvim"] = { disable = false },
  ["max397574/better-escape.nvim"] = {
    config = function()
      require "custom.plugins.better-escape"
    end,
  },

  ["tami5/lspsaga.nvim"] = {
    config = function()
      require "custom.plugins.lspsaga"
    end,
  },
  ["onsails/lspkind-nvim"] = {},
  ["jose-elias-alvarez/nvim-lsp-ts-utils"] = {},

  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "custom.plugins.trouble"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["gpanders/editorconfig.nvim"] = {},

  ["nvim-treesitter/nvim-treesitter"] = {
    config = function()
      require "plugins.configs.treesitter"
      require "custom.plugins.treesitter"
    end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
  -- ["hrsh7th/vim-vsnip"] = {},
  -- ["hrsh7th/cmp-vsnip"] = {},
  ["mbbill/undotree"] = { cmd = "UndotreeToggle" },
  ["numToStr/FTerm.nvim"] = {
    config = function()
      require "custom.plugins.fterm"
    end,
  },
  ["tpope/vim-surround"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-unimpaired"] = {},
}
