local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
keymap("n", "<Leader>o", "<cmd>on<CR>", { silent = false })
keymap("n", "<Leader>w", "<cmd>w!<CR>", { silent = false })
keymap("n", "<Leader>q", "<cmd>q!<CR>", { silent = false })
keymap("n", "<Leader>p", "<cmd>lua require('conform').format()<CR>", { silent = false })
keymap("i", "<C-a>", "<C-o>^", {})
keymap("n", "<Esc>", "<cmd>noh<CR>")
keymap("i", "<C-e>", "<C-o>$", {})

-- Lsp mapping
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>")
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>")
keymap("n", "<space>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Snippet config
keymap("i", "<C-j>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", { expr = true, noremap = false })
keymap("s", "<C-j>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", { expr = true, noremap = false })
keymap("i", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true, noremap = false })
keymap("s", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true, noremap = false })
keymap("i", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true, noremap = false })
keymap("s", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", { expr = true, noremap = false })
keymap("i", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true, noremap = false })
keymap("s", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", { expr = true, noremap = false })

-- Keep it center
keymap("n", "n", "nzzzv", {})
keymap("n", "<S-n>", "Nzzzv", {})

-- Tooggle config
keymap("n", "<Leader>t", "<cmd>ToggleAlternate<CR>")

-- Trouble config
keymap("n", "<Leader>d", "<cmd>lua require('trouble').toggle('diagnostics')<CR>")

-- Treehooper config
keymap("n", "<Leader>v", "<cmd>lua require('tsht').nodes()<CR>")

-- Clipboard
keymap("n", "<Leader>cc", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>")

-- Undo break points
keymap("i", ",", ",<C-g>u", {})
keymap("i", ".", ".<C-g>u", {})
keymap("i", "!", "!<C-g>u", {})
keymap("i", "?", "?<C-g>u", {})

-- Lazy config
keymap("n", "<Leader>l", "<cmd>Lazy<CR>")

-- Git blame
keymap("n", "<Leader>bl", "<cmd>GitBlameToggle<CR>")

-- Auto completion config
keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })
keymap("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', { expr = true })

-- Telescope and fzf config
keymap("n", "<Leader>mf", '<cmd>lua require("telescope").extensions.media_files.media_files()<CR>')

-- Buffer management
keymap("n", "<Leader>,", "<C-^>", {})
keymap("n", "<Leader>X", "<cmd>bufdo bwipeout<CR>")

keymap("n", "<Leader>B", "<cmd>BufferLinePick<CR>")
keymap("n", "d>", "<cmd>BufferLineCloseRight<CR>")
keymap("n", "d<", "<cmd>BufferLineCloseLeft<CR>")
keymap("n", "g>", "<cmd>BufferLineMoveNext<CR>")
keymap("n", "g<", "<cmd>BufferLineMovePrev<CR>")

-- Git config
keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>")
keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>")

-- Window movement
keymap("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>")
keymap("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>")
keymap("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>")
keymap("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>")

-- Debugger
-- keymap("n", "<Leader>B", "<cmd>lua require('dapui').toggle()<CR>")
-- keymap("n", "<F5>", "<cmd>lua require('dap').continue() <CR>")
-- keymap("n", "<F10>", "<cmd>lua require('dap').step_over() <CR>")
-- keymap("n", "<F11>", "<cmd>lua require('dap').step_into() <CR>")
-- keymap("n", "<F12>", "<cmd>lua require('dap').step_out() <CR>")
-- keymap("n", "<Leader>b", "<cmd>lua require('dap').toggle_breakpoint() <CR>")

-- Rest API test
keymap("n", "<Leader>tt", "<Plug>RestNvim<CR>", { noremap = false })
keymap("n", "<Leader>tr", "<Plug>RestNvimLast<CR>", { noremap = false })
keymap("n", "<Leader>tp", "<Plug>RestNvimPreview<CR>", { noremap = false })

-- Noice
keymap("n", "<Leader>cl", "<cmd>Noice dismiss<CR>")

-- Find and replace
keymap("n", "<Leader>fr", "<cmd>GrugFar<CR>")

-- Before
keymap("n", "<C-A>", "<cmd>lua require('before').jump_to_last_edit()<CR>")
keymap("n", "<C-S>", "<cmd>lua require('before').jump_to_next_edit()<CR>")
keymap("n", "<Leader>oq", "<cmd>lua require('before').show_edits_in_quickfix()()<CR>")
keymap("n", "<Leader>oe", "<cmd>lua require('before').show_edits_in_telescope()<CR>")

-- Split join
keymap("n", "<Leader>m", "<cmd>lua require('treesj').toggle()<CR>")

-- Yank to system clipboard
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+Y')

-- Paste from system clipboard
keymap("n", "<leader>P", '"+p')
keymap("v", "<leader>P", '"+p')
