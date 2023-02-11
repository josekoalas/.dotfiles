-- Telescope
-- https://github.com/nvim-telescope/require('telescope')nvim
-- Fuzzy finder and picker, powers many other utilities

return {
    {
        'nvim-telescope/telescope-file-browser.nvim',
        config = function()
            require('telescope').load_extension('file_browser')
        end,
        keys = {
            { '<C-t>', ':Telescope file_browser path=%:p:h<CR>', desc = 'Telescope file browser' },
        }
    },
    {
		'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end
            },
        },
        opts = {
            defaults = {
                mappings = {
                    i = { ['<C-w>'] = 'which_key' }
                },
                layout_strategy = 'horizontal',
                layout_config = {
                    prompt_position = 'top'
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = false,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                file_browser = {
                    hijack_netrw = true,
                }
            }
        },
        config = function()
            local t = require('telescope')
            t.load_extension('neoclip') -- Already loaded on VeryLazy
            t.load_extension('notify') -- Already loaded on VeryLazy
        end,
        keys = {
            -- Search for files (or only git files)
            { '<C-s>', function() require('telescope.builtin').find_files() end, desc = 'Search files' },
            { '<leader>sf', function() require('telescope.builtin').git_files() end, desc = '[S]earch only git [F]iles' },

            -- Live grep and search string
            { '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = '[S]earch [G]rep' },
            { '<leader>ss', function() require('telescope.builtin').grep_string() end, desc = '[S]earch [S]tring' },

            -- Keymap, command and vim options
            { '<leader>sm', function() require('telescope.builtin').keymaps() end, desc = '[S]earch [M]appings' },
            { '<leader>sc', function() require('telescope.builtin').commands() end, desc = '[S]earch [C]ommands' },
            { '<leader>so', function() require('telescope.builtin').vim_options() end, desc = '[S]earch [O]ptions' },

            -- Buffers
            { '<leader>sb', function() require('telescope.builtin').buffers() end, desc = '[S]earch [B]uffers' },

            -- Search help
            { '<leader>sh', function() require('telescope.builtin').man_pages() end, desc = '[S]earch [H]elp' },

            -- Treesitter
            { '<C-f>', function() require('telescope.builtin').treesitter() end, desc = '[Tr]eesitter (Function variables)' },

            -- Neoclip clipboard (add load extension)
            { '<leader>sp', ':Telescope neoclip<CR>', desc = '[S]earch [P]aste clipboard history' },

            -- Notify history
            { '<leader>sn', ':Telescope notify<CR>', desc = '[S]earch [N]otifications' },
        }
    }
}
