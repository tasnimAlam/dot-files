local o = vim.o
local wo = vim.wo 
local bo = vim.bo 

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
o.regexpengine = 1
o.timeout = true
o.ttimeout = true
o.scrolloff = 8

-- buffer options
bo.tabstop = 2
bo.expandtab = true
bo.swapfile = false
bo.syntax = 'on'
bo.modifiable = true

-- window options
wo.signcolumn = 'yes' 
wo.cursorline = true
wo.foldmethod = 'expr'
wo.number = true
wo.relativenumber = true

