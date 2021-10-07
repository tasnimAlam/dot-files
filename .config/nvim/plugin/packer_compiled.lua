-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tasnim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tasnim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tasnim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tasnim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tasnim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  ["alternate-toggler"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/alternate-toggler"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3=\3\t\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\2\tkeys\n<Esc>\22clear_empty_lines\1\1\2\0\0\akj\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/better-escape.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-checkout.vim"] = {
    commands = { "GBranches" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/fzf-checkout.vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    commands = { "GV" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/gv.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["nnn.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bnnn\frequire\0" },
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nnn.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-angular"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-treesitter-angular"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/rust.vim"
  },
  ["splitjoin.vim"] = {
    commands = { "SplitjoinJoin", "SplitjoinSplit" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/splitjoin.vim"
  },
  ["tabout.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/tabout.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-javascript"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript"
  },
  ["vim-js"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-js"
  },
  ["vim-js-file-import"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-js-file-import"
  },
  ["vim-jsx-pretty"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-jsx-pretty"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nnn.nvim
time([[Config for nnn.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bnnn\frequire\0", "config", "nnn.nvim")
time([[Config for nnn.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3=\3\t\2B\0\2\1K\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\2\tkeys\n<Esc>\22clear_empty_lines\1\1\2\0\0\akj\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SplitjoinSplit lua require("packer.load")({'splitjoin.vim'}, { cmd = "SplitjoinSplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SplitjoinJoin lua require("packer.load")({'splitjoin.vim'}, { cmd = "SplitjoinJoin", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GV lua require("packer.load")({'gv.vim'}, { cmd = "GV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBranches lua require("packer.load")({'fzf-checkout.vim'}, { cmd = "GBranches", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'vim-javascript', 'vim-js', 'vim-js-file-import', 'nvim-ts-context-commentstring', 'vim-jsx-pretty'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType rs ++once lua require("packer.load")({'rust.vim'}, { ft = "rs" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'vim-javascript', 'vim-js', 'vim-js-file-import', 'nvim-ts-context-commentstring', 'vim-jsx-pretty'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType ts ++once lua require("packer.load")({'vim-javascript', 'vim-js', 'vim-js-file-import', 'nvim-ts-context-commentstring', 'vim-jsx-pretty'}, { ft = "ts" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'vim-javascript', 'vim-js', 'vim-js-file-import', 'nvim-ts-context-commentstring', 'vim-jsx-pretty'}, { ft = "jsx" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-fugitive'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/flow.vim]], true)
vim.cmd [[source /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/flow.vim]]
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/flow.vim]], false)
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/javascript.vim]], true)
vim.cmd [[source /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]], true)
vim.cmd [[source /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /Users/tasnim/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /Users/tasnim/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
