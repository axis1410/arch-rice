return {
  {
    "echasnovski/mini.statusline",
    enabled = false,
    event = "BufEnter",
    dependencies = {
      "echasnovski/mini-git",
      "echasnovski/mini.diff",
      "echasnovski/mini.icons",
    },
    config = function()
      local statusline = require("mini.statusline")

      local function lsp_summary()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        local names = {}
        for _, client in ipairs(clients) do
          names[#names + 1] = client.name
        end
        table.sort(names)

        local err = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
        local warn = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
        local info = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })
        local hint = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })

        local diag = {}
        if err > 0 then diag[#diag + 1] = "E" .. err end
        if warn > 0 then diag[#diag + 1] = "W" .. warn end
        if info > 0 then diag[#diag + 1] = "I" .. info end
        if hint > 0 then diag[#diag + 1] = "H" .. hint end

        local lhs = #names > 0 and ("LSP: " .. table.concat(names, ",")) or "LSP: none"
        if #diag == 0 then
          return lhs
        end
        return lhs .. " " .. table.concat(diag, " ")
      end

      local function filename_relative_to_cwd()
        local name = vim.api.nvim_buf_get_name(0)
        if name == "" then
          return "[No Name]"
        end

        local rel = vim.fn.fnamemodify(name, ":.")
        if rel == "" then
          return name
        end
        return rel
      end

      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git = statusline.section_git({ trunc_width = 40 })
            local diff = statusline.section_diff({ trunc_width = 75 })
            local filename = filename_relative_to_cwd()
            local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
            local location = statusline.section_location({ trunc_width = 75 })
            local search = statusline.section_searchcount({ trunc_width = 75 })
            local lsp = lsp_summary()

            return statusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = "MiniStatuslineDevinfo", strings = { git, diff, lsp } },
              "%<",
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=",
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl,                  strings = { search, location } },
            })
          end,
        },
      })
    end,
  },
}
