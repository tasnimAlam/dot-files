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

-- Find the interpreter for a project so pyright resolves its dependencies.
-- Without one it falls back to the python on PATH, which has no project packages
-- installed, and every third-party import is reported as unresolved.
-- The project-local venv is checked before $VIRTUAL_ENV on purpose: opening
-- project B from a shell with project A's venv activated should still resolve
-- against B.
local function venv_python(root)
	for _, dir in ipairs({ ".venv", "venv", "env" }) do
		local python = root .. "/" .. dir .. "/bin/python"
		if vim.uv.fs_stat(python) then
			return python
		end
	end
	if vim.env.VIRTUAL_ENV then
		return vim.env.VIRTUAL_ENV .. "/bin/python"
	end
end

-- Python: pyright for types/completion, ruff for lint/imports/formatting
vim.lsp.config("pyright", {
	-- Pyright re-analyzes the file on every didChange. 150ms (the Neovim default)
	-- means a burst of full analyses while typing.
	flags = { debounce_text_changes = 500 },
	settings = {
		pyright = { disableOrganizeImports = true },
	},
	before_init = function(_, config)
		local python = config.root_dir and venv_python(config.root_dir)
		if python then
			-- Mutate in place. vim.lsp.Client captures `config.settings` by reference
			-- when it is constructed, which happens before this callback runs, so
			-- reassigning config.settings here would never reach the client.
			config.settings.python =
				vim.tbl_deep_extend("force", config.settings.python or {}, { pythonPath = python })
		end
	end,
})

vim.lsp.config("ruff", {
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
})
