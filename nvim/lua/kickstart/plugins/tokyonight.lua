-- ==================== Colorscheme ====================

return {
  'folke/tokyonight.nvim', -- Colorscheme. To change it - use new name as plugin name and use this name in command in the config. Check installed colorschemes: ':Telescope colorscheme'.
  cond = not vim.g.vscode,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function() -- Load the colorscheme in this function.
    vim.cmd.colorscheme('tokyonight-night') -- Theme can include mulpitle styles. We're setting a specific style here.
    vim.cmd.hi('Comment gui=none') -- Highlights configuration
  end,
}
