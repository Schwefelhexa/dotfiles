-- Pull in the wezterm API
local wezterm = require 'wezterm'
local io = require 'io'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'CascadiaCode Nerd Font'
config.font_size = 12

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

config.default_prog = { '/bin/zsh', '-c', '$HOME/.files/scripts/terminal-startup' }
config.term = 'xterm-256color'

config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 250,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 250,
}

config.keys = {
	{
		key = 'f',
		mods = 'CTRL',
		action = wezterm.action.SpawnCommandInNewTab {
			args = { '/bin/zsh', '-c', 'tctrl open --client `tmux display-message -p "#{client_name}"`' }
		}
	},
	{
		key = 'y',
		mods = 'CTRL',
		action = wezterm.action.SpawnCommandInNewTab {
			args = { '/bin/zsh', '-c', 'tctrl open "~" --client `tmux display-message -p "#{client_name}"`' }
		}
	},
	{
		key = 'y',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SpawnCommandInNewTab {
			args = { '/bin/zsh', '-c', 'tctrl open "~" -n ssh --client `tmux display-message -p "#{client_name}"`' }
		}
	},
	{
		key = 'f',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SpawnCommandInNewTab {
			args = { '/bin/zsh', '-c',
				'/Users/albarn/Projects/sideprojects/tctrl/target/debug/tctrl open "~" --client `tmux display-message -p "#{client_name}"`' }
		}
	},
}

local function eval_cmd(command)
	local handle = io.popen(command)
	if handle == nil then
		return nil
	end

	local result = handle:read("*a")
	handle:close()
	result = string.sub(result, 1, -2)
	return result
end

wezterm.on('format-window-title', function()
  return eval_cmd('tmux display-message -p \'#S\'')
end)

-- and finally, return the configuration to wezterm
return config
