-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 11

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

config.default_prog = {'/bin/zsh', '-c', '$HOME/.files/scripts/terminal-startup'}
config.term = 'screen-256color-bce'

-- and finally, return the configuration to wezterm
return config

