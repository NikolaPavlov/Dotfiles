  -- Base
import XMonad
import System.Directory
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.Navigation2D
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory

    -- Layouts
import XMonad.Layout.Accordion
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.WindowNavigation
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

   -- Utilities
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

myFont :: String
myFont = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod1Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "xfce4-terminal"    -- Sets default terminal

myBrowser :: String
myBrowser = "firefox"  -- Sets qutebrowser as browser

myEditor :: String
myEditor = "nvim"  -- Sets emacs as editor
-- myEditor = myTerminal ++ " -e vim "    -- Sets vim as editor

myBorderWidth :: Dimension
myBorderWidth = 3           -- Sets border width for windows

myNormColor :: String
myNormColor   = "#000000"   -- Border color of normal windows

myFocusColor :: String
myFocusColor  = "#46d9ff"   -- Border color of focused windows

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom &"
    -- spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 22 &"
    spawnOnce "feh --randomize --bg-fill /media/4Tb/Other/Pictures/Wallpapers/SolidColors/950x350-charleston-green-solid-color-background.jpg"  -- feh set random wallpaper
    -- TODO: add redshift
    setWMName "LG3D"

-- myColorizer :: Window -> Bool -> X (String, String)
-- myColorizer = colorRangeFromClassName
--                   (0x28,0x2c,0x34) -- lowest inactive bg
--                   (0x28,0x2c,0x34) -- highest inactive bg
--                   (0xc7,0x92,0xea) -- active bg
--                   (0xc0,0xa7,0x9a) -- inactive fg
--                   (0x28,0x2c,0x34) -- active fg

-- gridSelect menu layout
-- mygridConfig :: p -> GSConfig Window
-- mygridConfig colorizer = (buildDefaultGSConfig myColorizer)
--     { gs_cellheight   = 40
--     , gs_cellwidth    = 200
--     , gs_cellpadding  = 6
--     , gs_originFractX = 0.5
--     , gs_originFractY = 0.5
--     , gs_font         = myFont
--     }
--
-- spawnSelected' :: [(String, String)] -> X ()
-- spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
--     where conf = def
--                    { gs_cellheight   = 40
--                    , gs_cellwidth    = 200
--                    , gs_cellpadding  = 6
--                    , gs_originFractX = 0.5
--                    , gs_originFractY = 0.5
--                    , gs_font         = myFont
--                    }

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "cmus" spawnCmus findCmus manageCmus
                ]
  where
    spawnTerm  = myTerminal ++ " -T scratchpad "
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
    spawnCmus  = myTerminal ++ " -T cmus --execute 'cmus'"
    findCmus   = title =? "cmus"
    manageCmus = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w

