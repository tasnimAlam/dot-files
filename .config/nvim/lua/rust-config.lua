vim.api.nvim_command("autocmd BufWinEnter,WinEnter term://* startinsert")
vim.api.nvim_command("autocmd FileType rust nmap <buffer> <Leader>p :RustFmt<CR>")
vim.api.nvim_command("autocmd FileType rust map <buffer> <Leader>r :Cargo run<CR>")
vim.api.nvim_command("autocmd FileType rust map <buffer> <Leader>b :Cargo build<CR>")
