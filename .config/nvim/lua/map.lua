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
map("n", "<S-y>", "y$", {})
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
-- map("n", "<Leader>1", ":PackerInstall<CR>", {silent = true, noremap = true})
-- map("n", "<Leader>2", ":PackerUpdate<CR>", {silent = true, noremap = true})
-- map("n", "<Leader>3", ":PackerClean<CR>", {silent = true, noremap = true})
-- map("n", "<Leader>4", ":PackerSync<CR>", {silent = true, noremap = true})

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
map("n", "<Leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
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
-- map("n", "bc", ":BufferLinePickClose<CR>", {silent = true})
map("n", "g>", ":BufferLineMoveNext<CR>", {silent = true})
map("n", "g<", ":BufferLineMovePrev<CR>", {silent = true})
map("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer1<CR>", {silent = true})
map("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer2<CR>", {silent = true})
map("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer3<CR>", {silent = true})
map("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer4<CR>", {silent = true})
map("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer5<CR>", {silent = true})
map("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer6<CR>", {silent = true})
map("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer7<CR>", {silent = true})
map("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer8<CR>", {silent = true})
map("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer9<CR>", {silent = true})

-- Git Config
map("n", "<Leader>g", ":FloatermNew --width=1.0 --height=1.0 --autoclose=2 lazygit<CR>", {})
map("n", "<Leader>/", ":BLines<CR>", {})
map(
  "n",
  "<C-p>",
  'fugitive#head() != "" ? ":GFiles --cached --others --exclude-standard<CR>": ":Files<CR>"',
  {expr = true}
)
-- TODO: make it lua function
-- vim.api.nvim_exec([[ let g:nremap = {'=': '<TAB>'} ]], true)

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
