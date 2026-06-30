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
    output   = "eDP-1",
    mode     = "1920x1080",
    position = "1920x0",
    scale    = 1,
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty"
local fileManager = "yazi"
local menu        = "vicinae toggle"
local mainMod     = "SUPER"

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
    hl.exec_cmd("mako")
    -- hl.exec_cmd("waybar")
    hl.exec_cmd("systemctl --user start wayle.service")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("systemctl start fprintd")
    hl.exec_cmd("kdeconnect-indicator")
    hl.exec_cmd("vicinae server & disown")
    hl.exec_cmd("fcitx5 -d &")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")   -- store only text data
    hl.exec_cmd("wl-paste --type image --watch cliphist store")  -- store only image data
    hl.exec_cmd("nmcli connection down wg0")                     -- turn off vpn
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct") -- change to qt6ct if you have that


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        sensitivity  = 0.5, -- -1.0 - 1.0, 0 means no modification.
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
        gaps_in     = 5,
        gaps_out    = 20,
        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        layout = "dwindle", -- master / dwindle / scrolling / monocle

        allow_tearing = false,
    },

    decoration = {
        rounding = 10,

        blur = {
            enabled        = true,
            size           = 5,
            passes         = 2,
            ignore_opacity = true,
            vibrancy       = 0.2,
        },

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- rgba(1a1a1aee)
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
hl.curve("b0", { type = "bezier", points = { { 0, 1 },   { 0, 1.05 } } })
hl.curve("b1", { type = "bezier", points = { { 0, 1.1 }, { 0, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 4, bezier = "b1",      style = "slide" })
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 4, bezier = "b0",      style = "popin 88%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "b0",      style = "slide" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "slide" })


-----------------
---- DEVICES ----
-----------------

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.device({
    name         = "ydotoold-virtual-device-1",
    accel_profile = "flat",
})


------------------
---- GESTURES ----
------------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "down", action = "special", workspace_name = "magic" })
hl.gesture({ fingers = 4, direction = "left",  action = function() hl.dispatch(hl.dsp.window.move({ workspace = "e-1" })) end })
hl.gesture({ fingers = 4, direction = "right", action = function() hl.dispatch(hl.dsp.window.move({ workspace = "e+1" })) end })
hl.gesture({ fingers = 3, direction = "left", mods = "SUPER", action = function() hl.dispatch(hl.dsp.window.close()) end })


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
        workspace_count              = 10,        -- old plugin `count = 10`
        monitor_priority             = { "eDP-1" }, -- laptop gets workspaces 1-10
        enable_persistent_workspaces = false,     -- old plugin `enable_persistent_workspaces = 0`
    })
else
    hl.notification.create({ text = "split-monitor-workspaces not installed; using vanilla workspaces", timeout = 6000 })
end


---------------------
---- KEYBINDINGS ----
---------------------

-- === BASIC NAVIGATION & WINDOW MANAGEMENT ===

-- Window focus and movement
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ last = true })) -- closest to focuscurrentorlast

-- Window management
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SPACE", hl.dsp.window.swap({ next = true }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.float({ action = "toggle" }))

-- Window movement
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ direction = "r" }))

-- Window resizing
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))

-- Monitor focus
hl.bind(mainMod .. " + COMMA", hl.dsp.focus({ monitor = 0 }))
hl.bind(mainMod .. " + PERIOD", hl.dsp.focus({ monitor = 1 }))
hl.bind("CTRL + semicolon", hl.dsp.exec_cmd([[cur=$(hyprctl activeworkspace -j | jq .id); [ "$cur" = 1 ] && t=2 || t=1; hyprctl dispatch "hl.dsp.focus({ workspace = $t })"]]))

