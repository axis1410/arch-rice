---@type Base46Table
local M = {}

M.base_30 = {
  white = "#D8DEE9",
  black = "#1A1A1A",
  darker_black = "#171717",
  black2 = "#1E1E1E",
  one_bg = "#242424",
  one_bg2 = "#2A2A2A",
  one_bg3 = "#313131",
  grey = "#545454",
  grey_fg = "#5F5F5F",
  grey_fg2 = "#686868",
  light_grey = "#9AA0AB",
  red = "#BF616A",
  baby_pink = "#D08A91",
  pink = "#C582BF",
  line = "#262626",
  green = "#A3BE8C",
  vibrant_green = "#B2CC99",
  nord_blue = "#85C1FC",
  blue = "#85C1FC",
  seablue = "#88C0D0",
  yellow = "#EFB080",
  sun = "#F3C39A",
  purple = "#AA9BF5",
  dark_purple = "#8E7EE0",
  teal = "#83D6C5",
  orange = "#EFB080",
  cyan = "#88C0D0",
  statusline_bg = "#2A2A2A",
  lightbg = "#242424",
  pmenu_bg = "#85C1FC",
  folder_bg = "#85C1FC"
}

M.base_16 = {
  base00 = "#1A1A1A",
  base01 = "#1F1F1F",
  base02 = "#2A2A2A",
  base03 = "#505050",
  base04 = "#5F5F5F",
  base05 = "#D8DEE9",
  base06 = "#E3E8F2",
  base07 = "#FFFFFF",
  base08 = "#BF616A",
  base09 = "#EFB080",
  base0A = "#EBC88D",
  base0B = "#A3BE8C",
  base0C = "#88C0D0",
  base0D = "#85C1FC",
  base0E = "#AA9BF5",
  base0F = "#C582BF"
}

M.polish_hl = {}

M.type = "dark"

M = require("base46").override_theme(M, "Cursor Dark")

return M
