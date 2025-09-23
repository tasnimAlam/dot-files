local function keymap(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = true
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
keymap("n", "<Leader>o", "<cmd>on<CR>", { silent = false, desc = "Only window" })
keymap("n", "<Leader>w", "<cmd>w!<CR>", { silent = false, desc = "Write" })
keymap("n", "<Leader>q", "<cmd>q!<CR>", { silent = false, desc = "Quit" })
keymap("n", "<Leader>p", "<cmd>lua require('conform').format()<CR>", { silent = false, desc = "Format" })
keymap("i", "<C-a>", "<C-o>^", { desc = "Start of line" })
keymap("n", "<Esc>", "<cmd>noh<CR>", { desc = "No highlight" })
keymap("i", "<C-e>", "<C-o>$", { desc = "End of line" })

-- Lsp mapping
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover doc" })
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })
keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { desc = "Add workspace" })
keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { desc = "Remove workspace" })
keymap(
	"n",
	"<space>wl",
	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
	{ desc = "List workspace" }
)
keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Type definition" })
keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
keymap("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code action" })
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev diagnostic" })
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })

-- Snippet config
keymap(
	"i",
	"<C-j>",
	"vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'",
	{ expr = true, noremap = false, desc = "Expand snippet" }
)
keymap(
	"s",
	"<C-j>",
	"vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'",
	{ expr = true, noremap = false, desc = "Expand snippet" }
)
keymap(
	"i",
	"<C-l>",
	"vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'",
	{ expr = true, noremap = false, desc = "Expand or jump" }
)
keymap(
	"s",
	"<C-l>",
	"vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'",
	{ expr = true, noremap = false, desc = "Expand or jump" }
)
keymap(
	"i",
	"<Tab>",
	"vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
	{ expr = true, noremap = false, desc = "Jump next" }
)
keymap(
	"s",
	"<Tab>",
	"vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
	{ expr = true, noremap = false, desc = "Jump next" }
)
keymap(
	"i",
	"<S-Tab>",
	"vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
	{ expr = true, noremap = false, desc = "Jump prev" }
)
keymap(
	"s",
	"<S-Tab>",
	"vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
	{ expr = true, noremap = false, desc = "Jump prev" }
)

-- Keep it center
keymap("n", "n", "nzzzv", { desc = "Next search center" })
keymap("n", "<S-n>", "Nzzzv", { desc = "Prev search center" })

-- Toggle config
keymap("n", "<Leader>t", "<cmd>ToggleAlternate<CR>", { desc = "Toggle alternate" })

-- Trouble config
keymap("n", "<Leader>d", "<cmd>lua require('trouble').toggle('diagnostics')<CR>", { desc = "Diagnostics" })

-- Treehooper config
keymap("n", "<Leader>v", "<cmd>lua require('tsht').nodes()<CR>", { desc = "Treehopper nodes" })

-- Undo break points
keymap("i", ",", ",<C-g>u", { desc = "Undo breakpoint" })
keymap("i", ".", ".<C-g>u", { desc = "Undo breakpoint" })
keymap("i", "!", "!<C-g>u", { desc = "Undo breakpoint" })
keymap("i", "?", "?<C-g>u", { desc = "Undo breakpoint" })

-- Lazy config
keymap("n", "<Leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Git blame
keymap("n", "<Leader>bl", "<cmd>GitBlameToggle<CR>", { desc = "Git blame" })

-- Auto completion config
keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, desc = "Completion next" })
keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true, desc = "Completion prev" })
keymap("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', { expr = true, desc = "Completion accept" })

-- File search and filter
keymap(
	"n",
	"<Leader>mf",
	'<cmd>lua Snacks.picker.files({ ft = {".mp4", ".mp3", ".jpg", ".png", ".gif", ".mkv"} })<CR>',
	{ desc = "Media files" }
)

-- Buffer management
keymap("n", "<Leader>,", "<C-^>", { desc = "Alternate buffer" })
keymap("n", "<Leader>X", "<cmd>bufdo bwipeout<CR>", { desc = "Close all" })

keymap("n", "<Leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
keymap("n", "d>", "<cmd>BufferLineCloseRight<CR>", { desc = "Close right" })
keymap("n", "d<", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close left" })
keymap("n", "g>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move next" })
keymap("n", "g<", "<cmd>BufferLineMovePrev<CR>", { desc = "Move prev" })

-- Git config
keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })

-- Window movement
keymap("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", { desc = "Navigate left" })
keymap("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", { desc = "Navigate up" })
keymap("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", { desc = "Navigate right" })
keymap("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", { desc = "Navigate down" })

-- Rest API test
keymap("n", "<Leader>tt", "<Plug>RestNvim<CR>", { noremap = false, desc = "REST test" })
keymap("n", "<Leader>tr", "<Plug>RestNvimLast<CR>", { noremap = false, desc = "REST last" })
keymap("n", "<Leader>tp", "<Plug>RestNvimPreview<CR>", { noremap = false, desc = "REST preview" })

-- Noice
keymap("n", "<Leader>cl", "<cmd>Noice dismiss<CR>", { desc = "Clear notifications" })

-- Find and replace
keymap("n", "<Leader>fr", "<cmd>GrugFar<CR>", { desc = "Find replace" })

-- Before
keymap("n", "<M-o>", "<cmd>lua require('before').jump_to_last_edit()<CR>", { desc = "Jump last edit" })
keymap("n", "<M-i>", "<cmd>lua require('before').jump_to_next_edit()<CR>", { desc = "Jump next edit" })
keymap("n", "<Leader>oq", "<cmd>lua require('before').show_edits_in_quickfix()()<CR>", { desc = "Show edits" })

-- Split join
keymap("n", "<Leader>m", "<cmd>lua require('treesj').toggle()<CR>", { desc = "Split join" })

-- Yank to system clipboard
keymap("n", "<leader>y", '"+y', { desc = "Yank" })
keymap("v", "<leader>y", '"+y', { desc = "Yank" })
keymap("n", "<leader>Y", '"+Y', { desc = "Yank line" })

-- Paste from system clipboard
keymap("n", "<leader>P", '"+p', { desc = "Paste" })
keymap("v", "<leader>P", '"+p', { desc = "Paste" })

-- Dart config
keymap("n", ";u", "<cmd>lua Dart.unmark({ type='all'})<CR>", { desc = "Dart unmark" })
