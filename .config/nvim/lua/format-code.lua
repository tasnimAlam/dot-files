require("formatter").setup(
  {
    logging = false,
    filetype = {
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- Lua formatter
vim.api.nvim_command("autocmd FileType lua nmap <buffer> <Leader>p :Format<CR>")
