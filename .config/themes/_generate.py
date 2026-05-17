#!/usr/bin/env python3
"""Generate theme palette files for all themes."""

import json
import os

THEMES_DIR = os.path.dirname(os.path.abspath(__file__))


def rgba(hex6):
    """Convert #rrggbb or rrggbb to rgba(rrggbbff)"""
    h = hex6.lstrip("#")
    return f"rgba({h}ff)"


def hex_(h):
    return "#" + h.lstrip("#")


# Palette slots:
#   bg bg1 bg2 bg3 bg4   — backgrounds darkest→lightest
#   fg fg2 fg3            — foregrounds bright→dim
#   red orange yellow green cyan blue purple  — named hues
#   accent accent2 accent3  — primary/secondary/tertiary accents
#   error source            — semantic (kept for ghostty/tmux/starship internals)
THEMES = {
    "gruvbox-dark": {
        "bg": "1d2021", "bg1": "282828", "bg2": "3c3836", "bg3": "504945", "bg4": "665c54",
        "fg": "ebdbb2", "fg2": "a89984", "fg3": "928374",
        "red": "cc241d", "orange": "d65d0e", "yellow": "d79921", "green": "689d6a",
        "cyan": "8ec07c", "blue": "458588", "purple": "b16286",
        "accent": "d79921", "accent2": "98971a", "accent3": "689d6a",
        "error": "cc241d", "source": "d65d0e",
    },
    "rose-pine": {
        "bg": "191724", "bg1": "1f1d2e", "bg2": "26233a", "bg3": "6e6a86", "bg4": "9893a5",
        "fg": "e0def4", "fg2": "908caa", "fg3": "6e6a86",
        "red": "eb6f92", "orange": "f6c177", "yellow": "ebbcba", "green": "31748f",
        "cyan": "9ccfd8", "blue": "31748f", "purple": "c4a7e7",
        "accent": "f6c177", "accent2": "9ccfd8", "accent3": "c4a7e7",
        "error": "eb6f92", "source": "f6c177",
    },
    "catppuccin-mocha": {
        "bg": "1e1e2e", "bg1": "181825", "bg2": "313244", "bg3": "45475a", "bg4": "585b70",
        "fg": "cdd6f4", "fg2": "bac2de", "fg3": "a6adc8",
        "red": "f38ba8", "orange": "fab387", "yellow": "f9e2af", "green": "a6e3a1",
        "cyan": "94e2d5", "blue": "89b4fa", "purple": "cba6f7",
        "accent": "b4befe", "accent2": "89b4fa", "accent3": "cba6f7",
        "error": "f38ba8", "source": "cba6f7",
    },
    "tokyo-night": {
        "bg": "1a1b26", "bg1": "16161e", "bg2": "292e42", "bg3": "3b4261", "bg4": "545c7e",
        "fg": "c0caf5", "fg2": "a9b1d6", "fg3": "9aa5ce",
        "red": "f7768e", "orange": "ff9e64", "yellow": "e0af68", "green": "9ece6a",
        "cyan": "73daca", "blue": "7aa2f7", "purple": "bb9af7",
        "accent": "7aa2f7", "accent2": "7dcfff", "accent3": "bb9af7",
        "error": "f7768e", "source": "7aa2f7",
    },
    "nord": {
        "bg": "2e3440", "bg1": "242933", "bg2": "3b4252", "bg3": "434c5e", "bg4": "4c566a",
        "fg": "eceff4", "fg2": "d8dee9", "fg3": "e5e9f0",
        "red": "bf616a", "orange": "d08770", "yellow": "ebcb8b", "green": "a3be8c",
        "cyan": "8fbcbb", "blue": "81a1c1", "purple": "b48ead",
        "accent": "81a1c1", "accent2": "88c0d0", "accent3": "b48ead",
        "error": "bf616a", "source": "5e81ac",
    },
    "dracula": {
        "bg": "282a36", "bg1": "21222c", "bg2": "343746", "bg3": "44475a", "bg4": "6272a4",
        "fg": "f8f8f2", "fg2": "bfbfbf", "fg3": "6272a4",
        "red": "ff5555", "orange": "ffb86c", "yellow": "f1fa8c", "green": "50fa7b",
        "cyan": "8be9fd", "blue": "6272a4", "purple": "bd93f9",
        "accent": "bd93f9", "accent2": "ff79c6", "accent3": "8be9fd",
        "error": "ff5555", "source": "bd93f9",
    },
    "kanagawa": {
        "bg": "1f1f28", "bg1": "16161d", "bg2": "2a2a37", "bg3": "363646", "bg4": "54546d",
        "fg": "dcd7ba", "fg2": "c8c093", "fg3": "727169",
        "red": "c34043", "orange": "ffa066", "yellow": "c0a36e", "green": "76946a",
        "cyan": "7aa89f", "blue": "7e9cd8", "purple": "938aa9",
        "accent": "7e9cd8", "accent2": "76946a", "accent3": "d27e99",
        "error": "c34043", "source": "7e9cd8",
    },
    "everforest": {
        "bg": "2d353b", "bg1": "272e33", "bg2": "3d484d", "bg3": "475258", "bg4": "56635f",
        "fg": "d3c6aa", "fg2": "9da9a0", "fg3": "7a8478",
        "red": "e67e80", "orange": "e69875", "yellow": "dbbc7f", "green": "a7c080",
        "cyan": "7fbbb3", "blue": "7fbbb3", "purple": "d699b6",
        "accent": "a7c080", "accent2": "7fbbb3", "accent3": "d699b6",
        "error": "e67e80", "source": "a7c080",
    },
    "one-dark": {
        "bg": "1a212e", "bg1": "141922", "bg2": "2c313c", "bg3": "3b4048", "bg4": "4b5263",
        "fg": "abb2bf", "fg2": "7f848e", "fg3": "5c6370",
        "red": "e06c75", "orange": "d19a66", "yellow": "e5c07b", "green": "98c379",
        "cyan": "56b6c2", "blue": "61afef", "purple": "c678dd",
        "accent": "61afef", "accent2": "56b6c2", "accent3": "c678dd",
        "error": "e06c75", "source": "61afef",
    },
    "nightfox": {
        "bg": "192330", "bg1": "131a24", "bg2": "212e3f", "bg3": "29394f", "bg4": "39506d",
        "fg": "cdcecf", "fg2": "738091", "fg3": "526175",
        "red": "c94f6d", "orange": "f4a261", "yellow": "d9bc8c", "green": "81b29a",
        "cyan": "86e1fc", "blue": "82aaff", "purple": "c099ff",
        "accent": "82aaff", "accent2": "86e1fc", "accent3": "c099ff",
        "error": "c94f6d", "source": "82aaff",
    },
    "tomorrow-night": {
        "bg": "1d1f21", "bg1": "161719", "bg2": "282a2e", "bg3": "373b41", "bg4": "4b5056",
        "fg": "c5c8c6", "fg2": "b4b7b4", "fg3": "969896",
        "red": "cc6666", "orange": "de935f", "yellow": "f0c674", "green": "b5bd68",
        "cyan": "8abeb7", "blue": "81a2be", "purple": "b294bb",
        "accent": "81a2be", "accent2": "8abeb7", "accent3": "b294bb",
        "error": "cc6666", "source": "81a2be",
    },
    "rose-pine-moon": {
        "bg": "232136", "bg1": "1f1d2e", "bg2": "2a273f", "bg3": "393552", "bg4": "6e6a86",
        "fg": "e0def4", "fg2": "908caa", "fg3": "6e6a86",
        "red": "eb6f92", "orange": "f6c177", "yellow": "f6c177", "green": "3e8fb0",
        "cyan": "9ccfd8", "blue": "3e8fb0", "purple": "c4a7e7",
        "accent": "c4a7e7", "accent2": "9ccfd8", "accent3": "ea9a97",
        "error": "eb6f92", "source": "c4a7e7",
    },
    "catppuccin-frappe": {
        "bg": "303446", "bg1": "292c3c", "bg2": "414559", "bg3": "51576d", "bg4": "626880",
        "fg": "c6d0f5", "fg2": "b5bfe2", "fg3": "a5adce",
        "red": "e78284", "orange": "ef9f76", "yellow": "e5c890", "green": "a6d189",
        "cyan": "99d1db", "blue": "8caaee", "purple": "ca9ee6",
        "accent": "8caaee", "accent2": "99d1db", "accent3": "ca9ee6",
        "error": "e78284", "source": "8caaee",
    },
    "material-ocean": {
        "bg": "0f111a", "bg1": "090b10", "bg2": "1f2233", "bg3": "2a2e42", "bg4": "3b4261",
        "fg": "a6accd", "fg2": "828bb8", "fg3": "5c6783",
        "red": "f07178", "orange": "f78c6c", "yellow": "ffcb6b", "green": "c3e88d",
        "cyan": "89ddff", "blue": "82aaff", "purple": "c792ea",
        "accent": "82aaff", "accent2": "89ddff", "accent3": "c792ea",
        "error": "f07178", "source": "82aaff",
    },
    "github-dark": {
        "bg": "0d1117", "bg1": "010409", "bg2": "161b22", "bg3": "21262d", "bg4": "30363d",
        "fg": "c9d1d9", "fg2": "8b949e", "fg3": "6e7681",
        "red": "f85149", "orange": "db6d28", "yellow": "e3b341", "green": "3fb950",
        "cyan": "39c5cf", "blue": "58a6ff", "purple": "bc8cff",
        "accent": "58a6ff", "accent2": "79c0ff", "accent3": "d2a8ff",
        "error": "f85149", "source": "58a6ff",
    },
    "ayu-dark": {
        "bg": "0f1419", "bg1": "0b0e14", "bg2": "1b2733", "bg3": "253340", "bg4": "364a5e",
        "fg": "bfbdb6", "fg2": "98958e", "fg3": "6c7380",
        "red": "f07178", "orange": "ffb454", "yellow": "e6b450", "green": "7fd962",
        "cyan": "39bae6", "blue": "59c2ff", "purple": "d2a6ff",
        "accent": "39bae6", "accent2": "95e6cb", "accent3": "d2a6ff",
        "error": "f07178", "source": "39bae6",
    },
    "oxocarbon": {
        "bg": "161616", "bg1": "0f0f0f", "bg2": "262626", "bg3": "393939", "bg4": "525252",
        "fg": "dde1e6", "fg2": "a2a9b0", "fg3": "697077",
        "red": "ff7eb6", "orange": "ffb784", "yellow": "ffe97b", "green": "42be65",
        "cyan": "08bdba", "blue": "78a9ff", "purple": "be95ff",
        "accent": "78a9ff", "accent2": "08bdba", "accent3": "be95ff",
        "error": "ff7eb6", "source": "78a9ff",
    },
    "poimandres": {
        "bg": "1b1e28", "bg1": "171922", "bg2": "303340", "bg3": "4b5263", "bg4": "767c9d",
        "fg": "e4f0fb", "fg2": "a6accd", "fg3": "767c9d",
        "red": "d0679d", "orange": "fffac2", "yellow": "fffac2", "green": "5de4c7",
        "cyan": "89ddff", "blue": "89ddff", "purple": "fcc5e9",
        "accent": "89ddff", "accent2": "5de4c7", "accent3": "fcc5e9",
        "error": "d0679d", "source": "89ddff",
    },
    "melange": {
        "bg": "292522", "bg1": "1f1b18", "bg2": "34302c", "bg3": "4a443e", "bg4": "5a524c",
        "fg": "ece1d7", "fg2": "c1a78e", "fg3": "867462",
        "red": "d47766", "orange": "e49b5d", "yellow": "ebb74a", "green": "78997a",
        "cyan": "7b91b2", "blue": "7b91b2", "purple": "b5a0d2",
        "accent": "a98a78", "accent2": "78997a", "accent3": "7b91b2",
        "error": "d47766", "source": "7b91b2",
    },
    "gruvbox-dark-hard": {
        "bg": "1d2021", "bg1": "1b1b1b", "bg2": "282828", "bg3": "3c3836", "bg4": "504945",
        "fg": "ebdbb2", "fg2": "d5c4a1", "fg3": "a89984",
        "red": "fb4934", "orange": "fe8019", "yellow": "fabd2f", "green": "b8bb26",
        "cyan": "8ec07c", "blue": "83a598", "purple": "d3869b",
        "accent": "fabd2f", "accent2": "b8bb26", "accent3": "83a598",
        "error": "fb4934", "source": "fe8019",
    },
    "gruvbox-dark-soft": {
        "bg": "32302f", "bg1": "282828", "bg2": "3c3836", "bg3": "504945", "bg4": "665c54",
        "fg": "ebdbb2", "fg2": "d5c4a1", "fg3": "bdae93",
        "red": "cc241d", "orange": "d65d0e", "yellow": "d79921", "green": "98971a",
        "cyan": "689d6a", "blue": "458588", "purple": "b16286",
        "accent": "d79921", "accent2": "98971a", "accent3": "458588",
        "error": "cc241d", "source": "d65d0e",
    },
    "noir": {
        "bg": "101010", "bg1": "151515", "bg2": "202020", "bg3": "2a2a2a", "bg4": "3a3a3a",
        "fg": "e6e6e6", "fg2": "b5b5b5", "fg3": "7a7a7a",
        "red": "f38ba8", "orange": "fab387", "yellow": "f9e2af", "green": "a6e3a1",
        "cyan": "94e2d5", "blue": "89b4fa", "purple": "cba6f7",
        "accent": "8ab4f8", "accent2": "89dceb", "accent3": "cba6f7",
        "error": "f38ba8", "source": "8ab4f8",
    },
}


