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

    -- Collaborative neovim 
    {
        'jbyuki/instant.nvim',
        config = function()
            vim.g.instant_username = 'koala'
        end,
        keys = {
            { '<leader>iS', ':InstantStartServer 127.0.0.1 6969<CR>', desc = 'Start Sharing Server' },
            { '<leader>is', ':InstantStartSingle 127.0.0.1 6969<CR>', desc = 'Start Sharing Session' },
            { '<leader>iT', ':InstantStopServer<CR>', desc = 'Stop Sharing Server' },
            { '<leader>it', ':InstantStop<CR>', desc = 'Stop Sharing Session' },
            { '<leader>ic', ':InstantStatus<CR>', desc = 'Sharing Session Current Status' },
        }
    },

    -- Vim games
    {
        'theprimeagen/vim-be-good',
        cmd = 'VimBeGood'
    }
}
