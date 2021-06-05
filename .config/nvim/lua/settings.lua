local o = vim.o
local wo = vim.wo 
local bo = vim.bo 
local has = vim.fn.has

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
o.background = 'dark'
o.completeopt = 'noinsert'
o.tabstop = 2
if has('mac') == 1 then
  o.clipboard = 'unnamedplus'
elseif has('unix') == 1 then
  o.clipboard = 'unnamed'
end

-- buffer options
bo.tabstop = 2
bo.expandtab = true
bo.swapfile = false
bo.syntax = 'on'
bo.modifiable = true

-- window options
wo.signcolumn = 'yes' 
wo.cursorline = true
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
wo.foldmethod = 'expr'
wo.number = true
wo.relativenumber = true

