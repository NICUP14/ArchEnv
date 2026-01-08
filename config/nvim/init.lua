-- NICUP14's NeoVim configuration file

-- Basic Vim options (automatically sourced)
-- local opt = vim.opt
vim.cmd("source ~/.vimrc")

-- Enable filetype plugins and indent
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Plugin system: using vim-plug via vimscript embedded in Lua
vim.cmd([[
call plug#begin('~/.config/nvim/plugged')

Plug 'mfussenegger/nvim-lint'
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
-- require("plugin.semshi")
require("plugin.lsp")
require("plugin.lsp-cmp")
require("binds") -- NOTE: Must be last!
