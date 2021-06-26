require("kommentary.config").configure_language(
  "typescriptreact",
  {
    hook_function = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end
  }
)
