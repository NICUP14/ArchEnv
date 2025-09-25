-- NICUP14's NeoVim key bindings

-- Leader
vim.g.mapleader = "`"

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { noremap = true, silent = true, desc = 'Live Grep' })
vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<C-h>', builtin.help_tags, { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>z', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy search in current buffer' })
vim.keymap.set('n', '<leader>x', builtin.oldfiles, { desc = 'Open recent files' })

-- Buffers
vim.keymap.set('n', '<C-n>', ':enew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Misc
vim.keymap.set('n', '<leader><leader>', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', 'gj', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Down>', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>', 'gk', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Up>', 'gk', { noremap = true, silent = true })

-- Lint
local lint = require('lint')
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function()
    lint.try_lint()
  end,
})
