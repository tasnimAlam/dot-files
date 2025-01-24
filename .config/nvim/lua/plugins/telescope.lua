local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			horizontal = {
				width_padding = 0.1,
				height_padding = 0.1,
				preview_width = 0.5,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			},
		},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["<esc>"] = actions.close,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		media_files = {
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = { -- extend mappings
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
			},
		},
		ast_grep = {
			command = {
				"ast-grep",
				"--json=stream",
			}, -- must have --json and -p
			grep_open_files = false, -- search in opened files
			lang = nil, -- string value, specify language for ast-grep `nil` for default
		},
		import = {
			{
				insert_at_top = true,
				custom_languages = {
					{
						regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
						filetypes = { "typescript", "typescriptreact", "javascript", "react" },
						extensions = { "js", "ts" },
					},
				},
			},
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("media_files")
-- require("telescope").load_extension("dap")
-- require("telescope").load_extension("projects")
require("telescope").load_extension("live_grep_args")
-- require("telescope").load_extension("jsonfly")
