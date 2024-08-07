local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local sources = {
	formatting.prettierd,
	formatting.fish_indent,
	formatting.shfmt,
	formatting.rustfmt,
	formatting.stylua,
	formatting.black,
	formatting.stylish_haskell,
}

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		
		-- Format buffer on save 
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	group = augroup,
		-- 	buffer = bufnr,
		-- 	callback = function()
		-- 		vim.lsp.buf.format({ bufnr = bufnr })
		-- 	end,
		-- })
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
