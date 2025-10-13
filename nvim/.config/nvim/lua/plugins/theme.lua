return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      local default_zenbones = {
        darken_comments = 45,
        darkness = "stark",
        transparent_background = true,
        darken_noncurrent_window = true,
        italic_comments = true,
      }

      vim.g.forestbones = default_zenbones
      vim.g.neobones = default_zenbones
      vim.g.zenburned = default_zenbones
      vim.g.zenwritten = default_zenbones

      -- vim.cmd("colorscheme zenburned")
    end,
  },
  {
    "cdmill/neomodern.nvim",
    lazy = false,
    priority = 999,
    config = function()
      require("neomodern").setup({
        transparent = true,
        alt_bg = true,
        theme = "gyokuro",
      })
      -- require("neomodern").load()
    end,
  },
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("black-metal").setup({
        -- transparent = true,
        alt_bg = true,
        theme = "bathory",
      })
      -- require("black-metal").load()
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1001,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        saturation = 0.7,
        italic_comments = true,
        hide_fillchars = true,
        variant = "auto",
      })
    end,
  },
  { "Shatur/neovim-ayu", opts = {
    mirage = true,
    terminal = true,
    overrides = {},
  } },
  { "LazyVim/LazyVim", opts = {
    colorscheme = "ayu-mirage",
  } },
}