-- === APPLICATION LAUNCHERS & PROGRAMS ===

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", runOrRaise("foot", "foot -e " .. fileManager))
hl.bind(mainMod .. " + B", runOrRaise("brave-browser", "brave"))
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd("~/.config/hypr/scripts/bookmarks"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("bemenu-run -i"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .. " -e nvim ~/notes.txt"))
hl.bind(mainMod .. " + O", hl.dsp.window.move({ monitor = "+1", follow = true })) -- was split-changemonitor next: move active window to next monitor
hl.bind(mainMod .. " + SEMICOLON", hl.dsp.exec_cmd("~/.config/hypr/scripts/focus"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("~/.config/hypr/scripts/browser-search"))

-- === WORKSPACE MANAGEMENT ===

-- Switch / move-to workspace N on the focused monitor (via split-monitor-workspaces)
for i = 1, 10 do
    local key = (i == 10) and "0" or tostring(i)
    if smw_ok then
        hl.bind(mainMod .. " + " .. key, smw.workspace(tostring(i)))
        hl.bind(mainMod .. " + SHIFT + " .. key, smw.move_to_workspace(tostring(i)))
    else
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    end
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Workspace navigation (next/prev on the current monitor).
-- Replaces hyprnome, which is broken under the Lua config (old-syntax hyprctl dispatch).
if smw_ok then
    hl.bind(mainMod .. " + I", smw.workspace("+1"))
    hl.bind(mainMod .. " + U", smw.workspace("-1"))
    hl.bind(mainMod .. " + SHIFT + I", smw.move_to_workspace("+1"))
    hl.bind(mainMod .. " + SHIFT + U", smw.move_to_workspace("-1"))
else
    hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + U", hl.dsp.focus({ workspace = "e-1" }))
    hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "e+1" }))
    hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "e-1" }))
end

-- === SYSTEM CONTROLS ===

-- Volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind(mainMod .. " + bracketright", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind(mainMod .. " + bracketleft", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind(mainMod .. " + backslash", hl.dsp.exec_cmd("amixer set Master toggle"))

-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("lux -a 5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("lux -s 5%"))

-- System functions
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exit())
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))

-- === SPECIAL FEATURES & TOOLS ===

-- Clipboard and utilities
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | bemenu -l10 | cliphist decode | wl-copy"))

-- Scripts and tools
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("~/.config/hypr/scripts/config-edit"))
hl.bind(mainMod .. " + equal", hl.dsp.exec_cmd("~/.config/hypr/scripts/menu-calc"))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("~/.config/hypr/scripts/dkill"))
hl.bind(mainMod .. " + CTRL + M", hl.dsp.exec_cmd("~/.config/hypr/scripts/man"))
hl.bind(mainMod .. " + CTRL + SEMICOLON", hl.dsp.exec_cmd("~/.config/hypr/scripts/record"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/translate"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/dmenu-search"))

-- Notes system
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/quicknote"))
hl.bind(mainMod .. " + ALT + CTRL + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/rmnote"))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/viewnote"))

-- Device management
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd("udiskie-dmenu"))
hl.bind(mainMod .. " + ALT + b", hl.dsp.exec_cmd("dmenu-bluetooth"))
hl.bind(mainMod .. " + CTRL + i", hl.dsp.exec_cmd("networkmanager_dmenu"))

-- Hardware keys
hl.bind("XF86Messenger", runOrRaise("Slack", "slack"))
hl.bind("XF86Display", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/togglewindow"))

-- === MOUSE & CURSOR CONTROLS ===

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true }) -- was SUPER_CTRL


---------------------
---- SUBMAPS --------
---------------------

