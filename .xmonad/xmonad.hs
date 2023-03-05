import qualified Data.Map                         as M
import           Data.Monoid
import           Graphics.X11.ExtraTypes.XF86
import           System.Exit
import           XMonad
import           XMonad.Actions.CycleWS
import           XMonad.Actions.GridSelect
import           XMonad.Actions.OnScreen
import           XMonad.Actions.PhysicalScreens
import           XMonad.Actions.WindowGo
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.StatusBar
import           XMonad.Hooks.StatusBar.PP
import           XMonad.Layout.Gaps
import           XMonad.Layout.IndependentScreens
import           XMonad.Layout.Spacing
import qualified XMonad.StackSet                  as W
import           XMonad.Util.EZConfig
import           XMonad.Util.Run
import           XMonad.Util.SpawnOnce
import           XMonad.Util.WorkspaceCompare

myTerminal = "kitty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myModMask = mod4Mask
myBorderWidth = 1
myNormalBorderColor = "transparent"
myFocusedBorderColor = "#03A9F4"

myWorkspaces = ["1", "2", "3", "4"]

myKeys conf@(XConfig{XMonad.modMask = modm}) =
    M.fromList $
        -- launch a terminal
        [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
        , -- launch applications
          ((modm, xK_p), spawn "rofi -show drun -show-icons")
        , -- Chromium
          ((modm, xK_b), runOrRaise "chromium" (className =? "Chromium"))
        , -- close focused window
          ((modm .|. shiftMask, xK_c), kill)
        , -- Rotate through the available layout algorithms
          ((modm, xK_space), sendMessage NextLayout)
        , --  Reset the layouts on the current workspace to default
          ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
        , -- Resize viewed windows to the correct size
          ((modm, xK_n), refresh)
        , -- Move focus to the next window
          ((modm, xK_Tab), windows W.focusDown)
        , -- Move focus to the next window
          ((modm, xK_j), windows W.focusDown)
        , -- Move focus to the previous window
          ((modm, xK_k), windows W.focusUp)
        , -- Move focus to the master window
          ((modm, xK_m), windows W.focusMaster)
        , ((modm, xK_f), goToSelected def)
        , -- Move between windows
          ((modm, xK_i), nextWS)
        , ((modm, xK_u), prevWS)
        , ((mod1Mask, xK_i), nextWS)
        , ((mod1Mask, xK_u), prevWS)
        , ((modm .|. shiftMask, xK_i), shiftToNext)
        , ((modm .|. shiftMask, xK_u), shiftToPrev)
        , -- Swap the focused window and the master window
          ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
        , -- Swap the focused window with the next window
          ((modm .|. shiftMask, xK_j), windows W.swapDown)
        , -- Swap the focused window with the previous window
          ((modm .|. shiftMask, xK_k), windows W.swapUp)
        , -- Shrink the master area
          ((modm, xK_h), sendMessage Shrink)
        , -- Expand the master area
          ((modm, xK_l), sendMessage Expand)
        , -- Push window back into tiling
          ((modm, xK_t), withFocused $ windows . W.sink)
        , -- Increment the number of windows in the master area
          -- ((modm, xK_comma), sendMessage (IncMasterN 1))
          -- Deincrement the number of windows in the master area
          -- ((modm, xK_period), sendMessage (IncMasterN (-1)))
          -- ,
          -- Toggle the status bar gap
          -- Use this binding with avoidStruts from Hooks.ManageDocks.
          -- See also the statusBar function from Hooks.DynamicLog.
          --
          ((modm .|. mod1Mask, xK_b), sendMessage ToggleStruts)
        , -- Shutdown, restart, lock
          ((modm .|. controlMask, xK_s), spawn "shutdown now")
        , ((modm .|. controlMask, xK_r), spawn "shutdown -r now")
        , ((modm .|. controlMask, xK_l), spawn "betterlockscreen --lock blur")
        , -- Bluetooth connection
          ((modm .|. controlMask, xK_b), spawn "dmenu-bluetooth")
        , -- Volume controller
          ((modm .|. controlMask, xK_comma), spawn "pactl set-sink-volume 0 -5%")
        , ((modm .|. controlMask, xK_period), spawn "pactl set-sink-volume 0 +5%")
        , ((modm .|. controlMask, xK_m), spawn "pactl set-sink-mute 0 toggle")
        , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume 0 -5%")
        , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume 0 +5%")
        , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute 0 toggle")
        ,
            ( (0, xF86XK_AudioMicMute)
            , spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle"
            )
        , -- Brightness controller
          ((0, xF86XK_MonBrightnessUp), spawn "lux -a 5%")
        , ((0, xF86XK_MonBrightnessDown), spawn "lux -s 5%")
        , -- Network switch
          ((modm .|. mod1Mask, xK_i), spawn "networkmanager_dmenu")
        , -- Screenshot
          ((controlMask .|. shiftMask, xK_5), spawn "flameshot gui")
        , -- Slack shortcut
          ((0, xF86XK_Messenger), runOrRaise "slack" (className =? "Slack"))
        , -- Quit xmonad
          ((modm .|. shiftMask, xK_q), io exitSuccess)
        , -- Restart xmonad
          ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
        ]
            ++
            --
            -- mod-[1..9], Switch to workspace N
            -- mod-shift-[1..9], Move client to workspace N
            --
            [ ((m .|. mod1Mask, k), windows $ f i)
            | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
            ]
            ++
            -- alt-[1..9] also switch workpaces
            [ ((m .|. modm, k), windows $ f i)
            | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
            , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
            ]
            ++
            -- mod-{comma,period}, Switch to physical/Xinerama screens 1 or 2
            -- mod-shift-{comma,period}, Move client to screen 1 or 2
            --
            [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
            | (key, sc) <- zip [xK_comma, xK_period] [0 ..]
            , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
            ]

