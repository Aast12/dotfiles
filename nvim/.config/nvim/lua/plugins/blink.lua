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
      preset = "enter",
    },
    sources = {
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
  },
}
