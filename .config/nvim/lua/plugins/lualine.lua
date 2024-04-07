require("lualine").setup({
	options = {
		theme = "catppuccin",
		-- theme = "kanagawa",
		 -- theme = "tokyonight",
	},
	sections = {
        lualine_b = { "grapple"},
        lualine_c = { "branch" }
    }
})
