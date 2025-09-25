-- NICUP14's NeoVim configuration file

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
Plug 'neovim/nvim-lspconfig'
Plug 'nvimdev/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

call plug#end()
]])

-- Load plugin configs
require("plugin.error_lens")
require("plugin.treesitter")
require("plugin.telescope")
require("plugin.lualine")
require("plugin.lint")
require("plugin.semshi")
require("plugin.lsp")
require("plugin.lsp-cmp")
require("binds") -- NOTE: Must be last!
