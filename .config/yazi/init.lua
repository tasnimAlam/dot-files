require("folder-rules"):setup()
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
require("git"):setup({
	-- Order of status signs showing in the linemode
	order = 1500,
})
