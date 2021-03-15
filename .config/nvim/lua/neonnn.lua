local api = vim.api
local buf

local function create_term()
  buf = api.nvim_create_buf(false, true)
  vim.api.termopen()
  -- vim.fn.termopen('ls')
end

return {
  create_term = create_term
}

