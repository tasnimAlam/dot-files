-- nvim-treesitter `main` branch (Neovim 0.11+/0.12).
--
-- The `main` branch dropped `require("nvim-treesitter.configs").setup{}` and all
-- of its module system. Highlighting, indentation and parser installation now
-- live in the plugin `init` (see lua/plugins/lazy-nvim.lua). What remains here is
-- text objects (moved to the `main` branch of nvim-treesitter-textobjects, which
-- no longer wires up keymaps for you) and native treesitter folding.
--
-- Gone with the `master` branch and intentionally not ported:
--   * `rainbow`              -> use HiPhish/rainbow-delimiters.nvim if wanted
--   * `incremental_selection`-> removed from `main`, no built-in replacement

require("nvim-treesitter-textobjects").setup({
	select = {
		-- Jump forward to the textobject if the cursor is not already inside one.
		lookahead = true,
		selection_modes = {
			["@function.outer"] = "V",
			["@class.outer"] = "V",
		},
	},
	move = {
		set_jumps = true, -- record moves in the jumplist
	},
})

local select = require("nvim-treesitter-textobjects.select")
local swap = require("nvim-treesitter-textobjects.swap")
local move = require("nvim-treesitter-textobjects.move")

-- Select ----------------------------------------------------------------------
-- Capture groups come from textobjects.scm queries.
local select_keymaps = {
	["af"] = "@function.outer",
	["if"] = "@function.inner",
	["ac"] = "@class.outer",
	["ic"] = "@class.inner",
	["al"] = "@loop.inner",
}
for lhs, query in pairs(select_keymaps) do
	vim.keymap.set({ "x", "o" }, lhs, function()
		select.select_textobject(query, "textobjects")
	end, { desc = "Select " .. query })
end

-- Swap ------------------------------------------------------------------------
vim.keymap.set("n", "<leader>a", function()
	swap.swap_next("@parameter.inner")
end, { desc = "Swap next parameter" })
vim.keymap.set("n", "<leader>A", function()
	swap.swap_previous("@parameter.inner")
end, { desc = "Swap previous parameter" })

-- Move ------------------------------------------------------------------------
-- { lhs = { query, query_group } }
local move_keymaps = {
	goto_next_start = {
		["]m"] = { "@function.outer", "textobjects" },
		["]s"] = { "@local.scope", "locals" },
	},
	goto_next_end = {
		["]M"] = { "@function.outer", "textobjects" },
	},
	goto_previous_start = {
		["[m"] = { "@function.outer", "textobjects" },
		["[s"] = { "@local.scope", "locals" },
	},
	goto_previous_end = {
		["[M"] = { "@function.outer", "textobjects" },
	},
}
for fn, maps in pairs(move_keymaps) do
	for lhs, spec in pairs(maps) do
		vim.keymap.set({ "n", "x", "o" }, lhs, function()
			move[fn](spec[1], spec[2])
		end, { desc = fn .. " " .. spec[1] })
	end
end

-- Folding ---------------------------------------------------------------------
-- Native treesitter folding replaces the old `nvim_treesitter#foldexpr()`.
-- `foldmethod`/`foldlevel` are set in lua/core/settings.lua.
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
