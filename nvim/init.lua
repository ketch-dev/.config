-- =====================================================================
-- ============================== OPTIONS ==============================
-- =====================================================================
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Map leader before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.mouse = 'a' -- Enable mouse
vim.opt.showmode = false -- Don't show mode, it's already in the status line
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Enable case-insensitive searching
vim.opt.smartcase = true -- Enable case-sensitive searching if \C or 1+ capital letters in the search term
vim.opt.signcolumn = 'yes' -- Enable sign column (gutter)
vim.opt.updatetime = 250 -- Displays symbol under cursor highlight sooner
vim.opt.timeoutlen = 300 -- Displays which-key popup sooner
vim.opt.splitright = true -- New vertical splits right
vim.opt.splitbelow = true -- New horizontal splits below
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Sets how to display whitespace characters
vim.opt.inccommand = 'split' -- Preview substitutions live in split
vim.opt.cursorline = true -- Highlight current cursor line
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.backspace = 'indent,eol,start'
vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'
vim.schedule(function() -- Schedule the setting after `UiEnter` because it can increase startup-time
  vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim (:help 'clipboard')
end)

-- =====================================================================
-- ============================== KEYMAPS ==============================
-- =====================================================================
-- Disable arrows keys
vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<Nop>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- Might not work in some terminals/tmux
vim.keymap.set('v', 'p', 'P') -- Make text replace to not modify clipboard

-- Move focus. See ':help wincmd'
vim.keymap.set('n', 'R', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', 'T', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', 'S', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', 'F', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Save file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Make 'd' and 'D' commands not modifying clipboard
vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'D', '"_D', { noremap = true })

-- Make 'c' and 'C' commands not modifying clipboard
vim.keymap.set({ 'n', 'v' }, 'c', '"_c', { noremap = true })
vim.keymap.set('n', 'C', '"_C', { noremap = true })

-- Create 'x' and 'X' commands to cut
vim.keymap.set({ 'n', 'v' }, 'x', 'd', { noremap = true })
vim.keymap.set('n', 'X', 'D', { noremap = true })
vim.keymap.set('n', 'xx', 'dd', { noremap = true })

vim.keymap.set('n', 'k', '"_x') -- Remap x command to k key

-- Remap rsft -> hjkl
vim.keymap.set({ 'n', 'v', 'o' }, 'r', 'h', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 's', 'j', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'f', 'k', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 't', 'l', { noremap = true, silent = true })

-- Remap hjl -> ftr
vim.keymap.set({ 'n', 'v', 'o' }, 'l', 'f', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'L', 'F', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'j', 't', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'J', 'T', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'h', 'r', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'H', 'R', { noremap = true, silent = true })

-- Map Ctrl+Z to undo
vim.keymap.set('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.keymap.set('i', '<C-z>', '<C-o>u', { noremap = true, silent = true })

vim.keymap.set('n', 'u', '<Nop>', { noremap = true, silent = true }) -- unmap u

-- Map Ctrl+Y to redo
-- vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true, nowait = true })
-- vim.keymap.set('i', '<C-y>', '<C-o><C-r>', { noremap = true, silent = true })

-- =====================================================================
-- =========================== AUTOCOMMANDS ============================
-- =====================================================================
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable line numbers in terminal mode
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- =====================================================================
-- ================== NOTIFY VSCODE ABOUT MODE CHANGE ==================
-- =====================================================================
if vim.g.vscode then
  vim.cmd([[
    function! VSCodeMode() abort
      let current_mode = mode(1)
      let mode_names = {
            \ 'n': 'NORMAL',
            \ 'i': 'INSERT',
            \ 'v': 'VISUAL',
            \ 'V': 'V-LINE',
            \ "\<C-v>": 'V-BLOCK',
            \ 'R': 'REPLACE',
            \ 'c': 'COMMAND',
            \ 't': 'TERMINAL'
            \ }
      let mode_text = get(mode_names, current_mode, current_mode)
      return '█ '.mode_text.' █'
    endfunction
  ]])

  -- Set statusline to show the mode
  vim.opt.statusline = [[%{VSCodeMode()}]]

  -- Force updates when mode changes
  vim.cmd([[
    augroup VSCodeModeDisplay
      autocmd!
      autocmd ModeChanged * redrawstatus
    augroup END
  ]])

  -- Initialize immediately
  vim.cmd('redrawstatus')
end

require('lazy-bootstrap')
require('lazy-plugins')

-- The line beneath this is called 'modeline'. See ':help modeline'
-- vim: ts=2 sts=2 sw=2 et

-- IDEAS
-- Explorer
vim.keymap.set('n', '<leader>ee', '<cmd>Neotree last reveal left toggle show<CR>', { desc = '[E]xplorer: Toggle' })
vim.keymap.set('n', '<leader>ef', '<cmd>Neotree filesystem reveal left show<CR>', { desc = '[E]xplorer: [F]iles' })
vim.keymap.set('n', '<leader>eb', '<cmd>Neotree buffers reveal left show<CR>', { desc = '[E]xplorer: [B]uffers' })
vim.keymap.set('n', '<leader>eg', '<cmd>Neotree git_status reveal left show<CR>', { desc = '[E]xplorer: [G]it' })

-- Split
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit: [V]ertical' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit: [H]orizontal' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit: [E]qual' })
vim.keymap.set('n', '<leader>sk', '<cmd>close<CR>', { desc = '[S]plit: [K]ill' })

-- Tabs
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab: [O]pen' })
vim.keymap.set('n', '<leader>tk', '<cmd>tabclose<CR>', { desc = '[T]ab: [K]ill' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = '[T]ab: [N]ext' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = '[T]ab: [P]revious' })
vim.keymap.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = '[T]ab: Move [B]uffer to new tab' })

-- Also search (find) keys
-- Also go keys
-- Also shift and frst keys
-- Also maybe trouble keys
-- Also maybe git keys

-- Consider other plugin for surround
-- Install bufferline
-- Install tmux navigator
-- Install maximizer
-- Install workspace reset
-- Install dashboard
