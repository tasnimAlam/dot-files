local saga = require("lspsaga")
saga.setup({
	code_action_icon = "",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = true,
	},
	ui = {
		code_action = "",
	},
})
