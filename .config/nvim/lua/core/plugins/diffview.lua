return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewFocusFiles", "DiffviewToggleFiles" },
  keys = {
    {
      "<leader>do",
      function()
        require("diffview").open()
      end,
      desc = "Open Diffview",
    },
    {
      "<leader>dc",
      function()
        require("diffview").close()
      end,
      desc = "Close Diffview",
    },
  },
}
