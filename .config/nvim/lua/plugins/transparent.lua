require("transparent").setup({
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = {
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		"NvimTreeNormal", -- NvimTree
		"TelescopeNormal",
		"TelescopeBorder",
		"FloatBorder",
	},
	exclude_groups = {}, -- table: groups you don't want to clear
})

require 'transparent'.clear_prefix("TabLine")
require 'transparent'.clear_prefix("WildMenu") -- possibly not necessary
