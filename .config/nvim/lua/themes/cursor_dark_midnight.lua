---@type Base46Table
local M = {}

M.base_30 = {
  white = "#E4E8F0",
  black = "#1E2127",
  darker_black = "#1B1D22",
  black2 = "#23262E",
  one_bg = "#2A2F38",
  one_bg2 = "#313742",
  one_bg3 = "#39404C",
  grey = "#5A606C",
  grey_fg = "#676D79",
  grey_fg2 = "#707784",
  light_grey = "#9AA3B2",
  red = "#C06771",
  baby_pink = "#D49AA0",
  pink = "#B692B0",
  line = "#2B303A",
  green = "#A6BF91",
  vibrant_green = "#B2D09C",
  nord_blue = "#85A4C3",
  blue = "#85A4C3",
  seablue = "#8CC1D1",
  yellow = "#EACC90",
  sun = "#F2D8A8",
  purple = "#82819F",
  dark_purple = "#6E6D88",
  teal = "#93BDBD",
  orange = "#EACC90",
  cyan = "#8CC1D1",
  statusline_bg = "#30353F",
  lightbg = "#2A2F38",
  pmenu_bg = "#85A4C3",
  folder_bg = "#85A4C3"
}

M.base_16 = {
  base00 = "#1E2127",
  base01 = "#21252B",
  base02 = "#30353F",
  base03 = "#535D71",
  base04 = "#676D79",
  base05 = "#EBEEF4",
  base06 = "#E4E8F0",
  base07 = "#FFFFFF",
  base08 = "#C06771",
  base09 = "#EACC90",
  base0A = "#EACC90",
  base0B = "#A6BF91",
  base0C = "#8CC1D1",
  base0D = "#85A4C3",
  base0E = "#82819F",
  base0F = "#B692B0"
}

M.polish_hl = {}

M.type = "dark"

M = require("base46").override_theme(M, "Cursor Dark Midnight")

return M
