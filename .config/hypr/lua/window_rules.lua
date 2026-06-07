hl.window_rule({
	name = "steam rule",
	match = {
		class = "steam",
		title = "^$",
	},
	stay_focused = true,
})

hl.window_rule({
	name = "idle inhibit rule",
	idle_inhibit = "fullscreen",
	match = {
		class = "^(*)$",
		title = "^(*)$",
		fullscreen = true,
	},
})
