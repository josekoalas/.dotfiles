-- Misc
-- Plugins that don't fit elsewhere

return {
    -- Keymaps
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require('which-key').setup()
        end,
        event = 'VeryLazy'
    },

    -- Vim games
    {
        'theprimeagen/vim-be-good',
        cmd = 'VimBeGood'
    }
}