def make_hyprland(t):
    c = THEMES[t]
    lines = [
        "$font       = SF Pro Display",
        "$font_bold  = SF Pro Display Bold",
        "$clock_font = PP Neue Machina Plain Ultrabold",
        "",
        "# Backgrounds",
        f"$bg         = {rgba(c['bg'])}",
        f"$bg1        = {rgba(c['bg1'])}",
        f"$bg2        = {rgba(c['bg2'])}",
        f"$bg3        = {rgba(c['bg3'])}",
        f"$bg4        = {rgba(c['bg4'])}",
        "",
        "# Foregrounds",
        f"$fg         = {rgba(c['fg'])}",
        f"$fg2        = {rgba(c['fg2'])}",
        f"$fg3        = {rgba(c['fg3'])}",
        "",
        "# Named colors",
        f"$red        = {rgba(c['red'])}",
        f"$orange     = {rgba(c['orange'])}",
        f"$yellow     = {rgba(c['yellow'])}",
        f"$green      = {rgba(c['green'])}",
        f"$cyan       = {rgba(c['cyan'])}",
        f"$blue       = {rgba(c['blue'])}",
        f"$purple     = {rgba(c['purple'])}",
        "",
        "# Accents",
        f"$accent     = {rgba(c['accent'])}",
        f"$accent2    = {rgba(c['accent2'])}",
        f"$accent3    = {rgba(c['accent3'])}",
        "",
        "# Misc",
        "$shadow     = rgba(000000ff)",
        "$scrim      = rgba(000000ff)",
    ]
    return "\n".join(lines)


