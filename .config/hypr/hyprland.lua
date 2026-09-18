-- ~/.config/hypr/hyprland.lua
-- Faithful 1:1 port of hyprland.conf to the Hyprland 0.55 Lua config format.
-- hyprland.conf is kept on disk as a rollback backup. Hyprland prefers this
-- .lua file over the .conf when both exist.
-- API reference: https://wiki.hypr.land/Configuring/Start/

-- Allow require()-ing the split-monitor-workspaces Lua package.
-- Absolute path so it resolves regardless of Hyprland's working directory.
package.path = package.path .. ";/home/shourov/.config/hypr/plugins/split-monitor-workspaces/lua/?.lua"

------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080",
	position = "1920x0",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local fileManager = "yazi"
local menu = "vicinae toggle"
local mainMod = "SUPER"
local ipc = "noctalia msg "

-- Run-or-raise helper. Replaces the `raise` tool, which is broken under the Lua
-- config (it emits old-syntax `hyprctl dispatch focuswindow ...`). Our script
-- focuses an existing window by class, else launches it, using Lua-syntax dispatch.
local function runOrRaise(class, launch)
	return hl.dsp.exec_cmd(string.format("~/.config/hypr/scripts/run-or-raise %q %q", class, launch))
end

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	-- hl.exec_cmd("mako")
	-- hl.exec_cmd("waybar")
	-- hl.exec_cmd("systemctl --user start wayle.service")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("kdeconnectd")
	hl.exec_cmd("systemctl start fprintd")
	hl.exec_cmd("kdeconnect-indicator")
	hl.exec_cmd("vicinae server & disown")
	hl.exec_cmd("fcitx5 -d &")
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- store only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- store only image data
	hl.exec_cmd("nmcli connection down wg0") -- turn off vpn
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("noctalia")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- bemenu-run scans Hyprland's own PATH, which misses the dirs that only exist in
-- fish's fish_user_paths (e.g. the gcal script) and ~/.local/bin (gcalcli).
local path_extra = os.getenv("HOME") .. "/Documents/dot-files/scripts:" .. os.getenv("HOME") .. "/.local/bin"
if not os.getenv("PATH"):find(path_extra, 1, true) then
	hl.env("PATH", path_extra .. ":" .. os.getenv("PATH"))
end

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct") -- change to qt6ct if you have that
-- Match bemenu's line height to the noctalia bar height (40px).
hl.env("BEMENU_OPTS", "--fn 'JetBrainsMono 14' -H40")

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		sensitivity = 0.5, -- -1.0 - 1.0, 0 means no modification.
		follow_mouse = 1,

		touchpad = {
			natural_scroll = false,
		},
	},
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		layout = "master", -- master / dwindle / scrolling / monocle

		allow_tearing = false,
	},

	decoration = {
		rounding = 10,

		blur = {
			enabled = true,
			size = 5,
			passes = 2,
			ignore_opacity = true,
			vibrancy = 0.2,
		},

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a, -- rgba(1a1a1aee)
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true, -- you probably want this
	},

	master = {
		new_status = "slave",
	},

	scrolling = {
		column_width = 1.0,
	},

	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
	},
})

