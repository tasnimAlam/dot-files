-- Do not source the default filetype.vim
-- vim.g.did_load_filetypes = 1

-- vim.cmd [[call wilder#setup({'modes': [':', '/', '?']})]]

-- highlight yanked text for 200ms using the "Visual" highlight group
-- vim.cmd [[

-- au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
-- augroup END
-- ]]
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
