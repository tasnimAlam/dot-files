local utils = require("utils")
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ","
map("n", ",", "", {})

map("i", "<Leader>p", "<C-r>0", {})
map("n", "<Leader>o", ":on<CR>", {})
map("n", "<Leader>w", ":w!<CR>", {})
map("n", "<Leader>q", ":q!<CR>", {})
map("n", "<Leader>rw", ":Rg <C-R><C-W><CR>", {})
map("n", "<Leader>rg", ":Rg<CR>", {})
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
map("n", "<Leader>xx", "<cmd>TroubleToggle<CR>", {silent = true, noremap = true})

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
map("n", "<Leader>e", ":NvimTreeToggle<CR>", {})

-- Packer config
map("n", "<Leader>Pi", ":PackerInstall<CR>", {silent = true, noremap = true})
map("n", "<Leader>Pu", ":PackerUpdate<CR>", {silent = true, noremap = true})
map("n", "<Leader>Ps", ":PackerSync<CR>", {silent = true, noremap = true})

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
map("n", "<Space><Space>", '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
map("n", "<Leader>rg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', {noremap = true})
map("n", "<Leader>/", "<cmd>Telescope current_buffer_fuzzy_find <CR>", {})
map(
  "n",
  "<Leader>fp",
  '<cmd>lua require("telescope").extensions.project.project{}<CR>',
  {noremap = true, silent = true}
)

-- Buffer management
map("n", "<Leader>,", "<C-^>", {})
map("n", "<Leader>bd", ":bd<CR>", {})
map("n", "<Leader>bc", '<cmd>%bdelete|edit#|normal `"`<CR>', {noremap = true})
map("n", "[b", ":BufferLineCyclePrev<CR>", {silent = true})
map("n", "]b", ":BufferLineCycleNext<CR>", {silent = true})
map("n", "gb", ":BufferLinePick<CR>", {silent = true})
map("n", "gx", ":BufferLinePickClose<CR>", {silent = true})
map("n", "d<", ":BufferLineCloseLeft<CR>", {silent = true})
map("n", "d>", ":BufferLineCloseRight<CR>", {silent = true})
map("n", "g>", ":BufferLineMoveNext<CR>", {silent = true})
map("n", "g<", ":BufferLineMovePrev<CR>", {silent = true})

-- Git Config
map("n", "<Leader>g", ":FloatermNew --width=1.0 --height=1.0 --autoclose=2 lazygit<CR>", {})
map("n", "<Leader>cb", ":Telescope git_branches<CR>", {})
-- map("n", "<Leader>/", ":BLines<CR>", {})
-- map("n", "<Leader>/", ":BLines<CR>", {})
-- map(
--   "n",
--   "<C-p>",
--   'fugitive#head() != "" ? ":GFiles --cached --others --exclude-standard<CR>": ":Files<CR>"',
--   {expr = true}
-- )

-- Harpoon config
map("n", "<Leader>M", "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap = true})
map("n", "<Leader>m", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap = true})
map("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", {noremap = true})
map("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", {noremap = true})
map("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", {noremap = true})
map("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", {noremap = true})

-- Console log shortcut
map("i", "cll", "console.log()<ESC><S-f>(a", {})
map("v", "cll", "S(iconsole.log<ESC>", {})
map("n", "cll", "yiwocll<ESC>p", {})

-- Refactoring config
map(
  "v",
  "<Leader>re",
  "<Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
  {noremap = true, silent = true, expr = false}
)
map(
  "v",
  "<Leader>rf",
  "<Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
  {noremap = true, silent = true, expr = false}
)
map("v", "<Leader>rt", [[ <Esc><Cmd>lua M.refactors()<CR>]], {noremap = true, silent = true, expr = false})

-- Window movement
map("n", "<C-l>", '<cmd>lua require("utils").move_window("l")<CR>', {noremap = true})
map("n", "<C-h>", '<cmd>lua require("utils").move_window("h")<CR>', {noremap = true})
