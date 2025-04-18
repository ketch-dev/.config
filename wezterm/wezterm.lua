local wezterm = require('wezterm')
local c = wezterm.config_builder()

c.font = wezterm.font('JetBrainsMonoNL')
c.max_fps = 180
c.enable_scroll_bar = true
c.font_size = 15.0
c.use_fancy_tab_bar = false
c.hide_tab_bar_if_only_one_tab = true
c.default_cursor_style = 'BlinkingBar'
c.color_scheme = 'tokyonight_night'
c.window_close_confirmation = 'NeverPrompt'
c.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
c.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
c.set_environment_variables = {
  NVIM_TUI_ENABLE_CURSOR_SHAPE = '1',
}
-- ========== Keys ==========
local act = wezterm.action
c.keys = {
  { key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },
  { key = 't', mods = 'LEADER|CTRL', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab({ confirm = true }) },
  { key = 'w', mods = 'LEADER|CTRL', action = act.CloseCurrentPane({ confirm = true }) },
  { key = 'LeftArrow', mods = 'LEADER', action = act.ActivateTabRelativeNoWrap(-1) },
  { key = 'LeftArrow', mods = 'LEADER|CTRL', action = act.ActivatePaneDirection('Left') },
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivateTabRelativeNoWrap(1) },
  { key = 'RightArrow', mods = 'LEADER|CTRL', action = act.ActivatePaneDirection('Right') },
}

-- ========== Colors ==========
local primary_bg = '#2b2f32'
local primary_fg = '#bdc7f0'
c.colors = {
  tab_bar = {
    background = primary_bg,
    active_tab = {
      -- bg_color = primary_bg,
      bg_color = '#292929',
      -- fg_color = '#7aa2f7',
      fg_color = '#555',
    },
    inactive_tab = {
      bg_color = primary_bg,
      -- fg_color = '#565f89',
      fg_color = '#555',
    },
    inactive_tab_hover = {
      -- bg_color = '#414868',
      bg_color = '#444',
      fg_color = primary_fg,
    },
    new_tab = {
      bg_color = primary_bg,
      fg_color = primary_fg,
    },
    new_tab_hover = {
      bg_color = primary_bg,
      fg_color = '#cfc9c2',
    },
  },
}

-- Disable scroll bar in alt mode
wezterm.on('update-status', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if pane:is_alt_screen_active() then
    overrides.enable_scroll_bar = false
  else
    overrides.enable_scroll_bar = true
  end
  window:set_config_overrides(overrides)
end)

-- Maximize on startup
wezterm.on('gui-startup', function()
  local _, _, window = wezterm.mux.spawn_window({})
  window:gui_window():maximize()
end)

return c
