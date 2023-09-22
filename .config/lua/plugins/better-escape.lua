require("better_escape").setup {
  mapping = {"kj"},
  timeout = vim.o.timeoutlen,
  clear_empty_lines = false,
  keys = "<Esc>"
}
