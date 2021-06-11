local cmd = vim.cmd
local call = vim.api.nvim_call_function
local ex_command = vim.api.nvim_command

-- function M.create_augroup(aucmds, name)
--   cmd('augroup ', .. name)
--   cmd('autocmd!')

--   for _, aucmd in ipairs(aucmds) do
--    cmd('autocmd', ..table.concat(aucmd, ' ') )
--   end
--   cmd('augroup END')
-- end

local function move_window(key)
  local curwin = call("winnr", {})
  ex_command("wincmd " .. key)
  if (curwin == call("winnr", {})) then
    if (key == "j" or key == "k") then
      ex_command("wincmd s")
    elseif (key == "h" or key == "l") then
      ex_command("wincmd v")
    end
    ex_command("wincmd " .. key)
  end
end

return {
  move_window = move_window
}
