-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- gutentag settings
-- vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]

vim.cmd([[call wilder#setup({'modes': [':', '/', '?']})]])

vim.cmd([[
	augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END
]])
