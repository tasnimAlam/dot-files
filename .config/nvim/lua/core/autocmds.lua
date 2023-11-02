-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Disable cmp on CmdWinEnter
vim.cmd([[
  autocmd CmdWinEnter * lua require('cmp').setup({enabled = false})
]])

-- Enable cmp on CmdWinLeave
vim.cmd([[
  autocmd CmdWinLeave * lua require('cmp').setup({enabled = true})
]])
