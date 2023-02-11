local lsp = require('lsp-zero')
local neodev = require('neodev')

-- Settings

local lua_settings = {
    Lua = {
        diagnostics = {
            globals = { 'vim' }
        }
    }
}

local python_settings = {
    pylsp = {
        plugins = {
            pycodestyle = {
                ignore = {'E265', 'E302', 'E305'},
            }
        }
    }
}

local typescript_settings = {
    completions = {
        completeFunctionCalls = true
    }
}

local lsp_config = {
    set_lsp_keymaps = false,
}

local neodev_config = {
    library = {
        plugins = { 'nvim-dap-ui' },
        types = true
    }
}

-- Initialization

-- Recommended settings
lsp.preset('recommended')

-- Default language servers (WIP)
lsp.ensure_installed({
    'clangd',
    'sumneko_lua',
    'tsserver',
    'eslint',
    'html',
    'cssls'
})

-- Configure neodev
neodev.setup(neodev_config)

-- Configure LSPs
lsp.configure('sumneko_lua', { settings = lua_settings })
lsp.configure('pylsp', { settings = python_settings })
lsp.configure('tsserver', { settings = typescript_settings })

-- LSP preferences
lsp.set_preferences(lsp_config)

-- Setup LSP
lsp.setup()
