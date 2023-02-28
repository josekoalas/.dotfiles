-- Markdown support

return {
    {
        'adalessa/markdown-preview.nvim', -- Preview in pdf (TODO: fork locally and fix)
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
        ft = 'markdown',
        keys = { { '<leader>md', ':MarkdownPreviewToggle<CR>', desc = '[M]ark[d]own preview toggle' } },
        enable = false
    },
    {
        'jakewvincent/mkdnflow.nvim',
        opts = {
            mappings = {
                MkdnEnter = {{'i', 'n', 'v'}, '<C-CR>'},
                MkdnNextLink = false,
                MkdnPrevLink = false,
                MkdnTableNextCell = false,
                MkdnTablePrevCell = false,
            }
        },
        ft = 'markdown',
    },
    {
        'jbyuki/nabla.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('nabla').enable_virt()
        end,
        keys = function()
            local has_nabla, nabla = pcall(require, 'nabla')
            if not has_nabla then return {} end

            return {
                { '<leader>np', nabla.popup, desc = '[N]abla [P]review (math)' }
            }
        end,
        ft = { 'markdown', 'latex' }
    }
}
