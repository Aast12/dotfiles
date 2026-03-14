return {
  "saghen/blink.cmp",
  build = "cargo +nightly build --release",
  opts = {
    completion = {
      -- Insert completion item on selection, don't select by default
      list = {
        selection = {
          auto_insert = false,
        },
      },
    },
    keymap = {
      preset = "super-tab",
      ["<Tab>"] = {
        function(cmp)
          if not cmp.is_visible() then
            local ok, preview = pcall(require, "supermaven-nvim.completion_preview")
            if ok and preview.has_suggestion() then
              preview.on_accept_suggestion()
              return true
            end
          end
        end,
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    sources = {
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
  },
}
