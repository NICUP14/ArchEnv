-- NICUP14's NeoVim configuration file

-- Leader key (set early)
vim.g.mapleader = "`"

-- Basic Vim options
local opt = vim.opt
opt.compatible = false
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.number = true
opt.wildmode = "longest,list"
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.ttyfast = true

-- Enable filetype plugins and indent
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Plugin system: using vim-plug via vimscript embedded in Lua
vim.cmd([[
call plug#begin('~/.config/nvim/plugged')

Plug 'mfussenegger/nvim-lint'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'chikko80/error-lens.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()
]])

-- Load plugin configs
require("plugin.error_lens")
require("plugin.treesitter")
require("plugin.telescope")
require("plugin.lualine")
require("plugin.lint")
require("plugin.semshi")

-- Keymaps
vim.keymap.set('n', 'Q', 'gqq', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', 'gj', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Down>', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>', 'gk', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Up>', 'gk', { noremap = true, silent = true })

