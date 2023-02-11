-- LSP
-- Smart language features

-- Setup
--  · nvim-lspconfig (configures neovim lsp)
--  · mason (install language servers)

return {
    {
        'folke/neodev.nvim',
        opts = {
            experimental = {
                pathStrict = true,
            }
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = true,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                opts = {
                    ensure_installed = {},
                }
            }
        },
        config = function()
            local lsp_capabilities = {} -- require('cmp_nvim_lsp').default_capabilities()
            local lsp_attach = function(client, bufnr)
                -- TODO: Keybindings
            end

            local lspconfig = require('lspconfig')
            require('mason-lspconfig').setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = lsp_attach,
                        capabilities = lsp_capabilities,
                    })
                end,
            })
        end,
        event = { 'BufReadPre', 'BufNewFile' },
    },
}
