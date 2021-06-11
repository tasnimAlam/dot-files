local set_globals = function(globals)
  for key, value in pairs(globals) do
    vim.g[key] = value
  end
end

local global_settings = {
  better_escape_shortcut = "kj",
  move_key_modifier = "A",
  vim_json_conceal = 0
}

set_globals(global_settings)
