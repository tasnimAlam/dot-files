local luaFormat = function()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

local prettierdFormat = function()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      lua = {luaFormat},
      typescript = {prettierdFormat},
      javascript = {prettierdFormat},
      html = {prettierdFormat},
      css = {prettierdFormat},
      scss = {prettierdFormat}
    }
  }
)