-- Animation curves (hyprlang `bezier = name, x0,y0,x1,y1`)
hl.curve("b0", { type = "bezier", points = { { 0, 1 }, { 0, 1.05 } } })
hl.curve("b1", { type = "bezier", points = { { 0, 1.1 }, { 0, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "b1", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "b0", style = "popin 88%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "b0", style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "slide" })

-----------------
---- DEVICES ----
-----------------

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.device({
	name = "ydotoold-virtual-device-1",
	accel_profile = "flat",
})

------------------
---- GESTURES ----
------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "down", action = "special", workspace_name = "magic" })
hl.gesture({
	fingers = 4,
	direction = "left",
	action = function()
		hl.dispatch(hl.dsp.window.move({ workspace = "e-1" }))
	end,
})
hl.gesture({
	fingers = 4,
	direction = "right",
	action = function()
		hl.dispatch(hl.dsp.window.move({ workspace = "e+1" }))
	end,
})
hl.gesture({
	fingers = 3,
	direction = "left",
	mods = "SUPER",
	action = function()
		hl.dispatch(hl.dsp.window.close())
	end,
})

--------------------------------------
---- SPLIT-MONITOR-WORKSPACES PLUGIN --
--------------------------------------
-- Lua package replacing the old cpp plugin + `plugin { split-monitor-workspaces {} }`
-- block and the manual `workspace = N, monitor:X` rules (the package owns
-- workspace<->monitor mapping). Install with:
--   mkdir -p ~/.config/hypr/plugins
--   git clone -b release/0.55.x https://github.com/zjeffer/split-monitor-workspaces \
--       ~/.config/hypr/plugins/split-monitor-workspaces
-- Guarded so the config still loads (with vanilla workspace behavior) if absent.

local smw_ok, smw = pcall(require, "split-monitor-workspaces")
if smw_ok then
	smw.setup({
		workspace_count = 10, -- old plugin `count = 10`
		monitor_priority = { "eDP-1" }, -- laptop gets workspaces 1-10
		enable_persistent_workspaces = false, -- old plugin `enable_persistent_workspaces = 0`
	})
else
	hl.notification.create({ text = "split-monitor-workspaces not installed; using vanilla workspaces", timeout = 6000 })
end

---------------------
---- KEYBINDINGS ----
---------------------
--
-- Tier = semantic, so a bind can be derived instead of recalled:
--
--   SUPER           act on the focused window, or reach a daily app
--   SUPER + SHIFT   the same thing, taking the window along
--   SUPER + CTRL    system / settings panel
--   SUPER + ALT     utility script (the dmenu tools)
--   submaps         modal operations (resize, power)
--   bare XF86*      hardware; always locked + repeating
--
-- Keysyms are lowercase throughout. Hyprland stores the spelling literally, so
-- `SEMICOLON` and `semicolon` register as two separate, independent binds.

local script = "~/.config/hypr/scripts/"

-- hl.bind plus a mandatory description, which is what lets the SUPER+CTRL+K
-- cheatsheet generate itself from `hyprctl binds -j`.
local function bind(keys, action, desc, opts)
	opts = opts or {}
	opts.description = desc
	hl.bind(keys, action, opts)
end

-- === SUPER / SUPER+SHIFT: focus and move ===

-- Arrows are bound alongside hjkl; sway and i3 both ship both, and it costs
-- nothing to serve either habit.
for _, d in ipairs({
	{ letter = "h", arrow = "left", dir = "l", label = "left" },
	{ letter = "j", arrow = "down", dir = "d", label = "down" },
	{ letter = "k", arrow = "up", dir = "u", label = "up" },
	{ letter = "l", arrow = "right", dir = "r", label = "right" },
}) do
	for _, key in ipairs({ d.letter, d.arrow }) do
		bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = d.dir }), "Focus " .. d.label)
		bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = d.dir }), "Move window " .. d.label)
	end
end

-- === SUPER: window verbs ===

bind(mainMod .. " + tab", hl.dsp.focus({ last = true }), "Focus last window")
bind(mainMod .. " + w", hl.dsp.window.close(), "Close window")
bind(mainMod .. " + m", hl.dsp.window.fullscreen(), "Fullscreen")
bind(mainMod .. " + r", hl.dsp.submap("resize"), "Resize mode")
bind(mainMod .. " + SHIFT + space", hl.dsp.window.swap({ next = true }), "Swap with next window")
bind(mainMod .. " + SHIFT + m", hl.dsp.layout("swapwithmaster"), "Swap with master")

-- === SUPER: daily apps ===

bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal), "Terminal")
bind(mainMod .. " + space", hl.dsp.exec_cmd(menu), "Launcher")
bind(mainMod .. " + e", runOrRaise("foot", "foot -e " .. fileManager), "File manager")
bind(mainMod .. " + b", runOrRaise("brave-browser", "brave"), "Browser")
bind(mainMod .. " + v", hl.dsp.exec_cmd("cliphist list | bemenu -l10 | cliphist decode | wl-copy"), "Clipboard history")
bind(mainMod .. " + equal", hl.dsp.exec_cmd(script .. "menu-calc"), "Calculator")
bind(mainMod .. " + p", hl.dsp.exec_cmd("bemenu-run -i"), "Run command")
bind(mainMod .. " + t", hl.dsp.exec_cmd(script .. "translate"), "Translate")
bind(
	mainMod .. " +  f",
	hl.dsp.exec_cmd(
		[[hyprctl clients -j | jq -e 'any(.[]; .class | test("brave-browser"))' >/dev/null 2>&1 && hyprctl dispatch "hl.dsp.focus({ window = \"class:brave-browser\" })"; ~/.config/hypr/scripts/browser-search]]
	),
	"Search in browser"
)


-- === Monitors ===

bind(mainMod .. " + comma", hl.dsp.focus({ monitor = 0 }), "Focus monitor 1")
bind(mainMod .. " + period", hl.dsp.focus({ monitor = 1 }), "Focus monitor 2")
bind(mainMod .. " + o", hl.dsp.window.move({ monitor = "+1", follow = true }), "Move window to next monitor")

