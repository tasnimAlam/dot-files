local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup(
  {
    formatting = {
      format = lspkind.cmp_format(
        {
          with_text = false,
          maxwidth = 50,
          menu = ({
            buffer = "[Buffer]",
            vsnip = "[SNIP]",
            nvim_lsp = "[LSP]",
            cmp_tabnine = "[TN]",
            nvim_lua = "[Lua]"
          })
        }
      )
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({select = true}),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"})
      -- ["<Tab>"] = function(fallback)
      --   if cmp.visible() then
      --     cmp.confirm(
      --       {
      --         behavior = cmp.ConfirmBehavior.Insert,
      --         select = true
      --       }
      --     )
      --   elseif vim.fn["vsnip#available"](1) ~= 0 then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
      --   else
      --     fallback()
      --   end
      -- end,
      -- ["<S-Tab>"] = function(fallback)
      --   if cmp.visible() then
      --     cmp.select_prev_item()
      --   elseif vim.fn["vsnip#available"](1) ~= 0 then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
      --   else
      --     fallback()
      --   end
      -- end
    },
    sources = {
      {name = "vsnip"},
      {name = "nvim_lsp"},
      {name = "cmp_tabnine"},
      {name = "buffer"},
      {name = "path"}
    }
  }
)