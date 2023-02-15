-- UI
-- Various plugins for the editor UI
-- (Navbar and statusbar are on bars.lua)

return {
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup{
                background_colour = '#040c1a'
            }
            vim.notify = require('notify').notify
        end,
        event = 'VeryLazy'
    }
}
