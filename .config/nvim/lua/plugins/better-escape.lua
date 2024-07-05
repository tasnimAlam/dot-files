require("better_escape").setup({
	timeout = vim.o.timeoutlen,
	mappings = {
		i = {
			k = {
				k = "<Esc>",
				j = "<Esc>",
			},
		},
	},
})
