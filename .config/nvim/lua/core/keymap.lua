local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "
map("n", "<Leader>o", ":on<CR>", {})
map("n", "<Leader>w", ":w!<CR>", {})
map("n", "<Leader>q", ":q!<CR>", {})
-- map("n", "<Leader>p", "<cmd>lua vim.lsp.buf.format()<CR>", {})
map("n", "<Leader>p", "<cmd>lua require('conform').format()<CR>", {})
map("i", "<C-a>", "<C-o>^", {})
map("n", "<Esc>", ":noh<CR>", {})
map("i", "<C-e>", "<C-o>$", {})

-- Lsp mapping
-- map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {})
-- map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
-- map("n", "gr", "<cmd>lua require('trouble').toggle('lsp_references')<CR>", {})
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", {})
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", {})
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", {})
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", {})
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {})
map("n", "<space>rn", "<cmd>Lspsaga rename<CR>", {})
map("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", {})
-- map("n", "<space>e", "<cmd>Lspsaga show_line_diagnostics<CR>", {})
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {})
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", {})

-- Snippet config
map("i", "<C-j>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", { expr = true })
map("s", "<C-j>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", { expr = true })
map("i", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })
map("s", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })
map("i", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true })
map("s", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true })
map("i", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true })
map("s", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true })

-- Keep it center
map("n", "n", "nzzzv", {})
map("n", "<S-n>", "Nzzzv", {})

-- Tooggle config
map("n", "<Leader>t", ":ToggleAlternate<CR>", {})

-- Trouble config
map("n", "<Leader>d", "<cmd>lua require('trouble').toggle('diagnostics')<CR>", { silent = true, noremap = true })

-- Treehooper config
map("n", "<Leader>v", "<cmd>lua require('tsht').nodes()<CR>", { silent = true, noremap = true })

-- Clipboard
map("n", "<Leader>cc", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", {})

-- Undo break points
map("i", ",", ",<C-g>u", {})
map("i", ".", ".<C-g>u", {})
map("i", "!", "!<C-g>u", {})
map("i", "?", "?<C-g>u", {})

-- Lazy config
map("n", "<Leader>l", "<cmd>Lazy<CR>", { silent = true, noremap = true })

-- Git blame
map("n", "<Leader>bl", "<cmd>GitBlameToggle<CR>", { silent = true, noremap = true })

-- Auto completion config
map("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })
map("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', { expr = true })

-- Telescope and fzf config
-- map("n", "<space><space>", '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
map("n", "<leader><leader>", "<cmd>Telescope smart_open<CR>", { noremap = true, silent = true })
-- map(
-- 	"n",
-- 	"<Leader>fa",
-- 	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>",
-- 	{ noremap = true, silent = true }
-- )
map("n", "<Leader>ss", '<cmd>lua require("telescope.builtin").grep_string()<CR>', { noremap = true, silent = true })
map(
	"n",
	"<Leader>sl",
	'<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>',
	{ noremap = true }
)
map("n", "<Leader>/", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', { noremap = true })
-- map("n", "<A-p>", '<cmd>lua require("telescope").extensions.project.project{}<CR>', { noremap = true, silent = true })
-- map(
-- 	"n",
-- 	"<Leader>of",
-- 	'<cmd>lua require("telescope.builtin").oldfiles({hidden = true})<CR>',
-- 	{ noremap = true, silent = true }
-- )
map(
	"n",
	"<Leader>mf",
	'<cmd>lua require("telescope").extensions.media_files.media_files()<CR>',
	{ noremap = true, silent = true }
)

-- Buffer management
map("n", "<Leader>,", "<C-^>", {})
-- map("n", "<Leader>x", "<cmd>bd!<CR>", {})
map("n", "<Leader>X", "<cmd>bufdo bwipeout<CR>", { noremap = true })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<Leader>B", ":BufferLinePick<CR>", { silent = true })
map("n", "d>", ":BufferLineCloseRight<CR>", { silent = true })
map("n", "d<", ":BufferLineCloseLeft<CR>", { silent = true })
map("n", "g>", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "g<", ":BufferLineMovePrev<CR>", { silent = true })

-- Git config
map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", {})
map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", {})

-- Console log shortcut
map("i", "cll", "console.log()<ESC><S-f>(a", {})
map("v", "cll", "S(iconsole.log<ESC>", {})
map("n", "cll", "yiwocll<ESC>p", {})

-- Window movement
map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", {})
map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", {})
map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", {})
map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", {})

-- Debugger
-- map("n", "<Leader>B", "<cmd>lua require('dapui').toggle()<CR>", {})
-- map("n", "<F5>", "<cmd>lua require('dap').continue() <CR>", {})
-- map("n", "<F10>", "<cmd>lua require('dap').step_over() <CR>", {})
-- map("n", "<F11>", "<cmd>lua require('dap').step_into() <CR>", {})
-- map("n", "<F12>", "<cmd>lua require('dap').step_out() <CR>", {})
-- map("n", "<Leader>b", "<cmd>lua require('dap').toggle_breakpoint() <CR>", {})

-- Rest API test
map("n", "<Leader>tt", "<Plug>RestNvim<CR>", {})
map("n", "<Leader>tr", "<Plug>RestNvimLast<CR>", {})
map("n", "<Leader>tp", "<Plug>RestNvimPreview<CR>", {})

-- Noice
map("n", "<Leader>cl", "<cmd>Noice dismiss<CR>", {})

-- Before
map("n", "<C-A>", "<cmd>lua require('before').jump_to_last_edit()<CR>", {})
map("n", "<C-S>", "<cmd>lua require('before').jump_to_next_edit()<CR>", {})
map("n", "<Leader>oq", "<cmd>lua require('before').show_edits_in_quickfix()()<CR>", {})
map("n", "<Leader>oe", "<cmd>lua require('before').show_edits_in_telescope()<CR>", {})
