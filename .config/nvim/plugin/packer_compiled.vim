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
local package_path_str = "/home/shourov/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/shourov/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/shourov/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/shourov/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shourov/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["better-escape.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/better-escape.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ferret = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/ferret"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  kommentary = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["nnn.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/nnn.vim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cursorword"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-cursorword"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-grepper"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-grepper"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-interestingwords"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-interestingwords"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-js-file-import"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-js-file-import"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/shourov/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
