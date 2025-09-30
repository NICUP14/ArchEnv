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
vim.keymap.set('n', '<leader>a', ':enew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':bprevious<CR>', { noremap = true, silent = true })

-- Terminal
local term_win = nil
local term_buf = nil
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('n', "<leader><leader>", function()
  -- If terminal window exists and is valid, toggle close/focus
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    -- If terminal is already focused, close it
    if vim.api.nvim_get_current_win() == term_win then
      vim.api.nvim_win_close(term_win, true)
    else
      -- Focus the terminal window
      vim.api.nvim_set_current_win(term_win)
    end
    return
  end

  -- Otherwise, check if any terminal buffer exists (in case term_win got lost)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      term_buf = buf
      -- Open a new window for this terminal at the bottom
      vim.cmd("botright split")
      vim.api.nvim_win_set_buf(0, term_buf)
      term_win = vim.api.nvim_get_current_win()
      return
    end
  end

  -- No terminal exists, create a new one
  vim.cmd("botright split")
  vim.cmd("resize 10")
  vim.cmd("terminal")
  term_win = vim.api.nvim_get_current_win()
  term_buf = vim.api.nvim_get_current_buf()
end, { desc = "Toggle bottom terminal" })

-- Misc
vim.keymap.set('n', '<leader>q', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S>', ':w<CR>', {noremap = true, silent = true})
vim.keymap.set('i', '<C-S>', ':w<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<S-Down>', 'gj', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Down>', '<Esc>gji', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>', 'gk', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Up>', '<Esc>gki', { noremap = true, silent = true })

-- Lint
local lint = require('lint')
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function()
    lint.try_lint()
  end,
})

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "line",
    border = "rounded",
    max_width = 80,
    prefix = "> ",
    format = function(d)
      return d.message
    end,
  })
end, { desc = "Show full diagnostics popup" })

