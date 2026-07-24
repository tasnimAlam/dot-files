-- Use sign instead of letter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Hide virtual text
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = { border = "single" },
})

-- Python: pyright for types/completion, ruff for lint/imports/formatting
vim.lsp.config("pyright", {
	settings = {
		pyright = { disableOrganizeImports = true },
	},
})

vim.lsp.config("ruff", {
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
})
