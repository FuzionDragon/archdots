local SUPER = "SUPER + "
local SUPERSHIFT = "SUPER + SHIFT + "
local SUPERCTRL = "SUPER + CTRL + "
local SUPERCTRLSHIFT = "SUPER + CTRL + SHIFT + "
local UWSM_PREFIX = "uwsm app -- "

-- Application bindings
hl.bind(SUPER .. "RETURN", UWSM_PREFIX .. "kitty")
hl.bind(SUPER .. "W", UWSM_PREFIX .. "zen-browser")
hl.bind(SUPER .. "T", UWSM_PREFIX .. "steam")
hl.bind(SUPER .. "D", UWSM_PREFIX .. "wdisplays")
hl.bind(SUPER .. "G", UWSM_PREFIX .. "godot")
hl.bind(SUPER .. "Y", UWSM_PREFIX .. "~/Applications/Page_Writer.AppImage")
hl.bind(SUPER .. "R", UWSM_PREFIX .. "kitty cmus")
hl.bind(SUPER .. "B", UWSM_PREFIX .. "kitty btop")
hl.bind(SUPER .. "P", UWSM_PREFIX .. "kitty alsamixer")
hl.bind(SUPERCTRL .. "P", UWSM_PREFIX .. "kitty nmtui")
hl.bind(SUPER .. "C", "cliphist list | rofi -dmenu | cliphist decode | wl-copy")
hl.bind(SUPER .. "SPACE", "rofi -show drun -run-command 'uwsm app -- {cmd}'")

-- Script bindings
hl.bind(SUPERSHIFT .. "E", UWSM_PREFIX .. "~/.scripts/refreshwaybar.sh")
hl.bind(SUPERSHIFT .. "S", "~/.scripts/grim_wl-copy.sh")
hl.bind(SUPERCTRL .. "S", "~/.scripts/grim_fullscreen.sh")
hl.bind(SUPERCTRLSHIFT .. "S", "~/.scripts/grim.sh")
hl.bind(SUPERCTRL .. "DELETE", "~/.scripts/powermenu.sh")

-- Window bindings
hl.bind(SUPER .. "Q", hl.dsp.window.kill(hl.get_active_window()))
hl.bind(SUPER .. "F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(SUPERCTRL .. "Q", function()
	hl.dsp.window.float({ action = "toggle" })
	hl.dsp.window.center()
end)
hl.bind(SUPERCTRL .. "TAB", hl.layout("swapwithmaster master"))
hl.bind(SUPERCTRL .. "H", hl.layout("orientationnext"))
hl.bind(SUPERCTRL .. "L", hl.layout("orentationprev"))
hl.bind(SUPER .. "J", hl.layout("focusmaster"))
hl.bind(SUPER .. "J", hl.layout("cyclenext"))
hl.bind(SUPER .. "UP", hl.layout("cyclenext"))
hl.bind(SUPER .. "K", hl.layout("cycleprev"))
hl.bind(SUPER .. "DOWN", hl.layout("cycleprev"))

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
	hl.bind(SUPER .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(SUPERSHIFT .. i, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces
hl.bind(SUPER .. "L", hl.dsp.focus({ workspace = hl.get_active_workspace().id + 1 }))
hl.bind(SUPER .. "RIGHT", hl.dsp.focus({ workspace = hl.get_active_workspace().id + 1 }))
hl.bind(SUPER .. "H", hl.dsp.focus({ workspace = hl.get_active_workspace().id - 1 }))
hl.bind(SUPER .. "LEFT", hl.dsp.focus({ workspace = hl.get_active_workspace().id - 1 }))

-- Move active window next/previous workspaces
hl.bind(SUPERSHIFT .. "L", hl.dsp.window.move({ workspace = hl.get_active_workspace().id + 1 }))
hl.bind(SUPERSHIFT .. "RIGHT", hl.dsp.window.move({ workspace = hl.get_active_workspace().id + 1 }))
hl.bind(SUPERSHIFT .. "H", hl.dsp.window.move({ workspace = hl.get_active_workspace().id - 1 }))
hl.bind(SUPERSHIFT .. "LEFT", hl.dsp.window.move({ workspace = hl.get_active_workspace().id - 1 }))

-- Move/resize windows
hl.bind(SUPER .. "mouse:272", hl.dsp.window.drag())
hl.bind(SUPERSHIFT .. "mouse:272", hl.dsp.window.resize())
hl.bind(SUPER .. "mouse:273", hl.dsp.window.resize())

-- Special workspace bindings
hl.bind(SUPERSHIFT .. "SPACE", hl.dsp.workspace.toggle_special("music"))
hl.bind(SUPERCTRL .. "SPACE", hl.dsp.workspace.toggle_special("notes"))
