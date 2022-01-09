-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- gutentag settings
-- vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]

vim.cmd [[call wilder#setup({'modes': [':', '/', '?']})]]

-- format on save
-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.ts,*.html,*.py,*.rs,*.lua,*.scss,*.css FormatWrite
-- augroup END
-- ]],
--   true
-- )
