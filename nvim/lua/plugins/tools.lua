-- Tools
-- Assorted helper plugins

return {
    -- Tmux navigator: Navigate vim/tmux panes using Alt+HJKL
	{
        'christoomey/vim-tmux-navigator',
        keys = {
            { '<M-h>', ':TmuxNavigateLeft<CR>', desc = 'Tmux navigate left' },
            { '<M-j>', ':TmuxNavigateDown<CR>', desc = 'Tmux navigate down' },
            { '<M-k>', ':TmuxNavigateUp<CR>', desc = 'Tmux navigate up' },
            { '<M-l>', ':TmuxNavigateRight<CR>', desc = 'Tmux navigate right' },
            { '<M-g>', ':TmuxNavigatePrevious<CR>', desc = 'Tmux navigate previous' },       
        }
    },

    -- Autosave: Save files when changes are made
    {
		'pocco81/auto-save.nvim',
        opts = {
            execution_message = {
                message = '', 
                cleaning_interval = 700,
            },
            debounce_delay = 3000,
        },
        event = 'InsertLeavePre'
	},


    -- Neoclip: Save a clipboard history of yanks
    {
        'acksld/nvim-neoclip.lua',
        dependencies = {
            'kkharji/sqlite.lua', -- Persist history between sessions
        },
        opts = {
            history = 256,
            enable_persistent_history = true,
        },
        event = 'VeryLazy'
    },
}
