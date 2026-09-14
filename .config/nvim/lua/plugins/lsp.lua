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
	-- Pyright re-analyzes the file on every didChange. 150ms (the Neovim default)
	-- means a burst of full analyses while typing.
	flags = { debounce_text_changes = 500 },
	settings = {
		pyright = { disableOrganizeImports = true },
		python = {
			analysis = {
				-- Each completion request otherwise scans all of site-packages for
				-- auto-import candidates, once per character typed.
				autoImportCompletions = false,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

vim.lsp.config("ruff", {
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
})
