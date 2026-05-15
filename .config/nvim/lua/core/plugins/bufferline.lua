return {
  "akinsho/bufferline.nvim",
  enabled = false,
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require "bufferline"

    bufferline.setup {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          style = "icon",
          icon = "▎",
        },
        buffer_close_icon = "x",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "slope",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        -- sort_by = "insert_after_current",
        sort_by = "insert_at_end",
        color_icons = true,

        buffer_pickers = {
          letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
        },

        custom_areas = {
          right = function()
            local result = {}
            local pinned = 0
            for _, buf in ipairs(vim.t.bufs or {}) do
              if vim.fn.getbufvar(buf, "pinned", 0) == 1 then
                pinned = pinned + 1
              end
            end
            if pinned > 0 then
              table.insert(result, { text = " " .. pinned, fg = "#e0af68" })
            end
            return result
          end,
        },
      },
    }

    -- local opts = { noremap = true, silent = true }

    -- vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
    -- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
    -- vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", opts)
    -- vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts)
    -- vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts)
  end,
}
