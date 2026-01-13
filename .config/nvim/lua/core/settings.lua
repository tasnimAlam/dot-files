local opt = vim.opt

-- Global options
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.hlsearch = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true

opt.laststatus = 3
opt.showmode = false

opt.foldlevel = 20
opt.regexpengine = 0

opt.timeout = true
opt.timeoutlen = 500
opt.ttimeout = true
opt.ttimeoutlen = 100

opt.scrolloff = 8
opt.termguicolors = true
opt.background = "dark"

-- blink-cmp friendly baseline
opt.completeopt = { "menuone", "noselect" }

opt.lazyredraw = false
opt.mouse = ""

-- Window options (defaults)
opt.signcolumn = "yes"
opt.cursorline = true
opt.cursorlineopt = "number"
opt.foldmethod = "expr"
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
