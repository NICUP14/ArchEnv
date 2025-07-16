-- lua/plugin/treesitter.lua

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  ignore_install = { "ipkg" },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
  disable = { 'python' }
}

