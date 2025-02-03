local fterm = require("FTerm")

local lazygit = fterm:new({
	ft = "fterm_lazygit",
	cmd = "lazygit",
	dimensions = {
		height = 8.0,
		width = 8.0,
	},
})

local nnn = fterm:new({
	ft = "fterm_nnn",
	cmd = "nnn",
	dimensions = {
		height = 0.7,
		width = 0.7,
	},
})

local yazi = fterm:new({
	ft = "fterm_yazi",
	cmd = "yazi",
	dimensions = {
		height = 1.0,
		width = 1.0,
	},
})

-- vim.keymap.set("n", "<Leader>g", function()
-- 	lazygit:toggle()
-- end)

vim.keymap.set("n", "<Leader>n", function()
	nnn:toggle()
end)

vim.keymap.set("n", "<Leader>y", function()
	yazi:toggle()
end)
