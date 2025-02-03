-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

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

-- console log shortcut
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	callback = function()
		vim.api.nvim_set_keymap("i", "cll", "console.log()<ESC><S-f>(a", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("v", "cll", "S(iconsole.log<ESC>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "cll", "yiwocll<ESC>p", { noremap = true, silent = true })
	end,
})

-- Px to rem convert
	vim.api.nvim_create_user_command("Px", function(opt)
	if opt.args then
		local result = opt.args / 16
		print(string.format("%.2f rem", result))
	end
end, { nargs = 1 })

