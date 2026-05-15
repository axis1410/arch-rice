return {
  "folke/zen-mode.nvim",
  enabled = false,
  cmd = "ZenMode",
  keys = {
    { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
  },
  opts = {
    window = {
      backdrop = 0.75,
      width = 160,
    },
    options = {
      signcolumn = "yes",
      relativenumber = true,
      cursorline = true,
      cursorcolumn = true,
    },

    plugins = {
      todo = { enabled = true },
      gitsigns = { enabled = true },
    },
  },
}