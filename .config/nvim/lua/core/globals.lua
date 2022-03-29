local set_globals = function(globals)
	for key, value in pairs(globals) do
		vim.g[key] = value
	end
end

local global_settings = {
	move_key_modifier = "A",
	blamer_enabled = 1,
	-- python3_host_prog = "/usr/share/nvim/runtime/autoload/provider/python3.vim",
	python3_host_prog = "/usr/bin/python",
}

set_globals(global_settings)
