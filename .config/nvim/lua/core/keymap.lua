local utils = require("core.utils")
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ","
map("n", ",", "", {})

map("i", "<Leader>p", "<C-r>0", {})
map("n", "<Leader>o", ":on<CR>", {})
map("n", "<Leader>w", ":w!<CR>", {})
map("n", "<Leader>q", ":q!<CR>", {})
map("n", "<Leader>p", "<Cmd>Format<CR>", {})
map("n", "<Leader>n", ":FloatermNew! nnn<CR>", {})
map("n", "<S-h>", ":noh<CR>", {})
map("i", "<C-a>", "<C-o>0", {})
map("i", "<C-e>", "<C-o>$", {})

-- Snippet config
map("i", "<C-j>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", {expr = true})
map("s", "<C-j>", "vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'", {expr = true})
map("i", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})
map("s", "<C-l>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", {expr = true})
map("i", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", {expr = true})
map("s", "<Tab>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'", {expr = true})
map("i", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true})
map("s", "<S-Tab>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'", {expr = true})

-- Keep it center
map("n", "n", "nzzzv", {})
map("n", "<S-n>", "Nzzzv", {})

-- Toggle boolean
map("n", "<Leader>t", ":ToggleAlternate<CR>", {})

-- Trouble config
map("n", "<Leader>d", "<cmd>TroubleToggle<CR>", {silent = true, noremap = true})

-- Clipboard
map("n", "<Leader>cc", ":lua require('telescope').extensions.neoclip.default()<CR>", {})

-- Undo break points
map("i", ",", ",<C-g>u", {})
map("i", ".", ".<C-g>u", {})
map("i", "!", "!<C-g>u", {})
map("i", "?", "?<C-g>u", {})

-- Undotree config
map("n", "<Leader>u", ":UndotreeToggle | :UndotreeFocus<CR>", {})

-- Nvim tree config
map("n", "<leader>e", ":NvimTreeToggle<CR>", {})

-- Packer config
map("n", "<Leader>1", ":PackerInstall<CR>", {silent = true, noremap = true})
map("n", "<Leader>2", ":PackerUpdate<CR>", {silent = true, noremap = true})
map("n", "<Leader>3", ":PackerClean<CR>", {silent = true, noremap = true})
map("n", "<Leader>4", ":PackerSync<CR>", {silent = true, noremap = true})

-- Vim move config
map("n", "∆", ":m .+1<CR>", {silent = true, noremap = true})
map("n", "˚", ":m .-2<CR>", {silent = true, noremap = true})
map("v", "˚", ":m '<-2<CR>gv=gv", {silent = true, noremap = true})
map("v", "∆", ":m '>+1<CR>gv=gv", {silent = true, noremap = true})

-- Auto completion config
map("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
map("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})
map("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', {expr = true})

-- Telescope config
map("n", "<space><space>", '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
map("n", "rg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', {noremap = true})
map("n", "rw", '<cmd>lua require("telescope.builtin").grep_string()<CR><C-R><C-W>', {noremap = true})
map("n", "<C-p>", '<cmd>lua require("telescope").extensions.project.project{}<CR>', {noremap = true, silent = true})
map(
  "n",
  "<Leader>fm",
  '<cmd>lua require("telescope").extensions.media_files.media_files()<CR>',
  {noremap = true, silent = true}
)

-- Buffer management
map("n", "<Leader>,", "<C-^>", {})
map("n", "<Leader>x", ":bd!<CR>", {})
map("n", "<Leader>bc", '<cmd>%bdelete|edit#|normal `"`<CR>', {noremap = true})
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {silent = true})
map("n", "<Tab>", ":BufferLineCycleNext<CR>", {silent = true})
map("n", "gb", ":BufferLinePick<CR>", {silent = true})
map("n", "d>", ":BufferLineCloseRight<CR>", {silent = true})
map("n", "d<", ":BufferLineCloseLeft<CR>", {silent = true})
-- map("n", "bc", ":BufferLinePickClose<CR>", {silent = true})
map("n", "g>", ":BufferLineMoveNext<CR>", {silent = true})
map("n", "g<", ":BufferLineMovePrev<CR>", {silent = true})

-- Harpoon config
-- map("n", "<Leader>M", "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap = true})
-- map("n", "<Leader>m", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap = true})
-- map("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", {noremap = true})
-- map("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", {noremap = true})
-- map("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", {noremap = true})
-- map("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", {noremap = true})

-- Harpoon config
map("n", "<Leader>M", "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap = true})
map("n", "<Leader>m", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap = true})
map("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", {noremap = true})
map("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", {noremap = true})
map("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", {noremap = true})
map("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", {noremap = true})

-- Git config
map("n", "<Leader>g", ":FloatermNew --width=1.0 --height=1.0 --autoclose=2 lazygit<CR>", {})
map("n", "<Leader>/", ":BLines<CR>", {})
-- TODO: make it lua function
-- vim.api.nvim_exec([[ let g:nremap = {'=': '<TAB>'} ]], true)

-- Console log shortcut
map("i", "cll", "console.log()<ESC><S-f>(a", {})
map("v", "cll", "S(iconsole.log<ESC>", {})
map("n", "cll", "yiwocll<ESC>p", {})

-- Window movement
map("n", "<C-l>", '<cmd>lua require("core.utils").move_window("l")<CR>', {noremap = true})
map("n", "<C-h>", '<cmd>lua require("core.utils").move_window("h")<CR>', {noremap = true})
