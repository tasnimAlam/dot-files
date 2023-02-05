require("lazy").setup({
	-- Lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{

		"tami5/lspsaga.nvim",
		config = function()
			require("plugins.lspsaga")
		end,
	},
	{

		"onsails/lspkind-nvim",
	},
	{

		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},
	{

		"simrat39/rust-tools.nvim",
		ft = { "rs" },
	},
	{

		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.trouble")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null-ls")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	},
	{ "nvim-lua/plenary.nvim" },

	{ "gpanders/editorconfig.nvim" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"octaltree/cmp-look",
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"maxmellon/vim-jsx-pretty",
		ft = { "js", "jsx", "ts", "tsx" },
	},

	{ "windwp/nvim-ts-autotag" },
	{ "maxmellon/vim-jsx-pretty", ft = { "js", "jsx", "ts", "tsx" } },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"akinsho/nvim-bufferline.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{ "kyazdani42/nvim-web-devicons" },

	{ "junegunn/fzf", build = "./install --all" },
	{ "junegunn/fzf.vim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, cmd = "Telescope" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "nvim-telescope/telescope-project.nvim" },

	-- Snippets
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/cmp-vsnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "js", "jsx", "ts", "tsx" } },

	-- Theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "rebelot/kanagawa.nvim" },

	-- Terminal
	{
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{
		"numToStr/FTerm.nvim",
		config = function()
			require("plugins.fterm")
		end,
	},

	-- Navigation and search
	{ "mfussenegger/nvim-treehopper" },
	{
		"gelguy/wilder.nvim",
		build = "UpdateRemotePlugins",
		config = function()
			require("plugins.wilder")
		end,
	},
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.alpha")
		end,
	},

	-- Helper
	{
		"max397574/better-escape.nvim",
		config = function()
			require("plugins.better-escape")
		end,
	},
	{
		"abecodes/tabout.nvim",
		config = function()
			require("plugins.tabout")
		end,
		dependencies = { "nvim-treesitter", "nvim-cmp" },
	},
	{ "rmagatti/alternate-toggler" },
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("plugins.neoclip")
		end,
	},
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-unimpaired" },
	{ "jiangmiao/auto-pairs" },
	{ "mattn/emmet-vim" },
	{ "matze/vim-move" },
	{ "rrethy/vim-hexokinase", build = "make hexokinase" },
	{ "tommcdo/vim-exchange" },
	{ "kevinhwang91/nvim-bqf" },
	{ "APZelos/blamer.nvim" },
	{
		"rlane/pounce.nvim",
		config = function()
			require("plugins.pounce")
		end,
	},
	{ "lewis6991/impatient.nvim" },
	{
		"pianocomposer321/yabs.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.yabs")
		end,
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("plugins.marks")
		end,
	},
	{
		"SmiteshP/nvim-gps",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-gps").setup()
		end,
	},
	{ "amadeus/vim-convert-color-to" },
	{ "ellisonleao/glow.nvim" },
})