-- Power menu
hl.bind(mainMod .. " + CTRL + S", hl.dsp.submap("power"))
hl.define_submap("power", function()
    hl.bind("S", hl.dsp.exec_cmd("systemctl poweroff"))
    hl.bind("R", hl.dsp.exec_cmd("systemctl reboot"))
    hl.bind("L", hl.dsp.exec_cmd("pkill -KILL -u $USER"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Cursor mode (similar to Mouse mode in Sway). Enter with SUPER + g.
hl.bind(mainMod .. " + g", function()
    hl.exec_cmd("hyprctl keyword cursor:inactive_timeout 0; hyprctl keyword cursor:hide_on_key_press false")
    hl.dispatch(hl.dsp.submap("cursor"))
end)

hl.define_submap("cursor", function()
    -- Jump cursor to a position (wl-kbptr), re-entering the submap when done
    hl.bind("a", hl.dsp.exec_cmd([[hyprctl dispatch 'hl.dsp.submap("reset")' && wl-kbptr && hyprctl dispatch 'hl.dsp.submap("cursor")']]))

    -- Cursor movement
    hl.bind("j", hl.dsp.exec_cmd("wlrctl pointer move 0 10"), { repeating = true })
    hl.bind("k", hl.dsp.exec_cmd("wlrctl pointer move 0 -10"), { repeating = true })
    hl.bind("l", hl.dsp.exec_cmd("wlrctl pointer move 10 0"), { repeating = true })
    hl.bind("h", hl.dsp.exec_cmd("wlrctl pointer move -10 0"), { repeating = true })

    -- Mouse clicks
    hl.bind("comma", hl.dsp.exec_cmd("wlrctl pointer click left"))
    hl.bind("m", hl.dsp.exec_cmd("wlrctl pointer click middle"))
    hl.bind("period", hl.dsp.exec_cmd("wlrctl pointer click right"))

    -- Scroll up/down
    hl.bind("e", hl.dsp.exec_cmd("wlrctl pointer scroll 10 0"), { repeating = true })
    hl.bind("r", hl.dsp.exec_cmd("wlrctl pointer scroll -10 0"), { repeating = true })

    -- Scroll left/right
    hl.bind("t", hl.dsp.exec_cmd("wlrctl pointer scroll 0 -10"), { repeating = true })
    hl.bind("g", hl.dsp.exec_cmd("wlrctl pointer scroll 0 10"), { repeating = true })

    -- Exit cursor submap
    hl.bind("escape", function()
        hl.exec_cmd("hyprctl keyword cursor:inactive_timeout 3; hyprctl keyword cursor:hide_on_key_press true")
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end)


--------------------------------
---- WINDOW & LAYER RULES ------
--------------------------------

hl.window_rule({ name = "audio",            match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ name = "maximize-window",  match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ name = "browser-window",   match = { class = "^(brave-browser)$" }, workspace = "2" })
hl.window_rule({ name = "slack-window",     match = { class = "^(slack)$" }, workspace = "3" })
hl.window_rule({ name = "discord-window",   match = { class = "^(discord)$" }, workspace = "3", float = true })
hl.window_rule({ name = "emacs-window",     match = { class = "^(Emacs)$" }, workspace = "4" })
hl.window_rule({ name = "vlc-window",       match = { class = "^(vlc)$" }, workspace = "5" })
hl.window_rule({ name = "mpv-window",       match = { class = "^(mpv)$" }, workspace = "5" })
hl.window_rule({ name = "office-window",    match = { class = "^(libreoffice-calc)$" }, workspace = "5" })
hl.window_rule({ name = "virtual-window",   match = { class = "^(VirtualBox Manager)$" }, workspace = "6" })
hl.window_rule({ name = "foot-window",      match = { class = "^(foot)$" }, workspace = "7" })
hl.window_rule({ name = "email-window",     match = { class = "^(org.mozilla.Thunderbird)$" }, workspace = "8" })
hl.window_rule({ name = "gimp-window",      match = { class = "^(.*gimp.*)$" }, workspace = "9", float = true })
hl.window_rule({ name = "pdf-window",       match = { class = "^(org.pwmt.zathura)$" }, workspace = "10" })
hl.window_rule({ name = "chrome-window",    match = { class = "^(Chromium)$" }, workspace = "2" })
hl.window_rule({ name = "firefox-window",   match = { class = "^(firefox)$" }, workspace = "2" })
hl.window_rule({ name = "crank-window",     match = { class = "^(crankshaft)$" }, workspace = "10", fullscreen = true })
hl.window_rule({ name = "key-window",       match = { class = "showmethekey-gtk" }, pin = true, float = true })
hl.window_rule({ name = "bemenu-window",    match = { class = "^(bemenu)$" }, pin = true })
hl.window_rule({ name = "emulator-window",  match = { class = "^(Emulator)$" }, float = true })

-- Vicinae blur
hl.layer_rule({ name = "vicinae-blur", match = { namespace = "vicinae" }, blur = true, ignore_alpha = 0 })
