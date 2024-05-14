-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = false

-- and finally, return the configuration to wezterm
return config
