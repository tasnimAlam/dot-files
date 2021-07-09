local gl = require("galaxyline")
local gls = gl.section
local extension = require("galaxyline.provider_extensions")

gl.short_line_list = {
  "LuaTree",
  "vista",
  "dbui",
  "startify",
  "term",
  "nerdtree",
  "fugitive",
  "fugitiveblame",
  "plug"
}

-- Github dark theme
local colors = {
  bg = "#21262d",
  line_bg = "#21262d",
  fg = "#c6cdd5",
  fg_green = "#7ce38b",
  yellow = "#faa356",
  cyan = "#008080",
  darkblue = "#77bdfb",
  green = "#7ce38b",
  orange = "#faa356",
  purple = "#21262d",
  magenta = "#fa7970",
  blue = "#77bdfb",
  red = "#fa7970"
}

-- Gruvbox theme
--[[ local colors = {
  bg = "#282828",
  line_bg = "#3c3836",
  fg = "#fbf1c7",
  fg_green = "#8ec07c",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#076678",
  green = "#b8bb26",
  orange = "#d65d0e",
  purple = "#d3869b",
  magenta = "#d3869b",
  blue = "#83af98",
  red = "#cc241d"
}
 ]]
local function trailing_whitespace()
  local trail = vim.fn.search("\\s$", "nw")
  if trail ~= 0 then
    return " "
  else
    return nil
  end
end

TrailingWhiteSpace = trailing_whitespace

function has_file_type()
  local f_type = vim.bo.filetype
  if not f_type or f_type == "" then
    return false
  end
  return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function()
      return " "
    end,
    highlight = {colors.blue, colors.line_bg}
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        V = "VISUAL",
        [""] = "VISUAL",
        v = "VISUAL",
        c = "COMMAND-LINE",
        ["r?"] = ":CONFIRM",
        rm = "--MORE",
        R = "REPLACE",
        Rv = "VIRTUAL",
        s = "SELECT",
        S = "SELECT",
        ["r"] = "HIT-ENTER",
        [""] = "SELECT",
        t = "TERMINAL",
        ["!"] = "SHELL"
      }
      local mode_color = {
        n = colors.green,
        i = colors.blue,
        v = colors.magenta,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.green,
        t = colors.green,
        c = colors.purple,
        ["r?"] = colors.red,
        ["r"] = colors.red,
        rm = colors.red,
        R = colors.yellow,
        Rv = colors.magenta
      }
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
      return alias[vim_mode] .. " "
    end,
    highlight = {colors.red, colors.line_bg, "bold"}
  }
}

gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
  }
}

gls.left[4] = {
  FileName = {
    provider = {"FileName"},
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.green, colors.line_bg}
  }
}

gls.left[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.orange, colors.line_bg}
  }
}

gls.left[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.red, colors.line_bg}
  }
}

gls.left[10] = {
  LeftEnd = {
    provider = function()
      return ""
    end,
    separator = "",
    separator_highlight = {colors.bg, colors.line_bg},
    highlight = {colors.line_bg, colors.line_bg}
  }
}

gls.left[11] = {
  TrailingWhiteSpace = {
    provider = TrailingWhiteSpace,
    icon = "  ",
    highlight = {colors.yellow, colors.bg}
  }
}

gls.left[12] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.bg}
  }
}

gls.left[13] = {
  Space = {
    provider = function()
      return " "
    end
  }
}

gls.left[14] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.yellow, colors.bg}
  }
}

gls.right[1] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {colors.orange, colors.line_bg}
  }
}

gls.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {"#8FBCBB", colors.line_bg, "bold"}
  }
}

gls.right[4] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " | ",
    separator_highlight = {colors.blue, colors.line_bg},
    highlight = {colors.fg, colors.line_bg}
  }
}
gls.right[5] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = {colors.line_bg, colors.line_bg},
    highlight = {colors.fg, colors.line_bg, "bold"}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = "",
    condition = has_file_type,
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.fg, colors.purple}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    separator = "",
    condition = has_file_type,
    separator_highlight = {colors.purple, colors.bg},
    highlight = {colors.fg, colors.purple}
  }
}
