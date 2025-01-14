local wezterm = require('wezterm')
local config = {}

-- theming
config.color_scheme = 'carbonfox'

-- windows
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }
config.window_background_image = wezterm.home_dir .. '/.config/wezterm/xray.png'
config.window_background_image_hsb = { brightness = 0.25, hue = 1.0, saturation = 1.0, }
config.window_background_opacity = 1

-- tabs
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = true
config.use_fancy_tab_bar = true
config.window_frame = {
  font = wezterm.font { family = 'JetBrains Mono', weight = 'Bold' },
  font_size = 13.0,
  active_titlebar_bg = "none",
  inactive_titlebar_bg = 'none',
}

-- fonts
config.font = wezterm.font('JetBrains Mono') -- note: bundled with wezterm
config.font_size = 13.0
config.font_rules = {
  {
    font = wezterm.font(
      "JetBrains Mono",
      { weight = "Regular", stretch = "Normal", style = "Normal" }
    ),
  },
  {
    intensity = "Bold",
    font = wezterm.font(
      "JetBrains Mono",
      { weight = "ExtraBold", stretch = "Normal", style = "Normal" }
    ),
  },
}

-- multiplexing
config.keys = {
  { key = 'l',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  {
    key = 'r',
    mods = 'CMD',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.Multiple {
      wezterm.action.ActivatePaneDirection "Left",
      wezterm.action.SendKey { key = 'h', mods = 'ALT' },
    }
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.Multiple {
      wezterm.action.ActivatePaneDirection "Down",
      wezterm.action.SendKey { key = 'j', mods = 'ALT' },
    }
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.Multiple {
      wezterm.action.ActivatePaneDirection "Up",
      wezterm.action.SendKey { key = 'k', mods = 'ALT' },
    }
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.Multiple {
      wezterm.action.ActivatePaneDirection "Right",
      wezterm.action.SendKey { key = 'l', mods = 'ALT' },
    }
  },
}

return config