def make_ghostty(t):
    c = THEMES[t]
    lines = [
        f"background = #{c['bg']}",
        f"foreground = #{c['fg']}",
        f"cursor-color = #{c['accent']}",
        f"cursor-text = #{c['bg']}",
        f"selection-background = #{c['bg2']}",
        f"selection-foreground = #{c['fg']}",
        "",
        "# Normal colors (0-7)",
        f"palette = 0=#{c['bg1']}",
        f"palette = 1=#{c['red']}",
        f"palette = 2=#{c['green']}",
        f"palette = 3=#{c['yellow']}",
        f"palette = 4=#{c['blue']}",
        f"palette = 5=#{c['purple']}",
        f"palette = 6=#{c['cyan']}",
        f"palette = 7=#{c['fg2']}",
        "",
        "# Bright colors (8-15)",
        f"palette = 8=#{c['fg3']}",
        f"palette = 9=#{c['red']}",
        f"palette = 10=#{c['green']}",
        f"palette = 11=#{c['yellow']}",
        f"palette = 12=#{c['blue']}",
        f"palette = 13=#{c['purple']}",
        f"palette = 14=#{c['cyan']}",
        f"palette = 15=#{c['fg']}",
    ]
    return "\n".join(lines)


def make_css(t):
    """CSS for waybar, swaync, wlogout."""
    c = THEMES[t]
    lines = [
        "/*",
        f" * CSS Colors — {t}",
        " */",
        "",
        "/* Backgrounds */",
        f"@define-color bg   {hex_(c['bg'])};",
        f"@define-color bg1  {hex_(c['bg1'])};",
        f"@define-color bg2  {hex_(c['bg2'])};",
        f"@define-color bg3  {hex_(c['bg3'])};",
        f"@define-color bg4  {hex_(c['bg4'])};",
        "",
        "/* Foregrounds */",
        f"@define-color fg   {hex_(c['fg'])};",
        f"@define-color fg2  {hex_(c['fg2'])};",
        f"@define-color fg3  {hex_(c['fg3'])};",
        "",
        "/* Named colors */",
        f"@define-color red    {hex_(c['red'])};",
        f"@define-color orange {hex_(c['orange'])};",
        f"@define-color yellow {hex_(c['yellow'])};",
        f"@define-color green  {hex_(c['green'])};",
        f"@define-color cyan   {hex_(c['cyan'])};",
        f"@define-color blue   {hex_(c['blue'])};",
        f"@define-color purple {hex_(c['purple'])};",
        "",
        "/* Accents */",
        f"@define-color accent  {hex_(c['accent'])};",
        f"@define-color accent2 {hex_(c['accent2'])};",
        f"@define-color accent3 {hex_(c['accent3'])};",
    ]
    return "\n".join(lines)


