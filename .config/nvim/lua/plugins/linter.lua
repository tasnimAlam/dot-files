local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "quick-lint-js" },
	javascriptreact = { "quick-lint-js" },
	typescript = { "quick-lint-js" },
	typescriptreact = { "quick-lint-js" },
	css = { "quick-lint-js" },
	htmlangular = { "quick-lint-js" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
