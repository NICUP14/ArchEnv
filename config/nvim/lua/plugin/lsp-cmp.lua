-- lua/plugin/lsp-cmp.lua

local kind_priority = {
    [5] = 1, -- Field
    [6] = 1, -- Variable
    [2] = 2, -- Method
    [3] = 2, -- Function
}

local function custom_comparator(entry1, entry2)
    local kind1 = entry1:get_kind()
    local kind2 = entry2:get_kind()

    local p1 = kind_priority[kind1] or 100
    local p2 = kind_priority[kind2] or 100

    if p1 ~= p2 then
        return p1 < p2
    end

    -- For p1 == p2
    return nil
end

local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = { { name = 'nvim_lsp' } },
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            custom_comparator,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})
