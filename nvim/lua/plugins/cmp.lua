-- Completions
-- Use different sources to offer autocompletions

-- Setup
--  · nvim-cmp (the main completion plugin)

return {
    {
        'hrsh7th/nvim-cmp',
        version = false,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        opts = function()
            local cmp = require('cmp')
            return {
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = vim.schedule_wrap(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end),
                    ['<S-CR>'] = vim.schedule_wrap(function(fallback) -- don't select anything
                        if cmp.visible() then
                            cmp.close()
                        end
                        fallback()
                    end),
                    ["<CR>"] = cmp.mapping.confirm({ -- copilot-cmp
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                }),
                sources = cmp.config.sources({
                    { name = 'copilot', max_item_count = 3 },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                experimental = {
                    ghost_text = {
                        hl_group = 'LspCodeLens',
                    },
                },
            }
        end,
        event = 'InsertEnter',
    }
}