-- myKeys = \conf ->
--   mkKeymap conf
--     $  [ ("M-<Return>"            , spawn $ XMonad.terminal conf)
--        , ("M-p", spawn "rofi -show drun -show-icons")
--        , ("M-b", runOrRaise "chromium" (className =? "Chromium"))
--        , ("M-S-c"                 , kill)
--        , ("M-<Space>"             , sendMessage NextLayout)
--        , ("M-n"                   , refresh)
--        , ("M-<Tab>"               , windows W.focusDown)
--        , ("M-j"                   , windows W.focusDown)
--        , ("M-k"                   , windows W.focusUp)
--        , ("M-m"                   , windows W.focusMaster)
--        , ("M-i"                   , nextWS)
--        , ("M-u"                   , prevWS)
--        , ("M-S-i"                 , shiftToNext)
--        , ("M-S-u"                 , shiftToPrev)
--        , ("M-S-<Return>"          , windows W.swapMaster)
--        , ("M-S-j"                 , windows W.swapDown)
--        , ("M-S-k"                 , windows W.swapUp)
--        , ("M-h"                   , sendMessage Shrink)
--        , ("M-l"                   , sendMessage Expand)
--        , ("M-t"                   , withFocused $ windows . W.sink)
--        , ("M-S-b"                 , sendMessage ToggleStruts)
--        , ("M-C-s"                 , spawn "shutdown now")
--        , ("M-C-r"                 , spawn "shutdown -r now")
--        , ("M-C-l", spawn "betterlockscreen --lock blur")
--        , ("M-C-b"                 , spawn "dmenu-bluetooth")
--        , ("M-C-,", spawn "pactl set-sink-volume 0 -5%")
--        , ("M-C-.", spawn "pactl set-sink-volume 0 +5%")
--        , ("M-C-m", spawn "pactl set-sink-mute 0 toggle")
--        , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume 0 -5%")
--        , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume 0 +5%")
--        , ("<XF86AudioMute>", spawn "pactl set-sink-mute 0 toggle")
--        , ( "<XF86AudioMicMute>"
--          , spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle"
--          )
--        , ("<XF86MonBrightnessUp>"  , spawn "lux -a 5%")
--        , ("<XF86MonBrightnessDown>", spawn "lux -s 5%")
--        , ("M-<Alt_L>-i"            , spawn "networkmanager_dmenu")
--        , ("C-S-5"                  , spawn "flameshot gui ")
--        , ("<XF86Messenger>", runOrRaise "slack" (className =? "Slack"))
--        , ("M-S-q"                  , io exitSuccess)
--        , ("M-q", spawn "xmonad --recompile; xmonad --restart")
--        , ("M-,"                    , prevScreen)
--        , ("M-."                    , nextScreen)
--        ]
--
--     ++ [ ("M-" ++ m ++ k, windows $ f i)
--        | (i, k) <- zip myWorkspaces ["1", "2", "3", "4"]
--        , (f, m) <- [(W.greedyView, ""), (W.shift, "S-")]
--        ]
--

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig{XMonad.modMask = modm}) =
    M.fromList
        -- mod-button1, Set the window to floating mode and move by dragging
        [
            ( (modm, button1)
            , \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster
            )
        , -- mod-button2, Raise the window to the top of the stack
          ((modm, button2), \w -> focus w >> windows W.shiftMaster)
        , -- mod-button3, Set the window to floating mode and resize by dragging

            ( (modm, button3)
            , \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster
            )
            -- you may also bind events to the mouse scroll wheel (button4 and button5)
        ]

