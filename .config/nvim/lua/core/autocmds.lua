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

-- console log shortcut
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		callback = function()
		vim.keymap.set("i", "cll", "console.log()<ESC><S-f>(a", { desc = "Console log" })
		vim.keymap.set("v", "cll", "S(iconsole.log<ESC>", { desc = "Console log" })
		vim.keymap.set("n", "cll", "yiwocll<ESC>p", { desc = "Console log" })
	end,
})

-- Px to rem convert
vim.api.nvim_create_user_command("Px", function(opt)
	if opt.args then
		local result = opt.args / 16
		print(string.format("%.2f rem", result))
	end
end, { nargs = 1 })
