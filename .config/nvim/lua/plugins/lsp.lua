local nvim_lsp = require("lspconfig")

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
