local gps = require("nvim-gps")

require("lualine").setup({
	options = {
		-- theme = "kanagawa",
		theme = "tokyonight",
	},

	sections = {
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		},
	},
})
