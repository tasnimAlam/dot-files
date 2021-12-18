-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- gutentag settings
-- vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]

vim.cmd [[call wilder#setup({'modes': [':', '/', '?']})]]
