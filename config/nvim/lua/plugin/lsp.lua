-- lua/plugin/lsp.lua

-- LSPSaga setup
local saga = require('lspsaga')
saga.setup({
    hover = { max_width = 80 },
    symbol_in_winbar = { enable = false },
})

-- Keymaps for LSP actions
local function on_attach(client, bufnr)
    local buf_map = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
    end
    buf_map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')
    buf_map('n', 'gk', '<cmd>Lspsaga hover_doc<CR>')
    buf_map('n', 'gr', '<cmd>Lspsaga rename<CR>')
    buf_map('n', 'gp', '<cmd>Lspsaga peek_definition<CR>')
end

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "lua_ls", "ts_ls", "rust_analyzer" },
    automatic_installation = true,
})

-- Capabilities for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Define LSP servers
local lsp_servers = {
    { "pyright", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic", -- or "strict"
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true, -- very important
                }
            }
        }
    }},
    { "lua_ls" },
    { "ts_ls" },
    { "rust_analyzer" },
}

-- Enable and configure servers using the new API
for _, server in pairs(lsp_servers) do
    local name, config = server[1], server[2] or {}

    config.on_attach = on_attach
    config.capabilities = capabilities

    vim.lsp.enable(name)
    vim.lsp.config(name, config)
end

