local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local sources = {
	formatting.prettierd,
	formatting.fish_indent,
	formatting.shfmt,
	formatting.rustfmt,
	formatting.stylua,
	formatting.black,
}

local on_attach = function(client)
	-- Format on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
            ]])
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
