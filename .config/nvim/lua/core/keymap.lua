local api = vim.api

local function map(mode, lhs, rhs, opts)
	local defaults = { noremap = true, silent = true }
	opts = vim.tbl_extend("force", defaults, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

local function safe_require(mod)
	local ok, loaded = pcall(require, mod)
	if ok then
		return loaded
	end
end

vim.g.mapleader = " "

-- Essentials
map("n", "<Leader>o", "<cmd>on<CR>", { silent = false, desc = "Only window" })
map("n", "<Leader>w", "<cmd>w!<CR>", { silent = false, desc = "Write" })
map("n", "<Leader>q", "<cmd>q!<CR>", { silent = false, desc = "Quit" })
map("n", "<Leader>p", function()
	local conform = safe_require("conform")
	if conform then
		conform.format()
	end
end, { silent = false, desc = "Format" })
map("i", "<C-a>", "<C-o>^", { desc = "Start of line" })
map("i", "<C-e>", "<C-o>$", { desc = "End of line" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "No highlight" })

-- Keep search results centered
map("n", "n", "nzzzv", { desc = "Next search center" })
map("n", "<S-n>", "Nzzzv", { desc = "Prev search center" })

-- Toggle config
map("n", "<Leader>t", "<cmd>ToggleAlternate<CR>", { desc = "Toggle alternate" })

-- Trouble
map("n", "<Leader>d", function()
	local trouble = safe_require("trouble")
	if trouble then
		trouble.toggle("diagnostics")
	end
end, { desc = "Diagnostics" })

-- Treehopper
map("n", "<Leader>v", function()
	local tsht = safe_require("tsht")
	if tsht then
		tsht.nodes()
	end
end, { desc = "Treehopper nodes" })

-- Undo breakpoints
map("i", ",", ",<C-g>u", { desc = "Undo breakpoint" })
map("i", ".", ".<C-g>u", { desc = "Undo breakpoint" })
map("i", "!", "!<C-g>u", { desc = "Undo breakpoint" })
map("i", "?", "?<C-g>u", { desc = "Undo breakpoint" })

-- Lazy
map("n", "<Leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Git blame
map("n", "<Leader>bl", "<cmd>GitBlameToggle<CR>", { desc = "Git blame" })

-- File search and filter
map("n", "<Leader>mf", function()
	if Snacks and Snacks.picker then
		Snacks.picker.files({ ft = { ".mp4", ".mp3", ".jpg", ".png", ".gif", ".mkv" } })
	end
end, { desc = "Media files" })

-- Buffer management
map("n", "<Leader>,", "<C-^>", { desc = "Alternate buffer" })
map("n", "<Leader>X", "<cmd>bufdo bwipeout<CR>", { desc = "Close all" })
map("n", "<Leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
map("n", "d>", "<cmd>BufferLineCloseRight<CR>", { desc = "Close right" })
map("n", "d<", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close left" })
map("n", "g>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move next" })
map("n", "g<", "<cmd>BufferLineMovePrev<CR>", { desc = "Move prev" })

-- Git
map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })

-- Window movement
map("n", "<C-h>", function()
	local nav = safe_require("Navigator")
	if nav then
		nav.left()
	end
end, { desc = "Navigate left" })
map("n", "<C-k>", function()
	local nav = safe_require("Navigator")
	if nav then
		nav.up()
	end
end, { desc = "Navigate up" })
map("n", "<C-l>", function()
	local nav = safe_require("Navigator")
	if nav then
		nav.right()
	end
end, { desc = "Navigate right" })
map("n", "<C-j>", function()
	local nav = safe_require("Navigator")
	if nav then
		nav.down()
	end
end, { desc = "Navigate down" })

-- Rest API test
map("n", "<Leader>tt", "<Plug>RestNvim<CR>", { noremap = false, desc = "REST test" })
map("n", "<Leader>tr", "<Plug>RestNvimLast<CR>", { noremap = false, desc = "REST last" })
map("n", "<Leader>tp", "<Plug>RestNvimPreview<CR>", { noremap = false, desc = "REST preview" })

-- Noice
map("n", "<Leader>cl", "<cmd>Noice dismiss<CR>", { desc = "Clear notifications" })

-- Find and replace
map("n", "<Leader>fr", "<cmd>GrugFar<CR>", { desc = "Find replace" })

-- Before
map("n", "<M-o>", function()
	local before = safe_require("before")
	if before then
		before.jump_to_last_edit()
	end
end, { desc = "Jump last edit" })
map("n", "<M-i>", function()
	local before = safe_require("before")
	if before then
		before.jump_to_next_edit()
	end
end, { desc = "Jump next edit" })
map("n", "<Leader>oq", function()
	local before = safe_require("before")
	if before then
		before.show_edits_in_quickfix()
	end
end, { desc = "Show edits" })

-- Split join
map("n", "<Leader>m", function()
	local treesj = safe_require("treesj")
	if treesj then
		treesj.toggle()
	end
end, { desc = "Split join" })

-- Yank to system clipboard
map("n", "<leader>y", '"+y', { desc = "Yank" })
map("v", "<leader>y", '"+y', { desc = "Yank" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line" })

-- Paste from system clipboard
map("n", "<leader>P", '"+p', { desc = "Paste" })
map("v", "<leader>P", '"+p', { desc = "Paste" })

-- Dart
map("n", ";u", function()
	if Dart and Dart.unmark then
		Dart.unmark({ type = "all" })
	end
end, { desc = "Dart unmark" })

-- LSP (buffer-local)
local lsp_group = api.nvim_create_augroup("core_lsp_keymaps", { clear = true })
api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,
	desc = "Core LSP keymaps",
	callback = function(ev)
		local opts = { buffer = ev.buf }

		map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
		map(
			"n",
			"<space>wa",
			vim.lsp.buf.add_workspace_folder,
			vim.tbl_extend("force", opts, { desc = "Add workspace" })
		)
		map(
			"n",
			"<space>wr",
			vim.lsp.buf.remove_workspace_folder,
			vim.tbl_extend("force", opts, { desc = "Remove workspace" })
		)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, vim.tbl_extend("force", opts, { desc = "List workspace" }))
		map("n", "<space>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Type definition" }))

		map("n", "K", "<cmd>Lspsaga hover_doc<CR>", vim.tbl_extend("force", opts, { desc = "Hover doc" }))
		map("n", "<space>rn", "<cmd>Lspsaga rename<CR>", vim.tbl_extend("force", opts, { desc = "Rename" }))
		map("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", vim.tbl_extend("force", opts, { desc = "Code action" }))
		map(
			"n",
			"[d",
			"<cmd>Lspsaga diagnostic_jump_prev<CR>",
			vim.tbl_extend("force", opts, { desc = "Prev diagnostic" })
		)
		map(
			"n",
			"]d",
			"<cmd>Lspsaga diagnostic_jump_next<CR>",
			vim.tbl_extend("force", opts, { desc = "Next diagnostic" })
		)
	end,
})
