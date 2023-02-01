vim.api.nvim_set_keymap('n', '<leader>vt', ':NvimTreeToggle<cr>', { silent = true, noremap = true, desc = '[V]iew [T]ree' })

require('nvim-tree').setup {
    update_focused_file = { enable = true },
    git = { show_on_dirs = false },
    view = {
        signcolumn = "auto",
    },
    renderer = {
        icons = {
            glyphs = {
                git = {
                    unstaged = "○",
                    untracked = "✻",
                }
            }
        }
    },
    filters = { dotfiles = true },
}
