local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})

local mason_lspconfig = require("mason-lspconfig");
mason_lspconfig.setup({
	ensure_installed = { "tsserver", "bashls", "pyright", "angularls", "lua_ls" },
	handlers = {
		lsp_zero.default_setup,
	},
})

mason_lspconfig.setup_handlers {
	['rust_analyzer'] = function() end,
}
