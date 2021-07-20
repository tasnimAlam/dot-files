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
      require("map")
      require("lsp-config")
      require("rust-config")
      require("galaxy-status")
      require("bufferline-config")
      require("format-code")
      require("diffview-config")
      require("kommentary-config")
      require("startify-config")
      require("toggleterm-config")

      async:close()
    end
  )
)
async:send()

-- gutentag settings
vim.cmd [[let g:gutentags_file_list_command = 'rg --files']]
