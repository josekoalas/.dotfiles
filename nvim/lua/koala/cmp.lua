local cmp = require('cmp')

-- Helper function
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

-- Setup CMP preferences
require('lsp-zero').setup_nvim_cmp({
    method = 'getCompletionsCycling',
    sources = {
        { name = 'copilot', max_item_count = 3},
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = require('lsp-zero').defaults.cmp_mappings({
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
    window = {
        border = 'rounded',
    },
    experimental = {
        ghost_text = true,
    }
})

-- Fix for autopairs with cmp
cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