def make_gtk_css(t):
    c = THEMES[t]
    lines = [
        "/*",
        f" * GTK Colors — {t}",
        " */",
        "",
        f"@define-color accent_color {hex_(c['accent'])};",
        f"@define-color accent_fg_color {hex_(c['bg'])};",
        f"@define-color accent_bg_color {hex_(c['accent'])};",
        f"@define-color window_bg_color {hex_(c['bg'])};",
        f"@define-color window_fg_color {hex_(c['fg'])};",
        f"@define-color headerbar_bg_color {hex_(c['bg'])};",
        f"@define-color headerbar_fg_color {hex_(c['fg'])};",
        f"@define-color popover_bg_color {hex_(c['bg1'])};",
        f"@define-color popover_fg_color {hex_(c['fg'])};",
        f"@define-color view_bg_color {hex_(c['bg1'])};",
        f"@define-color view_fg_color {hex_(c['fg'])};",
        f"@define-color card_bg_color {hex_(c['bg1'])};",
        f"@define-color card_fg_color {hex_(c['fg'])};",
        "@define-color sidebar_bg_color @window_bg_color;",
        "@define-color sidebar_fg_color @window_fg_color;",
        "@define-color sidebar_border_color @window_bg_color;",
        "@define-color sidebar_backdrop_color @window_bg_color;",
        f"@define-color thumbnail_bg_color {hex_(c['bg2'])};",
        f"@define-color thumbnail_fg_color {hex_(c['fg'])};",
        f"@define-color dialog_bg_color {hex_(c['bg1'])};",
        f"@define-color dialog_fg_color {hex_(c['fg'])};",
        f"@define-color warning_bg_color {hex_(c['orange'])};",
        f"@define-color warning_fg_color {hex_(c['bg'])};",
        f"@define-color error_bg_color {hex_(c['red'])};",
        f"@define-color error_fg_color {hex_(c['bg'])};",
        f"@define-color success_bg_color {hex_(c['green'])};",
        f"@define-color success_fg_color {hex_(c['bg'])};",
        f"@define-color destructive_action_bg_color {hex_(c['red'])};",
        f"@define-color destructive_action_fg_color {hex_(c['bg'])};",
    ]
    return "\n".join(lines)


