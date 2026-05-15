---@type Base46Table
local M = {}

-- Dusk — muted blue-grey twilight, low-contrast, easy on the eyes
local fn_blue = "#7aadda"
local type_sage = "#7ab8a0"

M.base_30 = {
  white        = "#c8cfe0",
  black        = "#1a1c26",
  darker_black = "#161820",
  black2       = "#1f2130",
  one_bg       = "#252738",
  one_bg2      = "#2d3044",
  one_bg3      = "#353852",
  grey         = "#525870",
  grey_fg      = "#64697f",
  grey_fg2     = "#757a90",
  light_grey   = "#8d92a8",
  red          = "#d47a7a",
  baby_pink    = "#d89898",
  pink         = "#c47aaa",
  line         = "#252738",
  green        = "#7aaa84",
  vibrant_green= "#8abf94",
  nord_blue    = fn_blue,
  blue         = fn_blue,
  yellow       = "#c8aa6a",
  sun          = "#d4b878",
  purple       = "#9a82d4",
  dark_purple  = "#7860b0",
  teal         = type_sage,
  orange       = "#c88a60",
  cyan         = "#6ab0c0",
  statusline_bg= "#1f2130",
  lightbg      = "#252738",
  pmenu_bg     = fn_blue,
  folder_bg    = fn_blue,
}

M.base_16 = {
  base00 = "#1a1c26", -- background
  base01 = "#1f2130", -- lighter bg (statusline, line numbers)
  base02 = "#252738", -- selection, highlights
  base03 = "#525870", -- comments, faded
  base04 = "#757a90", -- dark foreground
  base05 = "#c8cfe0", -- default foreground
  base06 = "#d8dff0", -- light foreground
  base07 = "#e8edf8", -- lightest (rare)
  base08 = "#d47a7a", -- red — errors, diff removed
  base09 = "#c88a60", -- orange — numbers, constants
  base0A = "#c8aa6a", -- yellow — classes, warnings
  base0B = "#7aaa84", -- green — strings
  base0C = "#6ab0c0", -- cyan — escape chars, regex
  base0D = fn_blue,   -- blue — functions, identifiers
  base0E = "#9a82d4", -- purple — keywords
  base0F = "#c47aaa", -- pink — special, deprecated
}

M.polish_hl = {
  defaults = {
    HTML_InjectedLanguageFragment = { bg = "NONE" },
  },

  treesitter = {
    ["@comment"]               = { fg = "#606478", italic = true },
    ["@comment.documentation"] = { fg = "#5a7a66", italic = true },
    ["@keyword"]               = { fg = "#9a82d4" },
    ["@keyword.import"]        = { fg = "#9a82d4" },
    ["@keyword.return"]        = { fg = "#d47a7a" },
    ["@keyword.exception"]     = { fg = "#d47a7a" },
    ["@keyword.operator"]      = { fg = "#c8cfe0" },
    ["@keyword.directive"]     = { fg = "#c88a60" },
    ["@string"]                = { fg = "#7aaa84" },
    ["@string.regexp"]         = { fg = "#c47aaa" },
    ["@string.escape"]         = { fg = "#c8aa6a" },
    ["@character"]             = { fg = "#7aaa84" },
    ["@character.special"]     = { fg = "#c88a60" },
    ["@number"]                = { fg = "#6ab0c0" },
    ["@boolean"]               = { fg = "#c88a60" },
    ["@float"]                 = { fg = "#6ab0c0" },
    ["@constant"]              = { fg = "#c8aa6a" },
    ["@constant.builtin"]      = { fg = "#c88a60" },
    ["@constant.macro"]        = { fg = "#a8a060" },
    ["@function"]              = { fg = fn_blue },
    ["@function.call"]         = { fg = fn_blue },
    ["@function.builtin"]      = { fg = fn_blue },
    ["@function.macro"]        = { fg = "#a8a060" },
    ["@function.method"]       = { fg = fn_blue },
    ["@function.method.call"]  = { fg = fn_blue },
    ["@method"]                = { fg = fn_blue },
    ["@method.call"]           = { fg = fn_blue },
    ["@constructor"]           = { fg = fn_blue },
    ["@type"]                  = { fg = type_sage },
    ["@type.builtin"]          = { fg = type_sage },
    ["@type.definition"]       = { fg = type_sage },
    ["@type.parameter"]        = { fg = "#5ab89a" },
    ["@namespace"]             = { fg = "#a8a060" },
    ["@module"]                = { fg = "#a8a060" },
    ["@variable"]              = { fg = "#c8cfe0" },
    ["@variable.builtin"]      = { fg = "#c47aaa" },
    ["@variable.parameter"]    = { fg = "#c8cfe0" },
    ["@variable.member"]       = { fg = "#c47aaa" },
    ["@property"]              = { fg = "#c47aaa" },
    ["@attribute"]             = { fg = "#a8a060" },
    ["@label"]                 = { fg = "#c8cfe0" },
    ["@operator"]              = { fg = "#9090a8" },
    ["@punctuation"]           = { fg = "#8090a0" },
    ["@punctuation.bracket"]   = { fg = "#8090a0" },
    ["@punctuation.delimiter"] = { fg = "#8090a0" },
    ["@punctuation.special"]   = { fg = "#c88a60" },
    ["@tag"]                   = { fg = "#c8cfe0" },
    ["@tag.attribute"]         = { fg = "#c47aaa" },
    ["@tag.delimiter"]         = { fg = "#757a90" },
    ["@markup.heading"]        = { fg = "#c88a60", bold = true },
    ["@markup.link"]           = { fg = fn_blue, underline = true },
    ["@markup.raw"]            = { fg = "#7aaa84" },
    ["@markup.list"]           = { fg = "#9a82d4" },
    ["@diff.plus"]             = { fg = "#5a9460" },
    ["@diff.minus"]            = { fg = "#8a6060" },
    ["@diff.delta"]            = { fg = "#4a6898" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "dusk")

return M
