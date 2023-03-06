-- Tools
-- Assorted helper plugins

return {
    -- Tmux navigator: Navigate vim/tmux panes using C+HJKL
	{
        'christoomey/vim-tmux-navigator',
        keys = {
            { '<C-h>', ':TmuxNavigateLeft<CR>', desc = 'Tmux navigate left' },
            { '<C-j>', ':TmuxNavigateDown<CR>', desc = 'Tmux navigate down' },
            { '<C-k>', ':TmuxNavigateUp<CR>', desc = 'Tmux navigate up' },
            { '<C-l>', ':TmuxNavigateRight<CR>', desc = 'Tmux navigate right' },
            { '<C-g>', ':TmuxNavigatePrevious<CR>', desc = 'Tmux navigate previous' },
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

    -- Autosave sessions
    {
        'rmagatti/auto-session',
        opts = {
            log_level = 'error',
            auto_session_suppress_dirs = { '~/', '~/Downloads', '/'}
        },
        event = 'BufWinEnter'
    },

    -- Undotree (undo history)
	{
        'mbbill/undotree',
        keys = { { '<leader>u', ':UndotreeToggle<CR>', desc = 'Toggle [U]ndo Tree' } }
    },
}
