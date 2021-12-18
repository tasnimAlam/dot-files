--[[ vim.cmd("syntax on")
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox") ]]


--[[ require("github-theme").setup(
  {
    themeStyle = "dark",
    darkSidebar = true,
    darkFloat = true
  }
) ]]

vim.g.onedark_style = "cool"
require("onedark").setup()
vim.cmd("colorscheme onedark")
