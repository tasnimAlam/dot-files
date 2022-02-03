local set_globals = function(globals)
	for key, value in pairs(globals) do
		vim.g[key] = value
	end
end

local global_settings = {
	move_key_modifier = "A",
	vim_json_conceal = 0,
	blamer_enabled = 1,
}

set_globals(global_settings)