def make_rofi(t):
    c = THEMES[t]
    return f"""* {{
    background:      rgba({int(c["bg"][0:2], 16)}, {int(c["bg"][2:4], 16)}, {int(c["bg"][4:6], 16)}, 0.85);
    background-alt:  #{c["bg2"]};
    foreground:      #{c["fg"]};
    selected:        #{c["accent"]};
    active:          #{c["accent2"]};
    urgent:          #{c["red"]};
}}"""


def make_tmux(t):
    c = THEMES[t]
    lines = [
        f'set -gq @thm_bg                    "#{c["bg"]}"',
        f'set -gq @thm_status_bg             "#{c["bg1"]}"',
        f'set -gq @thm_active_bg             "#{c["bg2"]}"',
        f'set -gq @thm_fg                    "#{c["fg2"]}"',
        f'set -gq @thm_fg_bright             "#{c["fg"]}"',
        f'set -gq @thm_active_fg             "#{c["fg"]}"',
        f'set -gq @thm_accent                "#{c["accent"]}"',
        f'set -gq @thm_border                "#{c["bg3"]}"',
        f'set -gq @thm_prefix_bg             "#{c["orange"]}"',
        f'set -gq @thm_prefix_fg             "#{c["fg"]}"',
        f'set -gq @thm_copy_fg               "#{c["accent3"]}"',
        f'set -gq @thm_zoom_fg               "#{c["accent2"]}"',
    ]
    return "\n".join(lines)