--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Defining a bunch of layouts, many that I don't use.
-- limitWindows n sets maximum number of windows displayed for layout.
-- mySpacing n sets the gap size around the windows.
tall     = renamed [Replace "tall"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 12
           $ mySpacing 8
           $ ResizableTall 1 (3/100) (1/2) []
floats   = renamed [Replace "floats"]
           $ smartBorders
           $ limitWindows 20 simplestFloat
grid     = renamed [Replace "grid"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 12
           $ mySpacing 8
           $ mkToggle (single MIRROR)
           $ Grid (16/10)

-- setting colors for tabs layout and tabs sublayout.
myTabTheme = def { fontName            = myFont
                 , activeColor         = "#46d9ff"
                 , inactiveColor       = "#000000"
                 , activeBorderColor   = "#46d9ff"
                 , inactiveBorderColor = "#000000"
                 , activeTextColor     = "#282c34"
                 , inactiveTextColor   = "#d0d0d0"
                 }

-- Theme for showWName which prints current workspace when you change workspaces.
myShowWNameTheme :: SWNConfig
myShowWNameTheme = def
    { swn_font              = "xft:Ubuntu:bold:size=60"
    , swn_fade              = 1.0
    , swn_bgcolor           = "#1c1f24"
    , swn_color             = "#ffffff"
    }

-- The layout hook
myLayoutHook = avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats
               $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
             where
               myDefaultLayout =     withBorder myBorderWidth tall
                                 ||| withBorder myBorderWidth grid

-- myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
myWorkspaces = [" dev ", " web+core ", " temp ", " temp ", " vpn ", " temp ", " temp ", " music ", " chat "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     -- 'doFloat' forces a window to float.  Useful for dialog boxes and such.
     -- using 'doShift ( myWorkspaces !! 7)' sends program to workspace 8!
     -- I'm doing it this way because otherwise I would have to write out the full
     -- name of my workspaces and the names would be very long if using clickable workspaces.
     [ className =? "confirm"         --> doFloat
     , className =? "file_progress"   --> doFloat
     , className =? "dialog"          --> doFloat
     , className =? "download"        --> doFloat
     , className =? "error"           --> doFloat
     , className =? "Gimp"            --> doFloat
     , className =? "notification"    --> doFloat
     , className =? "pinentry-gtk-2"  --> doFloat
     -- , className =? "splash"          --> doFloat
     -- , className =? "toolbar"         --> doFloat
     , title =? "Oracle VM VirtualBox Manager"  --> doFloat
     -- , title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
     , className =? "Gimp"            --> doShift ( myWorkspaces !! 8 )
     , className =? "VirtualBox Manager" --> doShift  ( myWorkspaces !! 4 )
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
     , isFullscreen -->  doFullFloat
     ] <+> namedScratchpadManageHook myScratchPads

myKeys :: [(String, X ())]
myKeys =

    [ ("M-t",     spawn (myTerminal))
    , ("M-d",     spawn "dmenu_run")
    , ("M-f",     spawn "firefox")
    , ("M-e",     spawn "thunar")
    , ("M-q",     kill)
    , ("M-w",     sendMessage NextLayout)
    -- , ("M-<Tab>", windows W.focusDown)
    -- , ("M-j",     windows W.focusDown)
    -- , ("M-k",     windows W.focusUp  )
    -- , ("M-m",     windows W.focusMaster  )
    -- , ("M-S-j",   windows W.swapDown  )
    -- , ("M-S-k",   windows W.swapUp    )
    -- , ("M-h",     sendMessage Shrink)
    -- , ("M-l",     sendMessage Expand)
    , ("M-S-q", io exitSuccess)
    , ("M-S-r",   spawn "xmonad --recompile; xmonad --restart")
    , ("M-s", namedScratchpadAction myScratchPads "terminal")
    , ("M-c", namedScratchpadAction myScratchPads "cmus")


    -- window navigation keybindings.
    -- , ("C-l", sendMessage $ Go R)                             -- (8)
    -- , ("C-h", sendMessage $ Go L)                             --  "
    -- , ("C-k", sendMessage $ Go U)                             --  "
    -- , ("C-j", sendMessage $ Go D)                             --  "
    -- , ("S-C-l", sendMessage $ Swap R)                         --  "
    -- , ("S-C-h", sendMessage $ Swap L)                         --  "
    -- , ("S-C-k", sendMessage $ Swap U)                         --  "
    -- , ("S-C-j", sendMessage $ Swap D)                         --  "
    -- , ("S-M-C-l", sendMessage $ Move R)
    -- , ("S-M-C-h", sendMessage $ Move L)
    -- , ("S-M-C-k", sendMessage $ Move U)
    -- , ("S-M-C-j", sendMessage $ Move D)
    --
    -- , ("M-C-<Left>"     , sendMessage Shrink                    ) --Shrink horiz window width
    -- , ("M-C-<Right>"    , sendMessage Expand                    ) --Expand horiz window width
    -- , ("M-C-<Down>"     , sendMessage MirrorShrink              ) --Shrink vert window width
    -- , ("M-C-<Up>"       , sendMessage MirrorExpand              ) --Exoand vert window width

    -- my window navigation
    , ("M-l", sendMessage $ Go R)                             -- (8)
    , ("M-h", sendMessage $ Go L)                             --  "
    , ("M-k", sendMessage $ Go U)                             --  "
    , ("M-j", sendMessage $ Go D)                             --  "
    , ("M-S-l", sendMessage $ Swap R)                         --  "
    , ("M-S-h", sendMessage $ Swap L)                         --  "
    , ("M-S-k", sendMessage $ Swap U)                         --  "
    , ("M-S-j", sendMessage $ Swap D)                         --  "

    , ("M-i"     , sendMessage Shrink                    ) --Shrink horiz window width
    , ("M-m"    , sendMessage Expand                    ) --Expand horiz window width
    -- , ("M-C-<Down>"     , sendMessage MirrorShrink              ) --Shrink vert window width
    -- , ("M-C-<Up>"       , sendMessage MirrorExpand              ) --Exoand vert window width

    ----------------------------------
    -- qtile navigation
    ----------------------------------
        -- Key([mod], "h", lazy.layout.left()),
        -- Key([mod], "l", lazy.layout.right()),
        -- Key([mod], "j", lazy.layout.down()),
        -- Key([mod], "k", lazy.layout.up()),
        -- Key([mod, "shift"], "h", lazy.layout.swap_left()),
        -- Key([mod, "shift"], "l", lazy.layout.swap_right()),
        -- Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        -- Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        -- Key([mod], "i", lazy.layout.grow()),
        -- Key([mod], "m", lazy.layout.shrink()),
        -- Key([mod], "n", lazy.layout.normalize()),
        -- Key([mod], "o", lazy.layout.maximize()),  # Toggle window between min ans max size
        -- Key([modkey, "shift"], "space", lazy.layout.flip()), ]
    ----------------------------------


    -- -- Layouts
    -- , ("M-<Tab>", sendMessage NextLayout)           -- Switch to next layout
    -- , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full
    -- Scratchpads
    -- Toggle show/hide these programs.  They run on a hidden workspace.
    -- When you toggle them to show, it brings them to your current workspace.
    -- Toggle them to hide and it sends them back to hidden workspace (NSP).
    ]
      where nonNSP          = WSIs (return (\ws -> W.tag ws /= "NSP"))
            nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "NSP"))
    -- -- Windows navigation
    --     , ("M-m", windows W.focusMaster)  -- Move focus to the master window
    --     , ("M-j", windows W.focusDown)    -- Move focus to the next window
    --     , ("M-k", windows W.focusUp)      -- Move focus to the prev window
    --     , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
    --     , ("M-S-j", windows W.swapDown)   -- Swap focused window with next window
    --     , ("M-S-k", windows W.swapUp)     -- Swap focused window with prev window
    --     , ("M-<Backspace>", promote)      -- Moves focused window to master, others maintain order
    --     , ("M-S-<Tab>", rotSlavesDown)    -- Rotate all windows except master and keep focus in place
    --     , ("M-C-<Tab>", rotAllDown)       -- Rotate all the windows in the current stack
    --
    -- -- Increase/decrease windows in the master pane or the stack
    --     , ("M-S-<Up>", sendMessage (IncMasterN 1))      -- Increase # of clients master pane
    --     , ("M-S-<Down>", sendMessage (IncMasterN (-1))) -- Decrease # of clients master pane
    --     , ("M-C-<Up>", increaseLimit)                   -- Increase # of windows
    --     , ("M-C-<Down>", decreaseLimit)                 -- Decrease # of windows
    --
    -- -- Window resizing
    --     , ("M-h", sendMessage Shrink)                   -- Shrink horiz window width
    --     , ("M-l", sendMessage Expand)                   -- Expand horiz window width
    --     , ("M-M1-j", sendMessage MirrorShrink)          -- Shrink vert window width
    --     , ("M-M1-k", sendMessage MirrorExpand)          -- Expand vert window width
