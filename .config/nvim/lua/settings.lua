local o = vim.o
local wo = vim.wo
local bo = vim.bo
local has = vim.fn.has
local g = vim.g

-- global options
o.swapfile = false
o.backup = false
o.writebackup = false
o.updatetime = 300
o.hlsearch = true
o.shiftwidth = 2
o.laststatus = 2
o.showmode = false
o.foldlevel = 20
o.regexpengine = 0
o.timeout = true
o.ttimeout = true
o.scrolloff = 8
o.termguicolors = true
o.background = "dark"
o.completeopt = "noinsert"
o.tabstop = 2
o.hidden = true
if has("mac") == 1 then
  o.clipboard = "unnamedplus"
elseif has("unix") == 1 then
  o.clipboard = "unnamed"
end

-- buffer options
bo.tabstop = 2
bo.expandtab = true
bo.swapfile = false
bo.syntax = "on"
bo.modifiable = true

-- window options
wo.signcolumn = "yes"
wo.cursorline = true
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
wo.foldmethod = "expr"
wo.number = true
wo.relativenumber = true

-- gutentag settings
vim.cmd[[let g:gutentags_file_list_command = 'rg --files']]

-- disable builtin vim plugins
g.loaded_gzip = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_zipPlugin = 0
g.loaded_2html_plugin = 0
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_spec = 0