def make_opencode(t):
    c = THEMES[t]
    data = {
        "$schema": "https://opencode.ai/theme.json",
        "defs": {
            "primary": hex_(c["accent"]),
            "on_primary": hex_(c["bg"]),
            "secondary": hex_(c["accent2"]),
            "on_secondary": hex_(c["bg"]),
            "surface": hex_(c["bg"]),
            "on_surface": hex_(c["fg"]),
            "surface_variant": hex_(c["bg3"]),
            "on_surface_variant": hex_(c["fg2"]),
            "background": hex_(c["bg"]),
            "on_background": hex_(c["fg"]),
            "error": hex_(c["red"]),
            "on_error": hex_(c["bg"]),
            "outline": hex_(c["fg3"]),
            "outline_variant": hex_(c["bg3"]),
        },
        "theme": {
            "primary": {"dark": "primary", "light": "primary"},
            "secondary": {"dark": "secondary", "light": "secondary"},
            "accent": {"dark": "primary", "light": "primary"},
            "error": {"dark": "error", "light": "error"},
            "warning": {"dark": "secondary", "light": "secondary"},
            "success": {"dark": "secondary", "light": "secondary"},
        },
    }
    return json.dumps(data, indent=2)


def make_starship(t):
    c = THEMES[t]
    lines = [
        "[palettes.colors]",
        f"color1 = '#{c['accent']}'",
        f"color2 = '#{c['bg']}'",
        f"color3 = '#{c['fg2']}'",
        f"color4 = '#{c['bg2']}'",
        f"color5 = '#{c['bg']}'",
        f"color6 = '#{c['bg1']}'",
        f"color7 = '#{c['bg1']}'",
        f"color8 = '#{c['accent']}'",
        f"color9 = '#{c['accent3']}'",
        f"color_error = '#{c['red']}'",
    ]
    return "\n".join(lines)


