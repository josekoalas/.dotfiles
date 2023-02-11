return {
    -- Onedark theme
	--[[{
		'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
		config = function()
			local onedark = require('onedark')
			onedark.setup {
                style = 'deep',
                transparent = true
            }
			onedark.load()
		end
	},]]--

    -- Tokyonight theme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            require('tokyonight').setup{
                style = 'storm',
                transparent = true
            }
            vim.cmd.colorscheme('tokyonight')
        end
    },
}
