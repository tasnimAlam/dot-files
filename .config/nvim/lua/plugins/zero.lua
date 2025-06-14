require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "bashls", "pyright", "lua_ls" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		rust_analyzer = noop,
	},
})

vim.lsp.config("vtsls", {
	reuse_client = function()
		return true
	end,
})
