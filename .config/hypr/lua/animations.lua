hl.curve("easeInOutQuart", { type = "bezier", points = { { 0.76, 0. }, { 0.24, 1. } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1. }, { 0.36, 1. } } })

hl.animation({ leaf = "windows", speed = 5, bezier = "easeOutQuint", style = "popin 50%", enabled = true })
hl.animation({ leaf = "border", speed = 10, bezier = "easeInOutQuart", enabled = true })
hl.animation({ leaf = "borderangle", speed = 8, bezier = "easeInOutQuart", enabled = true })
hl.animation({ leaf = "workspaces", speed = 5, bezier = "easeOutQuint", style = "slidefade 40%", enabled = true })
hl.animation({
	leaf = "specialWorkspace",
	speed = 5,
	bezier = "easeOutQuint",
	style = "slidefadevert 40%",
	enabled = true,
})
