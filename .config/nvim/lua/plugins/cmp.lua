local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      with_text = false,
      maxwidth = 50,
      ellipsis_char = '...',
      show_labelDetails = true,
    }),
  },
  snippet = { expand = function(args) require 'luasnip'.lsp_expand(args.body) end },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },
  sources = {
    { name = "luasnip" },
    -- { name = "nvim_lsp" },
    { name = "cmp_tabnine" },
    -- { name = "copilot" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
