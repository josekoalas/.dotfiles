-- Plugin setup for Lazy

return {
    ----------
    -- Code --
    ----------

	-- Treesitter (syntax, indent, more)
	--[[,

	-- LSP (using lsp-zero)
	{
		'vonheikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig', -- Configures language servers
			'williamboman/mason.nvim', -- Installs and updates LSPs
			'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim', --Support signature help for lua

            -- Completions
            {
                'hrsh7th/nvim-cmp', -- Autocompletes based on sources (bellow)
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp', -- Data sent by the language server
                    'hrsh7th/cmp-buffer', -- Suggestions from current buffer
                    'hrsh7th/cmp-path', -- Suggestions from the filesystem
                    'saadparwaiz1/cmp_luasnip', -- Snippets in the suggestions
                    {
                        'zbirenbaum/copilot-cmp', -- Copilot completions
                        dependencies = {
                            'zbirenbaum/copilot.lua',
                            opts = {
                                cmp = {
                                    enabled = true,
                                    method = 'getCompletionsCycling',
                                },
                                suggestion = { enabled = false },
                                server_opts_overrides = {
                                    settings = {
                                        advanced = {
                                            inlineSuggestCount = 3,
                                        }
                                    }
                                },
                                filetypes = {
                                    markdown = true,
                                }
                            }
                        },
                        config = true,
                    },
                },
                config = function () require('koala.cmp') end,
                event = 'InsertEnter',
            },

            -- Snippets
            {
                'l3mon4d3/luasnip',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                    require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/snippets'})
                end
            },
        },
        config = function() require('koala.lsp') end,
        event = 'BufReadPre',
    },

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

    -- Autoclose tags
    {
        'windwp/nvim-autopairs',
        opts = {
            check_ts = true,
            disable_filetype = { 'TelescopePrompt', 'vim', 'NvimTree', 'dap-repl' },
        }
    },

    -- Surround tag manager
    {
        'kylechui/nvim-surround',
        opts = {
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
            }
        }
    },

    ---------------
    -- Debugging --
    ---------------

    -- DAP (debugger)
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui' , -- UI for debugging
            'thehamsta/nvim-dap-virtual-text', -- Virtual text for DAPs
            'mfussenegger/nvim-dap-python', -- DAP for python
            { 'weissle/persistent-breakpoints.nvim' , opts = { load_breakpoints_event = { "BufReadPost" } }}, -- Save breakpoints automatically
            {
                'nvim-telescope/telescope-dap.nvim', -- Telescope functions for DAPs
                config = function()
                    require('telescope').load_extension('dap')
                end
            }
        },
        config = function()
            require('koala.dap').setup()
            require('koala.remap').dap()
        end,
        keys = { '<C-e>', '<C-b>' }
    },

    -- Overseer (task manager)
    {
        'stevearc/overseer.nvim',
        opts = {
            dap = true,
            templates = {
                'builtin',
                'ccppbuild',
                'javabuild'
            },
        },
        ft = { 'c', 'cpp', 'java', 'python' }
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

    -- Comments
    {
        'numtostr/comment.nvim',
        opts = {
            toggler = {
                line = 'tc',
                block = 'tb',
            },
            opleader = {
                line = 'tc',
                block = 'tb',
            },
        }
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
