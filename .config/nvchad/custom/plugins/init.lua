return {
  ["nathom/filetype.nvim"] = {},
  ["goolord/alpha-nvim"] = { disable = false },
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
