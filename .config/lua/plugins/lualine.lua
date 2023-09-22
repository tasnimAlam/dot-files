require("lualine").setup({
	options = {
		-- theme = "kanagawa",
		theme = "tokyonight",
	},
	sections = {
		lualine_b = {
			{
				require("grapple").key,
				cond = require("grapple").exists,
			},
		},
	},
})
