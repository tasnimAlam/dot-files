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

-- Enable hyprland treesitter
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.hl", "hypr*.conf" },
	callback = function(event)
		print(string.format("starting hyprls for %s", vim.inspect(event)))
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