-------------------------------------------------------------------------------

main :: IO ()
main = do
    -- Launching three instances of xmobar on their monitors.
    xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobarrc0"
    xmproc1 <- spawnPipe "xmobar -x 1 $HOME/.config/xmobar/xmobarrc1"
    xmproc2 <- spawnPipe "xmobar -x 2 $HOME/.config/xmobar/xmobarrc2"
    -- the xmonad, ya know...what the WM is named after!
    xmonad $ ewmh def
        { manageHook         = myManageHook <+> manageDocks
        , handleEventHook    = docksEventHook
                               -- Uncomment this line to enable fullscreen support on things like YouTube/Netflix.
                               -- This works perfect on SINGLE monitor systems. On multi-monitor systems,
                               -- it adds a border around the window if screen does not have focus. So, my solution
                               -- is to use a keybinding to toggle fullscreen noborders instead.  (M-<Space>)
                               -- <+> fullscreenEventHook
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , layoutHook         = showWName' myShowWNameTheme $ myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormColor
        , focusedBorderColor = myFocusColor
        , logHook = dynamicLogWithPP $ namedScratchpadFilterOutWorkspacePP $ xmobarPP
              -- the following variables beginning with 'pp' are settings for xmobar.
              { ppOutput = \x -> hPutStrLn xmproc0 x                          -- xmobar on monitor 1
                              >> hPutStrLn xmproc1 x                          -- xmobar on monitor 2
                              >> hPutStrLn xmproc2 x                          -- xmobar on monitor 3
              , ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]"           -- Current workspace
              , ppVisible = xmobarColor "#98be65" "" . clickable              -- Visible but not current workspace
              , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" "" . clickable -- Hidden workspaces
              , ppHiddenNoWindows = xmobarColor "#c792ea" ""  . clickable     -- Hidden workspaces (no windows)
              , ppTitle = xmobarColor "#b3afc2" "" . shorten 60               -- Title of active window
              , ppSep =  "<fc=#666666> <fn=1>|</fn> </fc>"                    -- Separator character
              , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"            -- Urgent workspace
              , ppExtras  = [windowCount]                                     -- # of windows current workspace
              , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]                    -- order of things in xmobar
              }
        } `additionalKeysP` myKeys
