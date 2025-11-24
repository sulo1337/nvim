---@type LazySpec
return {
  -- Themes - change default theme in astroui.lua
  { "rebelot/kanagawa.nvim" },

  -- UI
  -- sets neovim to transparent background
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    -- opts = {
    -- exclude_groups = { "CursorLine" },
    -- },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "v2.0.0",
    lazy = false,
    opts = {
      default_mappings = false,
    }
  },
  {
    "github/copilot.vim",
    lazy = false,
  }
}
