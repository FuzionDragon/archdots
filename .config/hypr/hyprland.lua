require("lua/startup")
require("lua/animations")
require("lua/window_rules")
require("lua/bindings")

local inactive_colour = "rgb(293E40)"
local active_colour = "rgb(76698E)"

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
	inactive_opacity = 0.8,
	fullscreen_opacity = 1.,
	shadow = {
		color = "000000",
		range = 2,
		offset = { 1, 1 },
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
	action = "workspace",
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

local laptop_monitor = {
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
}
hl.monitor(laptop_monitor)
hl.monitor({
	output = "",
	mode = "highrr",
	position = "auto",
	scale = 1,
})

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

hl.bind("SUPER + SHIFT + CTRL + N", function()
	if #hl.get_monitors() > 1 then
		hl.monitor({ output = laptop_monitor.output, disabled = true })
	else
		hl.monitor(laptop_monitor)
		os.execute("hyprctl reload")
	end

	hl.exec_cmd("uswm app -- ~/.scripts/refreshwaybar.sh")
end)
