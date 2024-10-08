require("lazy").setup({
	-- Lsp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			require("plugins.zero")
		end,
		branch = "v3.x",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { { "hrsh7th/cmp-nvim-lsp" } },
	},
	{ "yioneko/nvim-vtsls" },
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("plugins.lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ "onsails/lspkind-nvim" },
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.trouble")
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugins.conform-format")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("plugins.linter")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "nvim-lua/plenary.nvim" },

	-- Auto completion
	{
		"yioneko/nvim-cmp",
		branch = "perf",
		event = "InsertEnter",
		opts = function()
			local cmp = require("cmp")

			return {
				mapping = {
					["<c-n>"] = cmp.mapping.select_next_item(),
					["<c-p>"] = cmp.mapping.select_prev_item(),
					["<c-u>"] = cmp.mapping.scroll_docs(-4),
					["<c-d>"] = cmp.mapping.scroll_docs(4),
					["<c-y>"] = cmp.mapping.confirm({ select = true }),
					["<c-e>"] = cmp.mapping.abort(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "snippets" },
				}, {
					{ name = "buffer", keyword_length = 4 },
				}),
				formatting = {
					format = function(_, item)
						if vim.api.nvim_strwidth(item.abbr) > 30 then
							item.abbr = vim.fn.strcharpart(item.abbr, 0, 30) .. "…"
						end
						if vim.api.nvim_strwidth(item.menu or "") > 30 then
							item.menu = vim.fn.strcharpart(item.menu, 0, 30) .. "…"
						end
						return item
					end,
				},
			}
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"garymjr/nvim-snippets",
				opts = {},
			},
		},
		config = function()
			require("plugins.cmp")
		end,
	},
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-cmdline",
	-- 	},
	-- 	config = function()
	-- 		require("plugins.cmp")
	-- 	end,
	-- },
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp-tabnine")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "maxmellon/vim-jsx-pretty", ft = { "js", "jsx", "ts", "tsx" } },

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"akinsho/nvim-bufferline.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.buffer")
		end,
	},

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- Search related tools
	{ "junegunn/fzf", build = "./install --all" },
	{ "junegunn/fzf.vim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-project.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git",
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>M", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>J", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple toggle tags" },
			{ "<leader>K", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
			{ "<leader>j", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
			{ "<leader>k", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
			{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
			{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
			{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
			{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
		},
	},

	-- Snippets
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("typescript", { "javascript" })
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", ft = { "js", "jsx", "ts", "tsx" } },
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require('plugins.tokyo');
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[ colorscheme catppuccin-frappe]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- vim.cmd("colorscheme kanagawa")
		end,
	},

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
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
			"hrsh7th/nvim-cmp",
		},
		opt = true, -- Set this to true if the plugin is optional
		event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
		priority = 1000,
	},
	{
		"rmagatti/alternate-toggler",
		config = function()
			require("plugins.toggler")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
	},
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-unimpaired" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "mattn/emmet-vim" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "kevinhwang91/nvim-bqf" },
	{
		"f-person/git-blame.nvim",
		config = function()
			require("plugins.blame")
		end,
	},
	{ "stevearc/overseer.nvim", opts = {} },
	{
		"chentoast/marks.nvim",
		config = function()
			require("plugins.marks")
		end,
	},
	{ "amadeus/vim-convert-color-to" },
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = true,
		commit = "d9328ef903168b6f52385a751eb384ae7e906c6f",
		opts = {},
		config = function()
			require("plugins.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.notify")
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	},
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},

	-- -- Debugging
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	dependencies = {
	-- 		"theHamsta/nvim-dap-virtual-text",
	-- 		"rcarriga/nvim-dap-ui",
	-- 		"nvim-telescope/telescope-dap.nvim",
	-- 		{ "mxsdev/nvim-dap-vscode-js" },
	-- 		{
	-- 			"microsoft/vscode-js-debug",
	-- 			lazy = true,
	-- 			build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("config.dap")
	-- 	end,
	-- },
	{ "tasnimAlam/px2rem.lua" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
		},
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("plugins.transparent")
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("plugins.vim-tmux")
		end,
	},

	-- Rest API
	-- {
	-- 	"rest-nvim/rest.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("plugins.rest")
	-- 	end,
	-- },
	{
		"bloznelis/before.nvim",
		config = function()
			require("plugins.b4")
		end,
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		lazy = false,
		opts = { useDefaultKeymaps = true },
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({
				enabled = false,
			})
		end,
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "tris203/precognition.nvim" },
	-- {
	-- 	"https://git.sr.ht/~swaits/zellij-nav.nvim",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- 	keys = {
	-- 		{ "<c-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
	-- 		{ "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
	-- 		{ "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
	-- 		{ "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
	-- 	},
	-- 	opts = {},
	-- },
	{
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>S" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{ "voldikss/vim-floaterm" },
})
