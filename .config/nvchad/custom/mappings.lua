local M = {}

M.disabled = {
  ["<leader>n"] = "",
}

M.general = {
  n = {
    ["<leader>o"] = { "<cmd>on<cr>", "only file" },
    ["<leader>w"] = { "<cmd>w!<cr>", "write file" },
    ["<leader>q"] = { "<cmd>q!<cr>", "quit neovim" },
    ["<leader>p"] = { "<cmd>lua vim.lsp.buf.format({ bufnr = bufnr })<cr>", "format file" },
    ["<C-n>"] = { "<cmd>FloatermNew!<cr>", "new terminal" },
    ["n"] = { "nzzzv", "center page" },
    ["<S-n>"] = { "Nzzzv", "center page" },
    ["cll"] = { "yiwocll<ESC>p" },
  },
  i = {
    ["cll"] = { "console.log()<ESC><S-f>(a" },
  },
  v = {
    ["cll"] = { "S(iconsole.log<ESC>" },
  },
}

M.lspconfig = {
  n = {
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>" },
    ["gr"] = { "<cmd>TroubleToggle lsp_references<CR>" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>" },
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>" },
    ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
    ["<leader>wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" },
    ["<leader>wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" },
    ["<leader>wl"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" },
    ["<leader>D"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>" },
    ["<leader>rn"] = { "<cmd>Lspsaga rename<CR>" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>" },
    ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
    ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>" },
  },
}

M.telescope = {
  n = {
    ["<leader><leader>"] = { '<cmd>lua require("telescope.builtin").find_files()<CR>' },
    ["<Leader>ss"] = { '<cmd>lua require("telescope.builtin").grep_string()<CR>' },
    ["<Leader>sl"] = { '<cmd>lua require("telescope.builtin").live_grep()<CR>' },
    ["<Leader>/"] = { '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>' },
    ["<C-p>"] = { '<cmd>lua require("telescope").extensions.project.project{}<CR>' },
    ["<Leader>rf"] = { '<cmd>lua require("telescope.builtin").oldfiles({hidden = true})<CR>' },
    ["<Leader>fm"] = { '<cmd>lua require("telescope").extensions.media_files.media_files()<CR>' },
  },
}

M.tabufline = {
  n = {
    ["<leader>,"] = { "<C-^>" },
    ["<leader>bc"] = { '<cmd>%bdelete|edit#|normal `"`<CR>' },
    ["gb"] = { "<cmd> TbufPick <CR>", "Pick buffer" },
    ["d>"] = { ":BufferLineCloseRight<CR>" },
    ["d<"] = { ":BufferLineCloseLeft<CR>" },
    ["g>"] = { ":BufferLineMoveNext<CR>" },
    ["g<"] = { ":BufferLineMovePrev<CR>" },
  },
}

M.comment = {
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeFindFileToggle <CR>", "   toggle nvimtree" },
  },
}

M.git = {
  n = {

    ["<Leader>g"] = { ":FloatermNew --width=1.0 --height=1.0 --autoclose=2 lazygit<CR>" },
    ["]c"] = { "<cmd>Gitsigns next_hunk<CR>" },
    ["[c"] = { "<cmd>Gitsigns prev_hunk<CR>" },
  },
}

M.toggle = {
  n = {
    ["<leader>t"] = { "<cmd> ToggleAlternate<CR>", "   toggle value" },
  },
}

M.trouble = {
  n = {
    ["<leader>d"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "trouble toggle" },
  },
}

M.yabs = {
  n = {
    ["<leader>rr"] = { "<cmd>YabsDefaultTask<CR>", "run default task" },
    ["<leader>rb"] = { "<cmd>YabsTask build<CR>", "build task" },
    ["<leader>rp"] = { "<cmd>YabsTask run<CR>", "run task" },
  },
}

M.treehopper = {
  n = {
    ["<leader>v"] = { "<cmd>lua require('tsht').nodems()<CR>", "run task" },
  },
}

M.packer = {
  n = {
    ["<leader>1"] = { "<cmd>PackerInstall<cr>", "Packer Install" },
    ["<leader>2"] = { "<cmd>PackerUpdate<cr>", "Packer Update" },
    ["<leader>3"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
  },
}

M.undotree = {
  n = {
    ["<Leader>u"] = { "<cmd>UndotreeToggle | :UndotreeFocus<CR>" },
  },
}

M.clipboard = {
  n = {
    ["<Leader>cc"] = { "<cmd>lua require('telescope').extensions.neoclip.default()<CR>" },
  },
}

return M
