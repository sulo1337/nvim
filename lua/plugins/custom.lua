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
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.keymap.set("i", "<C-L>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()

      -- Disable <Leader>h mapping to home screen to allow Harpoon keybindings to work
      pcall(vim.keymap.del, "n", "<Leader>h")

      -- Register which-key group
      local wk_ok, wk = pcall(require, "which-key")
      if wk_ok then wk.add { { "<Leader>h", group = "⇌ Harpoon" } } end

      -- Keybindings using <Leader>h prefix
      vim.keymap.set("n", "<Leader>ha", function() harpoon:list():add() end, { desc = "Add file" })
      vim.keymap.set("n", "<Leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "List" })
      vim.keymap.set("n", "<Leader>hr", function() harpoon:list():remove() end, { desc = "Remove current file" })
      vim.keymap.set("n", "<Leader>hc", function() harpoon:list():clear() end, { desc = "Clear all files" })

      -- Navigate to marks
      vim.keymap.set("n", "<Leader>h1", function() harpoon:list():select(1) end, { desc = "File 1" })
      vim.keymap.set("n", "<Leader>h2", function() harpoon:list():select(2) end, { desc = "File 2" })
      vim.keymap.set("n", "<Leader>h3", function() harpoon:list():select(3) end, { desc = "File 3" })
      vim.keymap.set("n", "<Leader>h4", function() harpoon:list():select(4) end, { desc = "File 4" })
    end,
  },
}
