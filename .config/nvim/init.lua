--disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end

local async
async =
  vim.loop.new_async(
  vim.schedule_wrap(
    function()
      -- require("core.autocmds")
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

