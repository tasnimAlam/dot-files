-- Onedark
-- vim.g.onedark_style = "cool"
-- require("onedark").setup()
-- vim.cmd("colorscheme onedark")

vim.cmd [[highlight IndentBlanklineChar guifg=#414868 gui=nocombine]]
-- Tokyonight
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
