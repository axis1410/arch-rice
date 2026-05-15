return {
  {
    "echasnovski/mini.files",
    version = false,
    enabled = true,
    keys = {
      {
        "<leader>e",
        function()
          local MiniFiles = require "mini.files"
          if MiniFiles.close() then
            return
          end

          MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open Mini Files",
      },
    },
    opts = {
      content = {
        filter = function(entry)
          return not vim.tbl_contains({ "__pycache__", "node_modules" }, entry.name)
          -- return not vim.tbl_contains({ ".git", "__pycache__", "node_modules" }, entry.name)
        end,
      },
      mappings = {
        close = "<Esc>",
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "-",
        go_out_plus = "H",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },
      options = {
        permanent_delete = true,
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
        width_focus = 35,
        width_preview = 70,
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local group = vim.api.nvim_create_augroup("MiniFilesLineNumbers", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = { "MiniFilesWindowOpen", "MiniFilesWindowUpdate" },
        callback = function(args)
          local win_id = args.data.win_id
          if not vim.api.nvim_win_is_valid(win_id) then
            return
          end

          vim.wo[win_id].number = true
          vim.wo[win_id].relativenumber = true
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set("n", "<CR>", function()
            for _ = 1, vim.v.count1 do
              require("mini.files").go_in { close_on_file = true }
            end
          end, { buffer = args.data.buf_id, desc = "Open entry and close Mini Files" })
        end,
      })
    end,
  },

  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.bracketed").setup()
    end,
  },

  {
    "echasnovski/mini.tabline",
    enabled = false,
    opts = {
      show_icons = true,
      format = function(buf_id, label)
        return " " .. require("mini.tabline").default_format(buf_id, label) .. " "
      end,
      tabpage_section = "right",
    },
  },

  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.move").setup {
        mappings = {
          left = "<S-h>",
          right = "<S-l>",
          up = "<S-k>",
          down = "<S-j>",
          line_left = "<S-h>",
          line_right = "<S-l>",
          line_down = "<S-j>",
          line_up = "<S-k>",
        },
      }
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    version = false,
    opts = {},
  },

  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    enabled = false,
    opts = {
      draw = {
        delay = 50,
      },
      -- symbol = "|",
    },
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    version = false,
    opts = {},
  },

  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "<leader>sa",
          delete = "<leader>sd",
          find = "<leader>sf",
          find_left = "<leader>sF",
          highlight = "<leader>sh",
          replace = "<leader>sr",
          update_n_lines = "<leader>sn",
        },
      }
    end,
    opts = {
      mappings = {
        add = "<leader>sa",
        delete = "<leader>sd",
        find = "<leader>sf",
        find_left = "<leader>sF",
        highlight = "<leader>sh",
        replace = "<leader>sr",
        update_n_lines = "<leader>sn",
      },
    },
  },

  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = {
      { "<leader>bd", desc = "Delete buffer (keep window)" },
      { "<leader>bD", desc = "Force delete buffer" },
    },
    config = function()
      require("mini.bufremove").setup()
      vim.keymap.set("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "Delete buffer (keep window)" })

      vim.keymap.set("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
      end, { desc = "Force delete buffer" })
    end,
  },
}