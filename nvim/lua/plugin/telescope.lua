-- lua/plugin/telescope.lua

require('nvim-web-devicons').setup {}
require('telescope').setup{
  defaults = {
    prompt_prefix = " ",  -- use a single char to reduce overflow
    results_title = false,
  }
}

local builtin = require('telescope.builtin')


vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { noremap = true, silent = true, desc = 'Live Grep' })
vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<C-h>', builtin.help_tags, { desc = 'Help Tags' })
