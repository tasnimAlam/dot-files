require("better_escape").setup({
	timeout = vim.o.timeoutlen,
	default_mappings = true,
	mappings = {
		i = {
			k = {
				j = "<Esc>",
			},
		},
	},
})
