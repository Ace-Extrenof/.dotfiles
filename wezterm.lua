local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
    config = wezterm.config_builder()
end


config.colors = {
  -- The default text color
  foreground = 'silver',
  -- The default background color
  background = '#1d2021',
}

config.font = wezterm.font_with_fallback {
  'FiraMono Nerd Font',
}

config.win32_system_backdrop = "Acrylic"
config.window_close_confirmation = 'NeverPrompt'
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.window_background_opacity = 0.86
config.scrollback_lines = 3000
config.default_workspace = "home"

-- Dim inactive panes
config.inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5,
}

config.use_fancy_tab_bar = false
config.enable_tab_bar = false

config.colors = {
    tab_bar = {
        -- The color of the inactive tab bar edge/divider
        inactive_tab_edge = "#1f1d2e",
    },
}

config.default_domain = "WSL:Debian"

return config
