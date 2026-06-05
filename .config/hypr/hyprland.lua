local inactive_colour = "293E40"
local active_colour = "76698E"

local laptop_monitor = {
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
}

local input = {
	kb_layout = "gb",
	kb_options = "caps:none",
	follow_mouse = 1,
	sensitivity = 0.0,
}

local general = {
	gaps_in = 5,
	gaps_out = 5,
	border_size = 1,
	allow_tearing = true,
	col = {
		active_border = active_colour,
		inactive_border = inactive_colour,
	},
	layout = "master",
}

local decoration = {
	rounding = 7,
	blur = {
		enabled = true,
		size = 3,
		passes = 1,
	},
	active_opacity = 1.,
	inactive_opacity = 1.,
	fullscreen_opacity = 1.,
	shadow = {
		color = "000000",
		range = 2,
		offset = { 0, 0 },
	},
}

local cursor = {
	inactive_timeout = 5,
}

local master = {
	smart_resizing = true,
	allow_small_split = true,
	mfact = 0.6,
}

local workspace_gesture = {
	fingers = 3,
	direction = "horizontal",
	actions = "workspace",
}

local misc = {
	disable_hyprland_logo = true,
	disable_splash_rendering = true,
	enable_swallow = false,
}

local ecosystem = {
	no_update_news = true,
	no_donation_nag = true,
}

hl.monitor(laptop_monitor)
hl.monitor({
	mode = "highrr",
	position = "auto",
	scale = 1,
})

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("~/.scripts/monitorswitch.sh"))
hl.bind("switch:off:Lid Switch", hl.monitor(laptop_monitor))

hl.config({
	general = general,
	input = input,
	decoration = decoration,
	cursor = cursor,
	master = master,
	misc = misc,
	ecosystem = ecosystem,
})
hl.gesture(workspace_gesture)

--
-- Need to implement these modules in lua
--
--# Startup Apps and Scripts
--source = ~/.config/hypr/startup.conf
--#source = ~/.cache/wal/colors-hyprland.conf
--source = ~/.colour_schemes/colors.conf
--#source = ~/.config/hypr/colors.conf
--# Window rules
--source = ~/.config/hypr/window_rules.conf
--
--# Bindings
--source = ~/.config/hypr/bindings.conf
-- #
-- # Animations
--source = ~/.config/hypr/animations.conf
