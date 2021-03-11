local api = vim.api
local buf, win

local function run()
  buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.cmd("terminal")
end

return {
  run = run
}
