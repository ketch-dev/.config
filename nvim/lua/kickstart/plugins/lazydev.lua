-- ==================== LSP plugin. Configures Lua LSP for your Neovim config, runtime and plugins used for completion, annotations and signatures of Neovim apis ====================

return {
  'folke/lazydev.nvim',
  cond = not vim.g.vscode,
  ft = 'lua',
  opts = {
    library = {
      { path = 'luvit-meta/library', words = { 'vim%.uv' } }, -- load luvit types when the `vim.uv` word is found
    },
  },
}
