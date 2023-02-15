-- Navbar (bufferline) and statusbar (lualine)
-- https://github.com/hoob3rt/lualine.nvim

return {
    {
        'hoob3rt/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                theme = 'kanagawa',
                component_separators = ' ',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 2 },
                },
                lualine_b = {
                    { 'filename' },
                },
                lualine_c = {
                    { 'diagnostics', sources = { 'nvim_lsp' } }
                },
                lualine_x = {
                    { 'encoding', colored = true },
                    { 'filetype', colored = true },
                },
                lualine_y = {
                    { 'branch', icon = '' },
                    { 'diff', colored = true, symbols = { added = ' ', modified = '柳', removed = ' ' } },
                },
                lualine_z = {
                    { 'location', separator = { right = '' } },
                },
            },
            extensions = { 'nvim-tree', 'nvim-dap-ui', 'fugitive' }
        },
        event = 'VeryLazy',
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
            }
        },
        event = 'VeryLazy',
        keys = {
            { '<M-l>', ':BufferLineCycleNext<CR>', desc = 'Next tab' },
            { '<M-h>', ':BufferLineCyclePrev<CR>', desc = 'Previous tab' },
            { '<M-L>', ':BufferLineMoveNext<CR>', desc = 'Move tab right' },
            { '<M-H>', ':BufferLineMovePrev<CR>', desc = 'Move tab left' },
            { '<M-1>', ':BufferLineGoToBuffer 1<CR>', desc = 'Go to tab 1' },
            { '<M-2>', ':BufferLineGoToBuffer 2<CR>', desc = 'Go to tab 2' },
            { '<M-3>', ':BufferLineGoToBuffer 3<CR>', desc = 'Go to tab 3' },
            { '<M-4>', ':BufferLineGoToBuffer 4<CR>', desc = 'Go to tab 4' },
            { '<M-5>', ':BufferLineGoToBuffer 5<CR>', desc = 'Go to tab 5' },
            { '<M-6>', ':BufferLineGoToBuffer 6<CR>', desc = 'Go to tab 6' },
            { '<M-7>', ':BufferLineGoToBuffer 7<CR>', desc = 'Go to tab 7' },
            { '<M-8>', ':BufferLineGoToBuffer 8<CR>', desc = 'Go to tab 8' },
            { '<M-9>', ':BufferLineGoToBuffer 9<CR>', desc = 'Go to tab 9' },
            { '<M-0>', ':BufferLineGoToBuffer 10<CR>', desc = 'Go to tab 10' },
            { '<leader>ts', ':BufferLinePick<CR>', desc = 'Select tab' },
            { '<leader>tc', ':bd<CR>', desc = 'Close tab' },
            { '<leader>tC', ':BufferLinePickClose<CR>', desc = 'Pick tab and close' },
            { '<leader>td', ':%bd|e#|bd#<CR>', desc = 'Close all tabs but this one' },
            { '<leader>tD', ':%bd<CR>', desc = 'Close all tabs' },
            { '<leader>tp', ':BufferLineTogglePin<CR>', desc = 'Toggle tab pin' },
        }
    }
}
