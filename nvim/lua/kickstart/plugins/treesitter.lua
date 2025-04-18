-- ==================== Highlight, edit, and navigate code. See ':help nvim-treesitter' ====================

return {
  'nvim-treesitter/nvim-treesitter',
  cond = not vim.g.vscode,
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'css',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'dockerfile',
      'gitignore',
      'query',
      'vim',
      'vimdoc',
      'json',
      'javascript',
      'typescript',
      'tsx',
      'yaml',
    },
    auto_install = true, -- Autoinstall languages that are not installed
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {
        'ruby',
      }, -- Ruby depends on vim's regex highlighting system for indent rules. Add language to this list and disable indent for it below if you are experiencing weird indenting issues
    },
    indent = {
      enable = true,
      disable = {
        'ruby',
      },
    },
    autotag = {
      enable = true,
    },
  },
  -- There are additional nvim-treesitter modules that you can use to interact with nvim-treesitter. You should go explore a few and see what interests you:
  --  - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --  - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --  - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
