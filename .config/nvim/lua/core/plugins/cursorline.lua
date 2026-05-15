return {
  "ya2s/nvim-cursorline",
  enabled = false,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-cursorline").setup {
      cursorline = {
        enable = true,
        timeout = 0,
        number = false,
      },
      cursorword = {
        enable = false,
        min_length = 3,
        hl = { underline = true },
      },
    }
  end,
}
