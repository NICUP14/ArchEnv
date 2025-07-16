-- lua/plugin/lint.lua

local lint = require('lint')

lint.linters_by_ft = {
  markdown = {'markdownlint'},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set('n', '<leader>l', function()
  lint.try_lint()
end, { noremap = true, silent = true })
