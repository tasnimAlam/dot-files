local api = vim.api

local augroup = api.nvim_create_augroup("core_autocmds", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

api.nvim_create_autocmd("FileType", {
	group = augroup,
	desc = "JS/TS console.log shortcut",
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	callback = function(ev)
		local opts = { buffer = ev.buf, desc = "Console log" }
		vim.keymap.set("i", "cll", "console.log()<ESC><S-f>(a", opts)
		vim.keymap.set("v", "cll", "S(iconsole.log<ESC>", opts)
		vim.keymap.set("n", "cll", "yiwocll<ESC>p", opts)
	end,
})

api.nvim_create_user_command("Px", function(opt)
	local px = tonumber(opt.args)
	if not px then
		vim.notify("Px: provide a number (e.g. :Px 16)", vim.log.levels.ERROR)
		return
	end

	vim.notify(string.format("%.2f rem", px / 16))
end, { nargs = 1, desc = "Convert px to rem" })
