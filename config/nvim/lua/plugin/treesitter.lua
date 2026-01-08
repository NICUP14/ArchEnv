-- lua/plugin/treesitter.lua

require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  ignore_install = { "ipkg" },
  incremental_selection = { enable = true },


  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
}

-- Syntax highlighting
-- Treesitter highlighting using VS Code Default Dark colors
local hl = vim.api.nvim_set_hl
local ns = 0

-- Functions
hl(ns, "@function",        { fg = "#e5d26c", bold = true })      -- yellow
hl(ns, "@function.call",   { fg = "#e5d26c" })                   -- yellow
hl(ns, "@function.builtin",{ fg = "#e5d26c", italic = true })    -- yellow italic

-- Parameters & Variables
hl(ns, "@variable.parameter", { fg = "#a3d1ff", italic = true }) -- light blue
hl(ns, "@variable",           { fg = "#a3d1ff" })                -- light blue locals
hl(ns, "@variable.builtin",   { fg = "#a3d1ff", italic = true }) -- light blue builtins like self

-- Constants
hl(ns, "@constant",           { fg = "#5fa0ff" }) -- blue
hl(ns, "@constant.builtin",   { fg = "#5fa0ff", italic = true })

-- Classes & Types
hl(ns, "@type",               { fg = "#89d185", bold = true })  -- green
hl(ns, "@type.builtin",       { fg = "#89d185", italic = true }) -- green italic

-- Keywords
hl(ns, "@keyword",            { fg = "#b180d7", italic = true }) -- dark purple
hl(ns, "@keyword.function",   { fg = "#b180d7", italic = true }) -- dark purple

-- Strings & Numbers
hl(ns, "@string",             { fg = "#d6a060" }) -- brown
hl(ns, "@number",             { fg = "#b5cea8" }) -- light green
hl(ns, "@boolean",            { fg = "#b5cea8", bold = true }) -- light green boolean

