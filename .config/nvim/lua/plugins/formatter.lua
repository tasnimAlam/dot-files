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

local shellFormat = function()
  return {
    exe = "shfmt",
    args = {"-i", 2},
    stdin = true
  }
end

local rustFormat = function()
  return {
    exe = "rustfmt",
    args = {"--emit=stdout"},
    stdin = true
  }
end

local pythonFormat = function()
  return {
    exe = "black",
    args = {"-"},
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
      markdown = {prettierdFormat},
      html = {prettierdFormat},
      css = {prettierdFormat},
      scss = {prettierdFormat},
      sh = {shellFormat},
      rust = {rustFormat},
      python = {pythonFormat}
    }
  }
)
