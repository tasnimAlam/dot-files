require("code_runner").setup({
	term = {
		position = "vert",
		size = 15,
	},
	filetype = {
		python = "python -U",
		typescript = "deno run",
	},
	project = {
		["~/deno/example"] = {
			name = "ExapleDeno",
			description = "Project with deno using other command",
			file_name = "http/main.ts",
			command = "deno run --allow-net",
		},
		["~/cpp/example"] = {
			name = "ExapleCpp",
			description = "Project with make file",
			command = "make buid & cd buid/ & ./compiled_file",
		},
	},
})
