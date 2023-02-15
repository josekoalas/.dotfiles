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

    -- Load local neovim configuration
    {
        'klen/nvim-config-local',
        opts = {
            config_files = { '.nvim.lua' }
        },
        event = 'VimEnter'
    },

    -- Load GLSL viewer
    {
        'timtro/glslview-nvim',
        opts = {
            exe_path = '/usr/local/bin/glslViewer',
            arguments = { '-l', '-w', '128', '-h', '256' },
        },
        ft = 'glsl'
    },

    -- Vim games
    {
        'theprimeagen/vim-be-good',
        cmd = 'VimBeGood'
    }
}
