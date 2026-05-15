return {
  "xiyaowong/transparent.nvim",
  enabled = false,
  cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
  keys = {
    {
      "<leader>tt",
      "<cmd>TransparentToggle<cr>",
      desc = "Toggle Transparent Mode",
    },
  },
  opts = {},
}