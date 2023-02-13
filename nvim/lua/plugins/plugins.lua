-- Plugin setup for Lazy

return {
    ----------
    -- Code --
    ----------

    --[[

    -- LSP for Java
    { 'mfussenegger/nvim-jdtls', ft = 'java' },

    -- Markdown
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        config = function()
            vim.g.mkdp_filetypes = { 'markdown' }
            vim.g.mkdp_port = '5656'
            vim.g.mkdp_browser = 'firefox'
        end,
        ft = { 'markdown' },
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
        ft = { 'markdown' },
    },]]--

    -- Jupiter notebooks
    --[[ {
        'luk400/vim-jukit',
        ft = { 'jupyter' }
    }, ]]

    -- Database queries
    --[[{
        'tpope/vim-dadbod',
        dependencies = {
            {
                'kristijanhusak/vim-dadbod-ui',
                config = function()
                    vim.g.dadbod_ui_auto_execute_table_helpers = 0
                end,
}
        },
    },
    -----------
    -- Other --
    -----------

	-- Undotree (undo history)
	{
        'mbbill/undotree',
        cmd = { 'UndotreeToggle' },
    },
	
	-- Git
	{
        'tpope/vim-fugitive', -- Git commands in vim
        dependencies = {
            'tpope/vim-rhubarb', -- GitHub integrations for fugitive
        },
        cmd = 'Git',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = true
    },

    -- Autosave sessions
    {
        'rmagatti/auto-session',
        opts = {
            log_level = 'error',
            auto_session_suppress_dirs = { '~/', '~/Downloads', '/'},
        }
    },

    -- Keymaps
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require('which-key').setup()
        end,
        lazy = 'true'
    },

    -- Load local vim configurations
    {
        'klen/nvim-config-local',
        opts = {
            config_files = { '.nvim.lua' }
        }
    },

	-- Vim Games
	'theprimeagen/vim-be-good',]]--
}
