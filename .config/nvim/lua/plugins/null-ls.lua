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

-- local on_attach = function(client, bufnr)
	-- Format on save
	-- if client.resolved_capabilities.document_formatting then
	-- 	vim.cmd([[
 --            augroup LspFormatting
 --                autocmd! * <buffer>
 --                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
 --            augroup END
 --            ]])
	-- end
	 -- if client.server_capabilities.documentFormattingProvider then
  --           local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
  --           vim.api.nvim_create_autocmd(
  --               "BufWritePre",
  --               { buffer = bufnr, callback = vim.lsp.buf.formatting_sync, group = group }
  --           )
  --       end
-- end

-- local on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     vim.lsp.buf.formatting_sync()
--                 end,
--             })
--         end
--     end


local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(clients)
            -- filter out clients that you don't want to use
            return vim.tbl_filter(function(client)
                return client.name ~= "tsserver"
            end, clients)
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
