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

-- function M.move_window(key)
--  current = call('winnr', {}) 
--  ex_command('wincmd ' ..key)

--    if current == call('winnr', {}) then
--     if key == 'j' or key == 'k' then
--       ex_command('wincmd v')
--     elseif key == 'h' or key == 'l' then
--       ex_command('wincmd s')
--     end
--   end
-- end

local function move_window(key)
    if key == 'j' or key == 'k' then
      ex_command('wincmd s')
    elseif key == 'h' or key == 'l' then
      ex_command('wincmd v')
    end
    ex_command('wincmd '..key)
end

return {
  move_window = move_window
}

