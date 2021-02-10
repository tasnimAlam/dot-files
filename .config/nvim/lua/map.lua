local map = vim.api.nvim_set_keymap

map('n', ',', '', {})
vim.g.mapleader = ','

map('!', '\', ',', '{}')
map('n', '<Leader>o', ':on<CR>', {})
map('n', '<Leader>w', ':w<CR>', {})
map('n', '<Leader>q', ':q!<CR>', {})
map('n', '<Leader>f', ':Rg<CR>', {})
map('nn', '<silent><Leader>1', ':source ~/.vimrc \| :PlugInstall<CR>', {})
map('nn', '<silent><Leader>2', ':source ~/.vimrc \| :PlugUpdate<CR>', {})

-- Tab management
map('n', '<Leader>tn', ':tabnext<CR>', {})
map('n', '<Leader>to', ':tabonly<CR>', {})
map('n', '<Leader>tc', ':tabclose<CR>', {})
map('n', '<Leader>tm', ':tabmove<CR>', {})

-- Buffer management
map('n', '<Leader>,', ':Buffers<CR>', {})
map('n', '<Leader>w', ':w!<CR>', {})
map('n', '<Leader>bd', ':bd<CR>', {})
map('n', '<Leader>bc', '%bdelete|edit#|normal `"', {})

-- Git Confit 
map('n', '<Leader>gg', ':Gstatus<CR>', {})
map('n', '<Leader>ga', ':Git add -- .<CR>', {})
map('n', '<Leader>gc', ':GV<CR>', {})
map('nn', '<Leader>pp', ':Dispatch! git push<CR>', {})
map('n', '<Leader>gf', ':GitGutterFold<CR>', {})
map('n', '<Leader>gb', ':Git branch<CR>', {})
map('n', '<Leader>/', ':BLines<CR>', {})
map('nn', '<Leader>gdh', ':diffget //2 <CR>', {})
map('nn', '<Leader>gdl', ':diffget //3 <CR>', {})
