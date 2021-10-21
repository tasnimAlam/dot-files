local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup(
  {
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({select = true}),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"})
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "cmp_tabnine"},
      {name = "buffer"},
      {name = "path"}
    }
  }
)