------------------------------------------------------------------------
--
myLayoutHook =
    spacingWithEdge 4 $
        avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook =
    composeAll
        [ className =? "MPlayer" --> doFloat
        , className =? "Gimp" --> doFloat
        , className =? "Chromium" --> doShift (myWorkspaces !! 1)
        , className =? "Slack" --> doShift (myWorkspaces !! 2)
        , className =? "Emacs" --> doShift (myWorkspaces !! 3)
        , className =? "qbittorrent" --> (doFloat <+> doShift "4")
        , className =? "vlc" --> doShift "4"
        , resource =? "desktop_window" --> doIgnore
        , resource =? "kdesktop" --> doIgnore
        ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook

--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- myEventHook = mempty
-- myEventHook = docksEventHook <+> handleEventHook def <+> fullscreenEventHook
myEventHook = handleEventHook def

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = dynamicLog

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "feh --bg-fill ~/Pictures/mountain.jpg &"
    spawnOnce "picom --backend glx &"
    spawnOnce "xmodmap -e 'keycode 66 = KP_Home'"
    spawnOnce "xmodmap -e 'keycode 110 = Caps_Lock'"
    spawnOnce "xmodmap -e 'keycode 94 = Shift_L'"
    spawnOnce "xmodmap -e 'keycode 107 = Super_R'"
    spawnOnce "xmodmap -e 'keycode 135 = Super_R'"

----------------------------------------------------------------------

-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
-- xmonad defaults
main :: IO ()
main =
    xmonad
        . ewmhFullscreen
        . ewmh
        . withEasySB (statusBarProp "xmobar" (pure def)) toggleStrutsKey
        $ defaults
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{XMonad.modMask = modMask} = (modMask, xK_6)

defaults =
    def -- simple stuff
        { terminal = myTerminal
        , focusFollowsMouse = myFocusFollowsMouse
        , clickJustFocuses = myClickJustFocuses
        , borderWidth = myBorderWidth
        , modMask = myModMask
        , workspaces = myWorkspaces
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , keys = myKeys
        , mouseBindings = myMouseBindings
        , layoutHook = myLayoutHook
        , manageHook = myManageHook
        , handleEventHook = myEventHook
        , logHook = myLogHook
        , startupHook = myStartupHook
        }
