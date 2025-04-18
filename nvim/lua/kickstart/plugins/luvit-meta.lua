-- ==================== LSP plugin ====================

return {
  'Bilal2453/luvit-meta',
  cond = not vim.g.vscode,
  lazy = true,
}
