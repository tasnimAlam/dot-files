local nvim_lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- local on_attach = function(client, bufnr)
-- 	local function buf_set_option(...)
-- 		vim.api.nvim_buf_set_option(bufnr, ...)
-- 	end
--
-- 	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = { "bashls", "pyright", "rust-analyzer", "prismals", "lua_ls" }
-- for _, lsp in ipairs(servers) do
-- 	nvim_lsp[lsp].setup({
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	})
-- end

-- Use sign instead of letter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Hide virtual texty
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = { border = "single" },
})
