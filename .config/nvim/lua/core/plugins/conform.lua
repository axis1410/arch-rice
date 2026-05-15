local function has_jinja_template_syntax(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local text = table.concat(lines, "\n")
  return text:match("{[%%#][%-]?") ~= nil or text:match("{{[%-]?") ~= nil
end

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters = {
      html_prettier = {
        inherit = "prettier",
        condition = function(self, ctx)
          return not has_jinja_template_syntax(ctx.buf)
        end,
      },
    },

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff", "ruff_organize_imports", "ruff_format" },
      go = { "golines", "gofumpt", "goimports" },
      rust = { "rust_analyzer" },
      json = { "prettier" },
      yaml = { "prettier" },
      toml = { "taplo" },
      html = { "html_prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      sql = { "sleek" },
      sh = { "shfmt" },
      zsh = { "shfmt" },
    },

    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == "jinja" or ft == "htmldjango" then
        return false
      end

      -- Disable formatting for HTML files that contain Jinja template syntax.
      -- Prettier and the HTML LSP both mangle template tags.
      if has_jinja_template_syntax(bufnr) then
        return false
      end

      return { timeout_ms = 5000, lsp_format = "fallback" }
    end,
  },
}
