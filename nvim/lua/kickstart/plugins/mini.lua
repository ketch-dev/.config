-- ==================== Collection of various small independent plugins/modules ====================
return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects, for example:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup({ n_lines = 500 })
    -- Add/delete/replace surroundings (brackets, quotes, etc.), for example:
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup({
      mappings = {
        add = 'u',
        delete = 'du',
        find = 'lu',
        find_left = 'Lu',
        replace = 'hu',
        update_n_lines = '',
        highlight = '',
      },
    })

    if not vim.g.vscode then
      local statusline = require('mini.statusline') -- Simple and easy statusline.

      local function get_relative_filename()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname == '' then
          return ''
        end
        return vim.fn.fnamemodify(bufname, ':~:.') .. (vim.bo.modified and ' [+]' or '')
      end

      -- Override the filename section (used in both active/inactive)
      statusline.section_filename = function()
        return get_relative_filename()
      end

      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Minimal setup (preserves default behavior)
      statusline.setup({
        use_icons = vim.g.have_nerd_font or false,
        content = {
          inactive = function()
            return string.format('%%#MiniStatuslineInactive#%s', get_relative_filename())
          end,
        },
      })
    end
  end,
}
