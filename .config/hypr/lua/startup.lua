local UWSM_PREFIX = "uwsm app -- "
local WALLPAPER_PATH = "~/Pictures/Wallpapers/outer-wilds.png"

hl.on("hyprland.start", function()
	hl.exec_cmd(UWSM_PREFIX .. "awww-daemon && awww img " .. WALLPAPER_PATH)
	hl.exec_cmd(UWSM_PREFIX .. "waybar")
	hl.exec_cmd(UWSM_PREFIX .. "gammastep")
	hl.exec_cmd(UWSM_PREFIX .. "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd(UWSM_PREFIX .. "wl-paste --type text --watch cliphist store")
	hl.exec_cmd(UWSM_PREFIX .. "wl-paste --type image --watch cliphist store")
	hl.exec_cmd(UWSM_PREFIX .. "gsettings set org.gnome.desktop.interface cursor-theme 'Nordzy-cursors'")
	hl.exec_cmd(UWSM_PREFIX .. "gsettings set org.gnome.desktop.interface cursor-size 24")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	hl.exec_cmd(UWSM_PREFIX .. "kitty cmus", { workspace = "special:music silent" })
end)

--#exec-once = bash -lc 'hyprctl output create headless VNC-1; '
