-- Remaps

local map = vim.keymap.set

-- Move selected lines with J/K
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Half page up/down with Alt-j/k
-- Also keeps the cursor centered
map('n', '<M-j>', '<C-d>zz', { desc = 'Half page down' })
map('n', '<M-k>', '<C-u>zz', { desc = 'Half page up' })

-- Add lines bellow/above the cursor with Enter/Shift-Enter (also tab the line)
map('n', '<Enter>', 'o<Esc>', { desc = 'Add line bellow' })
map('n', '<S-Enter>', 'O<Esc>', { desc = 'Add line above' })

-- Search terms stay centered
map('n', 'n', 'nzzzv', { desc = 'Search next' })
map('n', 'N', 'Nzzzv', { desc = 'Search previous' })

-- Paste without losing the buffer
map('x', '<leader>p', '"_dP', { desc = 'Paste without losing buffer' })

-- Copy into the system clipboard
map('n', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Copy to system clipboard' })

-- Delete to the void register
map('n', '<leader>x', '"_d', { desc = 'Delete to void register' })
map('v', '<leader>x', '"_d', { desc = 'Delete to void register' })

-- Don't press capital Q
map('n', 'Q', '<nop>', { desc = 'Don\'t press capital Q' })

-- Map jj to <Esc>
map('i', 'jj', '<Esc>', { desc = 'Map jj to <Esc>' })

-- Redo with U
map('n', 'U', '<C-r>', { desc = 'Redo' })

-- Open lazy plugin window
map('n', '<leader>l', ':Lazy<CR>', { desc = 'Lazy plugin manager' })

-- New file with nf
map('n', '<leader>nf', ':enew<CR>', { desc = '[N]ew [F]ile' })
