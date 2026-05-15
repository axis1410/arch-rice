---@type Base46Table
local M = {}

-- Vesper Grey — warm grey background, amber accents, muted and easy on the eyes
local fn_amber  = "#c8956a"
local type_sage = "#7aaa94"

M.base_30 = {
  white        = "#c8c8be",
  black        = "#202020",
  darker_black = "#1a1a1a",
  black2       = "#262626",
  one_bg       = "#2c2c2c",
  one_bg2      = "#333333",
  one_bg3      = "#3c3c3c",
  grey         = "#585858",
  grey_fg      = "#6a6a6a",
  grey_fg2     = "#7c7c7a",
  light_grey   = "#909090",
  red          = "#c87070",
  baby_pink    = "#d49090",
  pink         = "#b87090",
  line         = "#2c2c2c",
  green        = "#7aaa84",
  vibrant_green= "#8abf94",
  nord_blue    = "#7a9aba",
  blue         = "#7a9aba",
  yellow       = "#c8aa6a",
  sun          = "#d4b878",
  purple       = "#9a82c4",
  dark_purple  = "#7860a0",
  teal         = type_sage,
  orange       = fn_amber,
  cyan         = "#6aaab0",
  statusline_bg= "#262626",
  lightbg      = "#2c2c2c",
  pmenu_bg     = fn_amber,
  folder_bg    = "#7a9aba",
}

M.base_16 = {
  base00 = "#202020", -- background — warm grey, not blue-tinted
  base01 = "#262626", -- lighter bg (statusline, line numbers)
  base02 = "#2c2c2c", -- selection, highlights
  base03 = "#585858", -- comments
  base04 = "#7c7c7a", -- dark foreground
  base05 = "#c8c8be", -- default foreground — warm off-white
  base06 = "#d8d8ce",
  base07 = "#e8e8de",
  base08 = "#c87070", -- red — errors
  base09 = fn_amber,  -- orange/amber — numbers, constants
  base0A = "#c8aa6a", -- yellow — classes, warnings
  base0B = "#7aaa84", -- green — strings
  base0C = "#6aaab0", -- cyan — escape chars
  base0D = "#7a9aba", -- blue — functions
  base0E = "#9a82c4", -- purple — keywords
  base0F = "#b87090", -- pink — special
}

M.polish_hl = {
  defaults = {
    HTML_InjectedLanguageFragment = { bg = "NONE" },
  },

  treesitter = {
    ["@comment"]               = { fg = "#606060", italic = true },
    ["@comment.documentation"] = { fg = "#5a7a60", italic = true },
    ["@keyword"]               = { fg = "#9a82c4" },
    ["@keyword.import"]        = { fg = "#9a82c4" },
    ["@keyword.return"]        = { fg = "#c87070" },
    ["@keyword.exception"]     = { fg = "#c87070" },
    ["@keyword.operator"]      = { fg = "#c8c8be" },
    ["@keyword.directive"]     = { fg = fn_amber },
    ["@string"]                = { fg = "#7aaa84" },
    ["@string.regexp"]         = { fg = "#b87090" },
    ["@string.escape"]         = { fg = "#c8aa6a" },
    ["@character"]             = { fg = "#7aaa84" },
    ["@character.special"]     = { fg = fn_amber },
    ["@number"]                = { fg = "#6aaab0" },
    ["@boolean"]               = { fg = fn_amber },
    ["@float"]                 = { fg = "#6aaab0" },
    ["@constant"]              = { fg = "#c8aa6a" },
    ["@constant.builtin"]      = { fg = fn_amber },
    ["@constant.macro"]        = { fg = "#a8a060" },
    ["@function"]              = { fg = fn_amber },
    ["@function.call"]         = { fg = fn_amber },
    ["@function.builtin"]      = { fg = fn_amber },
    ["@function.macro"]        = { fg = "#a8a060" },
    ["@function.method"]       = { fg = fn_amber },
    ["@function.method.call"]  = { fg = fn_amber },
    ["@method"]                = { fg = fn_amber },
    ["@method.call"]           = { fg = fn_amber },
    ["@constructor"]           = { fg = fn_amber },
    ["@type"]                  = { fg = type_sage },
    ["@type.builtin"]          = { fg = type_sage },
    ["@type.definition"]       = { fg = type_sage },
    ["@type.parameter"]        = { fg = "#5ab89a" },
    ["@namespace"]             = { fg = "#a8a060" },
    ["@module"]                = { fg = "#a8a060" },
    ["@variable"]              = { fg = "#c8c8be" },
    ["@variable.builtin"]      = { fg = "#b87090" },
    ["@variable.parameter"]    = { fg = "#c8c8be" },
    ["@variable.member"]       = { fg = "#b87090" },
    ["@property"]              = { fg = "#b87090" },
    ["@attribute"]             = { fg = "#a8a060" },
    ["@label"]                 = { fg = "#c8c8be" },
    ["@operator"]              = { fg = "#909090" },
    ["@punctuation"]           = { fg = "#808080" },
    ["@punctuation.bracket"]   = { fg = "#808080" },
    ["@punctuation.delimiter"] = { fg = "#808080" },
    ["@punctuation.special"]   = { fg = fn_amber },
    ["@tag"]                   = { fg = "#c8c8be" },
    ["@tag.attribute"]         = { fg = "#b87090" },
    ["@tag.delimiter"]         = { fg = "#7c7c7a" },
    ["@markup.heading"]        = { fg = fn_amber, bold = true },
    ["@markup.link"]           = { fg = "#7a9aba", underline = true },
    ["@markup.raw"]            = { fg = "#7aaa84" },
    ["@markup.list"]           = { fg = "#9a82c4" },
    ["@diff.plus"]             = { fg = "#5a9460" },
    ["@diff.minus"]            = { fg = "#8a6060" },
    ["@diff.delta"]            = { fg = "#4a6898" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "vesper_grey")

return M
