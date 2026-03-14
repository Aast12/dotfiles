return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/vaults/*.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/vaults/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "brain",
        path = "~/vaults/brain",
      },
    },
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
    },
  },
}
