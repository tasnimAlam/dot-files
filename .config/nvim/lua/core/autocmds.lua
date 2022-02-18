-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- gutentag settings
-- vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]

vim.cmd([[call wilder#setup({'modes': [':', '/', '?']})]])

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
