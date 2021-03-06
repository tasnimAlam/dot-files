" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
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
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/aerial.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["better-escape.vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/better-escape.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/diffview.nvim"
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
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/fzf-checkout.vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
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
  ["nvim-tree.lua"] = {
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
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
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
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
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
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-cursorword"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-dispatch"
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
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-fugitive"
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
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-js-file-import"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-js-file-import"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/Users/tasnim/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
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
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