def make_yazi(t):
    c = THEMES[t]
    lines = [
        "[mgr]",
        f'cwd = {{ fg = "{hex_(c["fg"])}" }}',
        f'find_keyword = {{ fg = "{hex_(c["red"])}", bold = true, italic = true, underline = true }}',
        f'find_position = {{ fg = "{hex_(c["red"])}", bold = true, italic = true }}',
        f'marker_copied = {{ fg = "{hex_(c["accent3"])}", bg = "{hex_(c["accent3"])}" }}',
        f'marker_cut = {{ fg = "{hex_(c["accent2"])}", bg = "{hex_(c["accent2"])}" }}',
        f'marker_marked = {{ fg = "{hex_(c["red"])}", bg = "{hex_(c["red"])}" }}',
        f'marker_selected = {{ fg = "{hex_(c["accent"])}", bg = "{hex_(c["accent"])}" }}',
        f'count_copied = {{ fg = "{hex_(c["bg"])}", bg = "{hex_(c["accent3"])}" }}',
        f'count_cut = {{ fg = "{hex_(c["bg"])}", bg = "{hex_(c["accent2"])}" }}',
        f'count_selected = {{ fg = "{hex_(c["bg"])}", bg = "{hex_(c["accent"])}" }}',
        'border_symbol = "│"',
        f'border_style = {{ fg = "{hex_(c["accent"])}" }}',
        "",
        "[tabs]",
        f'active = {{ fg = "{hex_(c["accent"])}", bold = true, bg = "{hex_(c["bg1"])}" }}',
        f'inactive = {{ fg = "{hex_(c["fg2"])}", bg = "{hex_(c["bg1"])}" }}',
        'sep_inner = { open = "[", close = "]" }',
        "",
        "[mode]",
        f'normal_main = {{ bg = "{hex_(c["accent"])}", fg = "{hex_(c["bg"])}", bold = true }}',
        f'normal_alt = {{ bg = "{hex_(c["bg3"])}", fg = "{hex_(c["fg2"])}" }}',
        f'select_main = {{ bg = "{hex_(c["accent2"])}", fg = "{hex_(c["bg"])}", bold = true }}',
        f'select_alt = {{ bg = "{hex_(c["bg3"])}", fg = "{hex_(c["fg2"])}" }}',
        f'unset_main = {{ bg = "{hex_(c["accent3"])}", fg = "{hex_(c["bg"])}", bold = true }}',
        f'unset_alt = {{ bg = "{hex_(c["bg3"])}", fg = "{hex_(c["fg2"])}" }}',
        "",
        "[status]",
        f'perm_type = {{ fg = "{hex_(c["fg3"])}" }}',
        f'perm_write = {{ fg = "{hex_(c["accent3"])}" }}',
        f'perm_read = {{ fg = "{hex_(c["red"])}" }}',
        f'perm_exec = {{ fg = "{hex_(c["accent2"])}" }}',
        f'perm_sep = {{ fg = "{hex_(c["bg4"])}" }}',
        "progress_label = { bold = true }",
        f'progress_normal = {{ fg = "{hex_(c["accent"])}", bg = "{hex_(c["bg2"])}" }}',
        f'progress_error = {{ fg = "{hex_(c["red"])}", bg = "{hex_(c["bg2"])}" }}',
        "",
        "[which]",
        "cols = 3",
        f'mask = {{ bg = "{hex_(c["bg2"])}" }}',
        f'cand = {{ fg = "{hex_(c["accent"])}" }}',
        f'rest = {{ fg = "{hex_(c["fg2"])}" }}',
        f'desc = {{ fg = "{hex_(c["fg"])}" }}',
        'separator = " ▶ "',
        f'separator_style = {{ fg = "{hex_(c["fg2"])}" }}',
        "",
        "[pick]",
        f'border = {{ fg = "{hex_(c["accent"])}" }}',
        f'active = {{ fg = "{hex_(c["accent3"])}", bold = true }}',
        "inactive = {}",
        "",
        "[input]",
        f'border = {{ fg = "{hex_(c["accent"])}" }}',
        f'value = {{ fg = "{hex_(c["fg"])}" }}',
        "",
        "[filetype]",
        "rules = [",
        f'  {{ url = "*", is = "orphan", bg = "{hex_(c["red"])}" }},',
        f'  {{ url = "*", is = "exec", fg = "{hex_(c["orange"])}" }},',
        f'  {{ url = "*", fg = "{hex_(c["fg"])}" }},',
        f'  {{ url = "*/", fg = "{hex_(c["accent"])}" }},',
        "]",
    ]
    return "\n".join(lines)


def make_lazygit(t):
    c = THEMES[t]
    lines = [
        "gui:",
        "  theme:",
        f'    activeBorderColor: ["#{c["accent"]}", "bold"]',
        f'    inactiveBorderColor: ["#{c["bg4"]}"]',
        f'    searchingActiveBorderColor: ["#{c["orange"]}", "bold"]',
        f'    optionsTextColor: ["#{c["accent2"]}"]',
        f'    selectedLineBgColor: ["#{c["bg2"]}"]',
        f'    cherryPickedCommitBgColor: ["#{c["bg3"]}"]',
        f'    cherryPickedCommitFgColor: ["#{c["accent3"]}"]',
        f'    unstagedChangesColor: ["#{c["red"]}"]',
        f'    defaultFgColor: ["#{c["fg"]}"]',
    ]
    return "\n".join(lines)


GENERATORS = {
    "hyprland.conf": make_hyprland,
    "ghostty": make_ghostty,
    "waybar.css": make_css,
    "swaync.css": make_css,
    "wlogout.css": make_css,
    "gtk.css": make_gtk_css,
    "rofi.rasi": make_rofi,
    "tmux.conf": make_tmux,
    "opencode.json": make_opencode,
    "starship.toml": make_starship,
    "yazi-theme.toml": make_yazi,
    "lazygit.yml": make_lazygit,
}

for theme_name in THEMES:
    theme_dir = os.path.join(THEMES_DIR, theme_name)
    os.makedirs(theme_dir, exist_ok=True)
    for filename, generator in GENERATORS.items():
        content = generator(theme_name)
        path = os.path.join(theme_dir, filename)
        with open(path, "w") as f:
            f.write(content + "\n")
    print(f"Generated: {theme_name}")

# Write current placeholder
current_file = os.path.join(THEMES_DIR, "current")
if not os.path.exists(current_file):
    with open(current_file, "w") as f:
        f.write("gruvbox-dark\n")

print("Done.")
