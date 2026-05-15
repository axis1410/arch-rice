return {
  "https://codeberg.org/andyg/leap.nvim",
  enabled = false,
  config = function()
    local leap = require "leap"

    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
    vim.keymap.set({ "n" }, "S", "<Plug>(leap-from-window)")
  end,
}