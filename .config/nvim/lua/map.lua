local utils = require("utils")
local map = vim.api.nvim_set_keymap

map("n", ",", "", {})
vim.g.mapleader = ","

map("i", "<Leader>p", "<C-r>0", {})
map("n", "<Leader>o", ":on<CR>", {})
map("n", "<Leader>w", ":w!<CR>", {})
map("n", "<Leader>q", ":q!<CR>", {})
map("n", "<Leader>rw", ":Rg <C-R><C-W><CR>", {})
map("n", "<Leader>rg", ":Rg<CR>", {})
map("n", "<Leader>cc", ":copen<CR>", {})
map("n", "<Leader>n", ":FloatermNew! nnn<CR>", {})
map("n", "<S-h>", ":set invhlsearch<CR>", {})
map("n", "<Leader>p", ":CocCommand prettier.formatFile<CR>", {})

-- Undotree config
map("n", "<Leader>u", ":UndotreeToggle | :UndotreeFocus<CR>", {})

-- Fern config
map("n", "<Leader>e", ":NvimTreeToggle<CR>", {})

-- Diffview config
map("n", "<Leader>gd", ":DiffviewOpen<CR>", {})

-- Packer config
map("n", "<Leader>1", ":PackerInstall<CR>", {silent = true, noremap = true})
map("n", "<Leader>2", ":PackerUpdate<CR>", {silent = true, noremap = true})
map("n", "<Leader>3", ":PackerClean<CR>", {silent = true, noremap = true})
map("n", "<Leader>4", ":PackerCompile<CR>", {silent = true, noremap = true})

-- Hop config
map("n", "<Leader>s", ":HopChar2<CR>", {})
map("n", "<Leader>l", ":HopLine<CR>", {})

-- Auto completion config
map("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true})
map("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true})
map("i", "<CR>", 'pumvisible() ? "<C-y>" : "<CR>"', {expr = true})

-- Telescope config
map("n", "<Leader>ff", '<cmd>lua require("telescope.builtin").find_files()<CR>', {noremap = true})
-- map('n', '<Leader>g', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true })
map("n", "<Leader>h", "<cmd>set invhls<CR>", {})
map(
  "n",
  "<Leader>fp",
  '<cmd>lua require("telescope").extensions.project.project{}<CR>',
  {noremap = true, silent = true}
)

-- Tab management
map("n", "<Leader>tn", ":tabnext<CR>", {})
map("n", "<Leader>to", ":tabonly<CR>", {})
map("n", "<Leader>tc", ":tabclose<CR>", {})
map("n", "<Leader>tm", ":tabmove<CR>", {})

-- Buffer management
-- map('n', '<Leader>,', ':Buffers<CR>', {})
map("n", "<Leader>,", "<C-^>", {})
map("n", "<Leader>bd", ":bd<CR>", {})
map("n", "<Leader>bc", '<cmd>%bdelete|edit#|normal `"`<CR>', {noremap = true})
map("n", "[b", ":BufferLineCyclePrev<CR>", {silent = true})
map("n", "]b", ":BufferLineCycleNext<CR>", {silent = true})
map("n", "gb", ":BufferLinePick<CR>", {silent = true})
map("n", "g>", ":BufferLineMoveNext<CR>", {silent = true})
map("n", "g<", ":BufferLineMovePrev<CR>", {silent = true})

-- Git Confit
map("n", "<Leader>gg", ":Gstatus<CR>", {})
map("n", "<Leader>ga", ":Git add -- .<CR>", {})
map("n", "<Leader>gc", ":GV<CR>", {})
map("n", "<Leader>gf", ":GitGutterFold<CR>", {})
map("n", "<Leader>pp", ":Dispatch! git push<CR>", {noremap = true})
map("n", "<Leader>gb", ":GBranches<CR>", {})
map("n", "<Leader>/", ":BLines<CR>", {})
map("n", "<Leader>gu", ":diffget //2 <CR>", {noremap = true})
map("n", "<Leader>gl", ":diffget //3 <CR>", {noremap = true})
map(
  "n",
  "<C-p>",
  'fugitive#head() != "" ? ":GFiles --cached --others --exclude-standard<CR>": ":Files<CR>"',
  {expr = true}
)
-- TODO: make it lua function
vim.api.nvim_exec([[
		let g:nremap = {'=': '<TAB>'} 
	]], true)

-- Console log shortcut
map("i", "cll", "console.log()<ESC><S-f>(a", {})
map("v", "cll", "yocll<ESC>p", {})
map("n", "cll", "yiwocll<ESC>p", {})

-- Window movement
map("n", "<C-l>", '<cmd>lua require("utils").move_window("l")<CR>', {noremap = true})
map("n", "<C-h>", '<cmd>lua require("utils").move_window("h")<CR>', {noremap = true})
