-- impatient has to be loaded before anything else
local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

-- disable builtin plugins
require "core/disable-builtins"

-- load core modules
local core_modules = {
  "core.settings",
  -- "core.globals",
  "core.autocmds",
  "core.keymap",
  "core.plugins",
  "core.theme",
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