-- === Workspaces ===

for i = 1, 10 do
	local key = (i == 10) and "0" or tostring(i)
	if smw_ok then
		bind(mainMod .. " + " .. key, smw.workspace(tostring(i)), "Workspace " .. i)
		bind(mainMod .. " + SHIFT + " .. key, smw.move_to_workspace(tostring(i)), "Move window to workspace " .. i)
	else
		bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), "Workspace " .. i)
		bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), "Move window to workspace " .. i)
	end
end

-- Next/prev workspace on the current monitor. Replaces hyprnome, which is broken
-- under the Lua config (it emits old-syntax `hyprctl dispatch`).
if smw_ok then
	bind(mainMod .. " + i", smw.workspace("+1"), "Next workspace")
	bind(mainMod .. " + u", smw.workspace("-1"), "Previous workspace")
	bind(mainMod .. " + SHIFT + i", smw.move_to_workspace("+1"), "Move window to next workspace")
	bind(mainMod .. " + SHIFT + u", smw.move_to_workspace("-1"), "Move window to previous workspace")
else
	bind(mainMod .. " + i", hl.dsp.focus({ workspace = "e+1" }), "Next workspace")
	bind(mainMod .. " + u", hl.dsp.focus({ workspace = "e-1" }), "Previous workspace")
	bind(mainMod .. " + SHIFT + i", hl.dsp.window.move({ workspace = "e+1" }), "Move window to next workspace")
	bind(mainMod .. " + SHIFT + u", hl.dsp.window.move({ workspace = "e-1" }), "Move window to previous workspace")
end

bind(mainMod .. " + grave", hl.dsp.focus({ workspace = "previous" }), "Last workspace")

-- Scratchpad
bind(mainMod .. " + s", hl.dsp.workspace.toggle_special("magic"), "Toggle scratchpad")
bind(mainMod .. " + SHIFT + s", hl.dsp.window.move({ workspace = "special:magic" }), "Move window to scratchpad")

-- === SUPER+CTRL: system panels ===

bind(mainMod .. " + CTRL + o", hl.dsp.exec_cmd(script .. "bookmarks"), "Bookmarks")
bind(mainMod .. " + CTRL + l", hl.dsp.exec_cmd(ipc .. "session lock"), "Lock screen")
bind(mainMod .. " + CTRL + s", hl.dsp.exec_cmd(ipc .. "panel-toggle session"), "Power menu")
bind(mainMod .. " + CTRL + a", hl.dsp.exec_cmd(script .. "sinkswitch.sh"), "Audio output")
bind(mainMod .. " + CTRL + b", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center bluetooth"), "Bluetooth")
bind(mainMod .. " + CTRL + k", hl.dsp.exec_cmd(script .. "dkill"), "Kill process")
bind(mainMod .. " + CTRL + w", hl.dsp.exec_cmd("networkmanager_dmenu"), "Network")
bind(mainMod .. " + CTRL + f", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind(mainMod .. " + CTRL + m", hl.dsp.exec_cmd("udiskie-dmenu"), "Mount device")
bind(mainMod .. " + CTRL + h", hl.dsp.exec_cmd(script .. "keybinds"), "Show keybindings")
bind(mainMod .. " + CTRL + p", hl.dsp.exec_cmd(script .. "screenshot"), "Screenshot")
bind(mainMod .. " + CTRL + q", hl.dsp.exit(), "Exit Hyprland")
bind(mainMod .. " + CTRL + r", hl.dsp.exec_cmd(script .. "record"), "Screen record")

-- === SUPER+ALT: utility scripts ===

bind(mainMod .. " + ALT + m", hl.dsp.exec_cmd(script .. "man"), "Man pages")

-- Notes
bind(mainMod .. " + ALT + n", hl.dsp.exec_cmd(script .. "quicknote"), "Quick note")
bind(mainMod .. " + ALT + v", hl.dsp.exec_cmd(script .. "viewnote"), "View notes")
bind(mainMod .. " + ALT + SHIFT + n", hl.dsp.exec_cmd(script .. "rmnote"), "Delete note")

-- === Hardware keys ===

-- locked = true keeps these working on the lock screen; repeating = true lets
-- them fire while held. Both follow /usr/share/hypr/hyprland.lua.
-- noctalia changes the level and draws the OSD in one call.
for _, m in ipairs({
	{ cmd = "volume-up", desc = "Volume up", keys = { "XF86AudioRaiseVolume", mainMod .. " + bracketright" } },
	{ cmd = "volume-down", desc = "Volume down", keys = { "XF86AudioLowerVolume", mainMod .. " + bracketleft" } },
	{ cmd = "volume-mute", desc = "Mute", keys = { "XF86AudioMute", mainMod .. " + backslash" } },
	{ cmd = "mic-mute", desc = "Mute microphone", keys = { "XF86AudioMicMute" } },
	{ cmd = "brightness-up", desc = "Brightness up", keys = { "XF86MonBrightnessUp" } },
	{ cmd = "brightness-down", desc = "Brightness down", keys = { "XF86MonBrightnessDown" } },
}) do
	for _, key in ipairs(m.keys) do
		bind(key, hl.dsp.exec_cmd(ipc .. m.cmd), m.desc, { locked = true, repeating = true })
	end
end

bind("XF86Messenger", runOrRaise("Slack", "slack"), "Slack")
bind("XF86Display", hl.dsp.window.move({ monitor = "+1", follow = true }), "Move window to next monitor")

-- === Mouse ===

bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), "Drag window", { mouse = true })
bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), "Resize window", { mouse = true })

