local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      },
      n = {
        ["<esc>"] = actions.close
      }
    }
  },
  extensions = {}
}

require "telescope".load_extension("project")
