local SUPER = "SUPER + "
local SUPERSHIFT = "SUPER + SHIFT + "
local SUPERCTRL = "SUPER + CTRL + "
local SUPERCTRLSHIFT = "SUPER + CTRL + SHIFT + "
local UWSM_PREFIX = "uwsm app -- "

-- Application bindings
hl.bind(SUPER .. "RETURN", hl.dsp.exec_cmd(UWSM_PREFIX .. "kitty"))
hl.bind(SUPER .. "W", hl.dsp.exec_cmd(UWSM_PREFIX .. "zen-browser"))
hl.bind(SUPER .. "T", hl.dsp.exec_cmd(UWSM_PREFIX .. "steam"))
hl.bind(SUPER .. "D", hl.dsp.exec_cmd(UWSM_PREFIX .. "wdisplays"))
hl.bind(SUPER .. "G", hl.dsp.exec_cmd(UWSM_PREFIX .. "godot"))
hl.bind(SUPER .. "V", hl.dsp.exec_cmd(UWSM_PREFIX .. "virt-manager"))
hl.bind(SUPER .. "Y", hl.dsp.exec_cmd(UWSM_PREFIX .. "~/Applications/Page_Writer.AppImage"))
hl.bind(SUPER .. "R", hl.dsp.exec_cmd(UWSM_PREFIX .. "kitty cmus"))
hl.bind(SUPER .. "B", hl.dsp.exec_cmd(UWSM_PREFIX .. "kitty btop"))
hl.bind(SUPER .. "P", hl.dsp.exec_cmd(UWSM_PREFIX .. "kitty alsamixer"))
hl.bind(SUPERCTRL .. "P", hl.dsp.exec_cmd(UWSM_PREFIX .. "kitty nmtui"))
hl.bind(SUPER .. "C", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(SUPER .. "SPACE", hl.dsp.exec_cmd("rofi -show drun -run-command 'uwsm app -- {cmd}'"))

-- Script bindings
hl.bind(SUPERSHIFT .. "E", hl.dsp.exec_cmd(UWSM_PREFIX .. "~/.scripts/refreshwaybar.sh"))
hl.bind(SUPERSHIFT .. "S", hl.dsp.exec_cmd("~/.scripts/grim_wl-copy.sh"))
hl.bind(SUPERCTRL .. "S", hl.dsp.exec_cmd("~/.scripts/grim_fullscreen.sh"))
hl.bind(SUPERCTRLSHIFT .. "S", hl.dsp.exec_cmd("~/.scripts/grim.sh"))
hl.bind(SUPERCTRL .. "DELETE", hl.dsp.exec_cmd("~/.scripts/powermenu.sh"))

-- Window bindings
hl.bind(SUPER .. "Q", hl.dsp.window.kill(hl.get_active_window()))
hl.bind(SUPER .. "F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(SUPERCTRL .. "Q", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(SUPERCTRL .. "TAB", hl.dsp.layout("swapwithmaster master"))
hl.bind(SUPERCTRL .. "H", hl.dsp.layout("orientationnext"))
hl.bind(SUPERCTRL .. "L", hl.dsp.layout("orentationprev"))
hl.bind(SUPER .. "Z", hl.dsp.layout("focusmaster"))
hl.bind(SUPER .. "J", hl.dsp.layout("cyclenext"))
hl.bind(SUPER .. "UP", hl.dsp.layout("cyclenext"))
hl.bind(SUPER .. "K", hl.dsp.layout("cycleprev"))
hl.bind(SUPER .. "DOWN", hl.dsp.layout("cycleprev"))

-- System bindings
hl.bind(SUPERCTRLSHIFT .. "M", hl.dsp.exit())
hl.bind(SUPERCTRLSHIFT .. "DELETE", hl.dsp.exec_cmd("poweroff"))
hl.bind(SUPERCTRLSHIFT .. "L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(SUPERCTRLSHIFT .. "BACKSPACE", hl.dsp.exec_cmd("reboot"))
hl.bind(SUPERCTRLSHIFT .. "K", hl.dsp.exec_cmd("systemctl start kanata.service"))

-- Audio bindings
hl.bind(SUPERCTRL .. "RETURN", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind(SUPERSHIFT .. "RETURN", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind(SUPERCTRL .. "DOWN", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { repeating = true })
hl.bind(SUPERCTRL .. "J", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { repeating = true })
hl.bind(SUPERCTRL .. "UP", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"), { repeating = true })
hl.bind(SUPERCTRL .. "K", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"), { repeating = true })

-- Brightness bindings
hl.bind(SUPERSHIFT .. "DOWN", hl.dsp.exec_cmd("brightnessctl set 1%-"), { repeating = true })
hl.bind(SUPERSHIFT .. "J", hl.dsp.exec_cmd("brightnessctl set 1%-"), { repeating = true })
hl.bind(SUPERSHIFT .. "UP", hl.dsp.exec_cmd("brightnessctl set 1%+"), { repeating = true })
hl.bind(SUPERSHIFT .. "K", hl.dsp.exec_cmd("brightnessctl set 1%+"), { repeating = true })

-- Workspace bindings
for i = 1, 10 do
	local key = i % 10
	hl.bind(SUPER .. key, hl.dsp.focus({ workspace = key }))
	hl.bind(SUPERSHIFT .. key, hl.dsp.window.move({ workspace = key }))
end

-- Scroll through existing workspaces
hl.bind(SUPER .. "L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SUPER .. "RIGHT", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SUPER .. "H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(SUPER .. "LEFT", hl.dsp.focus({ workspace = "e-1" }))

-- Move active window next/previous workspaces
hl.bind(SUPERSHIFT .. "L", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(SUPERSHIFT .. "RIGHT", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(SUPERSHIFT .. "H", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(SUPERSHIFT .. "LEFT", hl.dsp.window.move({ workspace = "e-1" }))

-- Move/resize windows
hl.bind(SUPER .. "mouse:272", hl.dsp.window.drag())
hl.bind(SUPERSHIFT .. "mouse:272", hl.dsp.window.resize())
hl.bind(SUPER .. "mouse:273", hl.dsp.window.resize())

-- Special workspace bindings
hl.bind(SUPERSHIFT .. "SPACE", hl.dsp.workspace.toggle_special("music"))
hl.bind(SUPERCTRL .. "SPACE", hl.dsp.workspace.toggle_special("notes"))

-- MPRIS Binds
hl.bind(SUPERSHIFT .. "COMMA", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(SUPERSHIFT .. "PERIOD", hl.dsp.exec_cmd("playerctl next"))
hl.bind(SUPERSHIFT .. "P", hl.dsp.exec_cmd("playerctl play-pause"))