---------------------
---- SUBMAPS --------
---------------------

-- Resize mode: SUPER+R, then hjkl/arrows, escape to leave.
hl.define_submap("resize", function()
	for _, d in ipairs({
		{ letter = "h", arrow = "left", x = -40, y = 0 },
		{ letter = "j", arrow = "down", x = 0, y = 40 },
		{ letter = "k", arrow = "up", x = 0, y = -40 },
		{ letter = "l", arrow = "right", x = 40, y = 0 },
	}) do
		for _, key in ipairs({ d.letter, d.arrow }) do
			hl.bind(key, hl.dsp.window.resize({ x = d.x, y = d.y, relative = true }), { repeating = true })
		end
	end
	hl.bind("o", hl.dsp.layout("orientationcycle left top"))
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("return", hl.dsp.submap("reset"))
end)

--------------------------------
---- WINDOW & LAYER RULES ------
--------------------------------

hl.window_rule({ name = "audio", match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ name = "maximize-window", match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ name = "browser-window", match = { class = "^(brave-browser)$" }, workspace = "2" })
hl.window_rule({ name = "slack-window", match = { class = "^(slack)$" }, workspace = "3" })
hl.window_rule({ name = "discord-window", match = { class = "^(discord)$" }, workspace = "3", float = true })
hl.window_rule({ name = "emacs-window", match = { class = "^(Emacs)$" }, workspace = "4" })
hl.window_rule({ name = "vlc-window", match = { class = "^(vlc)$" }, workspace = "5" })
hl.window_rule({ name = "mpv-window", match = { class = "^(mpv)$" }, workspace = "5" })
hl.window_rule({ name = "office-window", match = { class = "^(libreoffice-calc)$" }, workspace = "5" })
hl.window_rule({ name = "virtual-window", match = { class = "^(VirtualBox Manager)$" }, workspace = "6" })
hl.window_rule({ name = "foot-window", match = { class = "^(foot)$" }, workspace = "7" })
hl.window_rule({ name = "email-window", match = { class = "^(org.mozilla.Thunderbird)$" }, workspace = "8" })
hl.window_rule({ name = "gimp-window", match = { class = "^(.*gimp.*)$" }, workspace = "9", float = true })
hl.window_rule({ name = "pdf-window", match = { class = "^(org.pwmt.zathura)$" }, workspace = "10" })
hl.window_rule({ name = "epub-window", match = { class = "^(com.github.johnfactotum.Foliate)$" }, workspace = "10" })
hl.window_rule({ name = "chrome-window", match = { class = "^(Chromium)$" }, workspace = "2" })
hl.window_rule({ name = "firefox-window", match = { class = "^(firefox)$" }, workspace = "2" })
hl.window_rule({ name = "crank-window", match = { class = "^(crankshaft)$" }, workspace = "10", fullscreen = true })
hl.window_rule({ name = "key-window", match = { class = "showmethekey-gtk" }, pin = true, float = true })
hl.window_rule({ name = "bemenu-window", match = { class = "^(bemenu)$" }, pin = true })
hl.window_rule({ name = "emulator-window", match = { class = "^(Emulator)$" }, float = true })

-- Vicinae blur
hl.layer_rule({ name = "vicinae-blur", match = { namespace = "vicinae" }, blur = true, ignore_alpha = 0 })

-- Noctalia
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
	},

	decoration = {
		rounding = 20,
		rounding_power = 2,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
