local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = { "bashls", "pyright", "angularls", "lua_ls" },
	handlers = {
		lsp_zero.default_setup,
	},
})

mason_lspconfig.setup_handlers({
	["rust_analyzer"] = function() end,
})

-- require("lspconfig.configs").vtsls = require("vtsls").lspconfig
-- require("lspconfig").vtsls.setup({})

vim.g.rustaceanvim = {
	server = {
		cmd = function()
			local mason_registry = require("mason-registry")
			local ra_binary = mason_registry.is_installed("rust-analyzer")
					-- This may need to be tweaked, depending on the operating system.
					and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
				or "rust-analyzer"
			return { ra_binary } -- You can add args to the list, such as '--log-file'
		end,
	},
}
