local async
async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      require("plugins")
      require("theme")
      require("globals")
      require("treesitter-config")
      require("settings")
      require("lsp-config")
      require("cmp-config")
      require("rust-config")
      require("bufferline-config")
      require("format-code")
      require("toggleterm-config")
      require("tabout-config")
      require("refactoring-config")
      require("neoclip-config")
      require("map")
      async:close()
    end
  )
)
async:send()

-- gutentag settings
vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]

vim.cmd [[call wilder#setup({'modes': [':', '/', '?']})]]
