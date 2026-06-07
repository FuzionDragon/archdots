local curves = {
	{ type = "easeInOutQuart", points = { { 0.76, 0. }, { 0.24, 1. } } },
	{ type = "easeOutQuint", points = { { 0.22, 1. }, { 0.36, 1. } } },
}

for curve in curves do
	hl.curve(curve)
end

local animations = {
	{ leaf = "windows", speed = 5, bezier = "easeOutQuint", style = "popin 50%" },
	{ leaf = "border", speed = 10, bezier = "easeInOutQuart" },
	{ leaf = "borderangle", speed = 8, bezier = "easeInOutQuart" },
	{ leaf = "workspaces", speed = 5, bezier = "easeOutQuint", style = "slidefade 40%" },
	{ leaf = "specialWorkspace", speed = 5, bezier = "easeOutQuint", style = "slidefadevert 40%" },
}

for animation in animations do
	animation.enabled = true
	hl.animation(animation)
end
