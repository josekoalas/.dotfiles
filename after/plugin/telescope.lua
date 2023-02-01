-- Load extensions

local tls = require('telescope')
tls.load_extension('fzf')
tls.load_extension('dap')
tls.load_extension("notify")

-- Telescope Keymaps

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-s>', builtin.git_files, { desc = '[S]earch only git files' })
vim.keymap.set('n', '<leader>sp', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = '[S]earch [P]royect' })
