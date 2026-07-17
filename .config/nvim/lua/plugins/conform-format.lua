require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		css = { "prettierd" },
		scss = { "prettierd" },
		html = { "prettierd" },
		yaml = { "prettierd" },
		htmlangular = { "prettierd" },
		rust = { "rustfmt" },
		go = { "goimports", "gofmt" },
	},
})
