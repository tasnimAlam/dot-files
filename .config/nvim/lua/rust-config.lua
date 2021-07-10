vim.api.nvim_command("autocmd BufWinEnter,WinEnter term://* startinsert")
vim.api.nvim_command("autocmd FileType rust nmap <buffer> <Leader>p :RustFmt<CR>")
vim.api.nvim_command("autocmd FileType rust map <buffer> <Leader>r :!cargo run<CR>")
vim.api.nvim_command("autocmd FileType rust map <buffer> <Leader>b :!cargo build<CR>")
