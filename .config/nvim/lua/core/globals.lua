local set_globals = function(globals)
	for key, value in pairs(globals) do
		vim.g[key] = value
	end
end

local global_settings = {
	move_key_modifier = "A",
	python3_host_prog = "/usr/bin/python3",
}

set_globals(global_settings)
