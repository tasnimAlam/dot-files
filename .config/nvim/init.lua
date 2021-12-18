local async
async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      require("core.autocmds")
      require("core.globals")
      require("core.keymap")
      require("core.plugins")
      require("core.settings")
      require("core.theme")
      async:close()
    end
  )
)
async:send()

