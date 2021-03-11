local utils = require('utils')
local map = vim.api.nvim_set_keymap


map('n', ',', '', {})
vim.g.mapleader = ','

map('i', '<Leader>p', '<C-r>0', {})
map('n', '<Leader>o', ':on<CR>', {})
map('n', '<Leader>w', ':w<CR>', {})
map('n', '<Leader>q', ':q!<CR>', {})
map('n', '<Leader>f', ':Rg<CR>', {})
map('n', '<Leader>vr', ':source ~/.vimrc<CR>', { noremap = true})
map('n', '<Leader>1', ':PaqInstall<CR>', { silent = true , noremap = true})
map('n', '<Leader>2', ':PaqUpdate<CR>', { silent = true, noremap = true })
map('n', '<Space>', ':nohlsearch<CR>', {})

-- Fern config
map('n', '<Leader>e', ':NvimTreeToggle<CR>', {})

-- Tab management
map('n', '<Leader>tn', ':tabnext<CR>', {})
map('n', '<Leader>to', ':tabonly<CR>', {})
map('n', '<Leader>tc', ':tabclose<CR>', {})
map('n', '<Leader>tm', ':tabmove<CR>', {})

-- Buffer management
map('n', '<Leader>,', ':Buffers<CR>', {})
map('n', '<Leader>w', ':w!<CR>', {})
map('n', '<Leader>bd', ':bd<CR>', {})
map('n', '<Leader>bc', '%bdelete|edit#|normal `"', { noremap = true})

-- Git Confit 
map('n', '<Leader>gg', ':Gstatus<CR>', {})
map('n', '<Leader>ga', ':Git add -- .<CR>', {})
map('n', '<Leader>gc', ':GV<CR>', {})
map('n', '<Leader>pp', ':Dispatch! git push<CR>', {})
map('n', '<Leader>gf', ':GitGutterFold<CR>', {})
map('n', '<Leader>pp', ':Dispatch! git push<CR>', { noremap = true })
map('n', '<Leader>gb', ':Git branch<CR>', {})
map('n', '<Leader>/', ':BLines<CR>', {})
map('n', '<Leader>gdh', ':diffget //2 <CR>', { noremap = true})
map('n', '<Leader>gdl', ':diffget //3 <CR>', { noremap = true})
map('n', '<C-p>', 'fugitive#head() != "" ? ":GFiles --cached --others --exclude-standard<CR>": ":Files<CR>"', { expr = true })

-- Console log shortcut
map('i', 'cll', 'console.log()<ESC><S-f>(a', {})
map('v', 'cll', 'yocll<ESC>p', {})
map('n', 'cll', 'yiwocll<ESC>p', {})

-- Window movement
map('n', '<C-l>', ':lua vim.api.nvim_command(require("utils").move_window("l"))<CR>',{ noremap = true })
map('n', '<C-h>', ':lua vim.api.nvim_command(require("utils").move_window("h"))<CR>',{ noremap = true })
map('n', '<C-j>', ':lua vim.api.nvim_command(require("utils").move_window("j"))<CR>',{ noremap = true })
map('n', '<C-k>', ':lua vim.api.nvim_command(require("utils").move_window("k"))<CR>',{ noremap = true })
-- map('n', '<C-l>', ':lua vim.api.nvim_command(util.move_window("j"))<CR>',{  noremap = true })
-- map('n', '<C-k>', 'lua vim.api.nvim_command(util.window_move("k"))',{ noremap = true })
-- map('n', '<C-l>', 'vim.api.nvim_command(util.window_move("l"))',{ silent = true, noremap = true })
