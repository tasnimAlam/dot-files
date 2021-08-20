vim.api.nvim_exec(
  [[
		autocmd BufWinEnter,WinEnter term://* startinsert
		autocmd FileType rust map <buffer> <Leader>r :!cargo run<CR>
		autocmd FileType rust map <buffer> <Leader>b :!cargo build<CR>
		autocmd FileType rust map <buffer> <Leader>t :!cargo test<CR>
	]],
  true
)
