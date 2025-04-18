-- ==================== Autoformat ====================

return {
  'stevearc/conform.nvim',
  cond = not vim.g.vscode,
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<C-l>',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = '[L]ayout buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't have a well standardized coding style.
      -- You can add additional languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters = {
      stylua = {
        -- any extra CLI flags:
        extra_args = {
          '--indent-type',
          'Spaces',
          '--indent-width',
          '4',
        },
      },
      -- you could define other formatters here, e.g. "prettier", "black", etc.
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      graphql = { 'prettier' },
      liquid = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      -- Conform can also run multiple formatters sequentially. python = { "isort", "black" }.
      -- You can use 'stop_after_first' to run the first available formatter from the list. javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
