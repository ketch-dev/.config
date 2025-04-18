-- ==================== Configure and install plugins ====================

require('lazy').setup({
  require('custom.plugins.neoscroll'),
  require('custom.plugins.scrollbar'),
  require('custom.plugins.lazygit'),
  require('custom.plugins.bufferline'),
  require('kickstart.plugins.vim-sleuth'),
  require('kickstart.plugins.gitsigns-default'),
  require('kickstart.plugins.which-key'),
  require('kickstart.plugins.telescope'),

  -- LSP Plugins. LSP provides Neovim with features like: Go to definition, Find references, Autocompletion, Symbol Search etc.
  -- Language Servers are external tools that must be installed separately from Neovim. This is where `mason` and related plugins come into play.
  require('kickstart.plugins.lazydev'),
  require('kickstart.plugins.luvit-meta'),
  require('kickstart.plugins.lspconfig'),

  require('kickstart.plugins.conform'),
  require('kickstart.plugins.cmp'),
  require('kickstart.plugins.tokyonight'),
  require('kickstart.plugins.todo-comments'),
  require('kickstart.plugins.mini'),
  require('kickstart.plugins.treesitter'),

  -- Add/Configure additional plugins for Kickstart
  -- require 'kickstart.plugins.debug',
  require('kickstart.plugins.indent_line'),
  -- require 'kickstart.plugins.lint',
  require('kickstart.plugins.autopairs'),
  require('kickstart.plugins.neo-tree'),
  -- require 'kickstart.plugins.gitsigns', -- Adds gitsigns recommend keymaps

  -- The import below can automatically add your own plugins, configuration, etc from 'lua/custom/plugins/*.lua'. This is the easiest way to modularize your config
  -- Uncomment the following line and add your plugins to 'lua/custom/plugins/*.lua' to get going.
  -- { import = 'custom.plugins' },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
