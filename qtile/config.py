import os
import subprocess

from libqtile.config import Key, Screen, Group, Drag, Click, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

from typing import List  # noqa: F401

mod = "mod1"
term = "alacritty"

soft_sep = {'linewidth': 2, 'size_percent': 70,
            'foreground': '393939', 'padding': 7}

keys = [
    Key([mod], "t", lazy.spawn(term)),
    Key([mod], "f", lazy.spawn("firefox")),
    Key([mod], "c", lazy.spawn("google-chrome-stable")),
    Key([mod], "d", lazy.spawn("dmenu_run -p 'Run: '")),
    Key([mod], "e", lazy.spawn("thunar")),

    Key([mod], "q", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),
    Key([mod], "w", lazy.window.toggle_fullscreen()),

    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 3- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 3+ unmute")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("light -A 2")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("light -U 2")),

    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),  # Toggle window between min ans max size
    ]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(toggle=True)),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        Key([mod], "s", lazy.group["scratchpad"].dropdown_toggle("term")),
    ])

# Append ScratchPad to group list
groups.append(
    ScratchPad("scratchpad",[
        DropDown("term", term, x=0.25, y=0.25, height=0.5, width=0.5),
    ]),
)



layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
}

layouts = [
    layout.MonadTall(**layout_theme)
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.Sep(**soft_sep),
                widget.WindowName(),
                widget.Sep(**soft_sep),
                # widget.Battery(),
                # widget.Sep(**soft_sep),
                widget.Clock(format='%d | %I:%M'),
                widget.Sep(**soft_sep),
                widget.Systray(),
            ],
            24,
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('/home/gogo/.config/qtile/autostart.sh')
    subprocess.run([home])
