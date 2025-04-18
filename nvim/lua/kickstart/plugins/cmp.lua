-- ==================== Autocompletion ====================

return {
  'hrsh7th/nvim-cmp',
  cond = not vim.g.vscode,
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets. This step is not supported in many windows environments. Remove the below condition to re-enable on windows.
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- "friendly-snippets" contains a variety of premade snippets (optional).
        -- {
        --   'rafamadriz/friendly-snippets',
        --   config = function()
        --     require('luasnip.loaders.from_vscode').lazy_load()
        --   end,
        -- },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    -- Adds other completion capabilities. nvim-cmp does not ship with all sources by default. They are split into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require('cmp') -- See `:help cmp`
    local luasnip = require('luasnip')
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      -- For an understanding of why these mappings were chosen, you will need to read ":help ins-completion". It is really good!
      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Select the [n]ext item. You can use ['<Tab>'] instead
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Select the [p]revious item. You can use ['<S-Tab>'] instead
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll the documentation window [b]ack
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll the documentation window [f]orward
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept ([y]es) the completion. This will auto-import if your LSP supports it. This will expand snippets if the LSP sent a snippet. You can use ['<CR>'] instead
        ['<C-Space>'] = cmp.mapping.complete({}), -- Manually trigger a completion from nvim-cmp.
        ['<C-t>'] = cmp.mapping(function() -- Move to the right of your snippet expansion location
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-r>'] = cmp.mapping(function() -- Move to the left of your snippet expansion location
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      }),
      sources = {
        {
          name = 'lazydev',
          group_index = 0, -- Set group index to 0 to skip loading LuaLS completions as lazydev recommends it
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    })
  end,
}
