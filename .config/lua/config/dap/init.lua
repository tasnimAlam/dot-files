require("dapui").setup()

local function configure_debuggers()
	require("config.dap.javascript").setup()
end

configure_debuggers()
