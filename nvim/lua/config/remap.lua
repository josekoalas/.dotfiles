-- Remaps

local map = vim.keymap.set

---------
-- Vim --
---------

-- Move selected lines with J/K
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Half page up/down with C-j/k (since C-d/u are remapped)
-- Also keeps the cursor centered
map('n', '<C-j>', '<C-d>zz', { desc = 'Half page down' })
map('n', '<C-k>', '<C-u>zz', { desc = 'Half page up' })

-- Add lines bellow/above the cursor with Enter/Shift-Enter
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

-- Backspace to go to previous buffer
map('n', '<BS>', '<c-^>\'”zz', { desc = 'Backspace to previous buffer' })

-- Redo with U
map('n', 'U', '<C-r>', { desc = 'Redo' })

-- Open lazy plugin window
map('n', '<leader>l', ':Lazy<CR>', { desc = 'Lazy plugin manager' })

-- Switch between buffers
map('n', '<M-Left>', ':bprevious<CR>', { desc = 'Next tab' })
map('n', '<M-Right>', ':bnext<CR>', { desc = 'Previous tab' })
map('n', '<leader>tc', ':bd<CR>', { desc = '[T]ab [C]lose' })
map('n', '<leader>td', ':%bd|e#|bd#<CR>', { desc = '[T]ab [D]elete all' })

---------
-- LSP --
---------
--[[
-- Show diagnostics with d and next/previous with ]d/[d
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'LSP [D]iagnostics' })
map('n', '[d', vim.diagnostic.goto_next, { desc = 'LSP next [D]iagnostic' })
map('n', ']d', vim.diagnostic.goto_prev, { desc = 'LSP previous [D]iagnostic' })
--map('n', '<leader>da', telescope.diagnostics, { desc = 'LSP [D]iagnostics [A]ll' })

-- Show references
--map('n', '<C-r>', telescope.lsp_references, { desc = 'LSP [R]eferences' })

-- Hover and info
map('n', '<C-h>', vim.lsp.buf.signature_help, { desc = 'LSP [H]over function signature help' })
map('n', '<leader>h', vim.lsp.buf.hover, { desc = 'LSP [H]over info' })

-- Incoming and outgoing calls
--map('n', '<leader>ci', telescope.lsp_incoming_calls, { desc = 'LSP [I]ncoming [C]alls' })
--map('n', '<leader>co', telescope.lsp_outgoing_calls, { desc = 'LSP [O]utgoing [C]alls' })

-- Symbols (workspace and document) and type definitions
--map('n', '<leader>sd', telescope.lsp_document_symbols, { desc = 'LSP [S]ymbols [D]ocument' })
--map('n', '<leader>sw', telescope.lsp_workspace_symbols, { desc = 'LSP [S]ymbols [W]orkspace' })
--map('n', '<leader>st', telescope.lsp_type_definitions, { desc = 'LSP [S]ymbols [T]ype definitions' })

-- Rename
map('n', '<C-n>', vim.lsp.buf.rename, { desc = 'LSP re[N]ame' })

-- Go to definition with and implementation
--map('n', '<C-d>', telescope.lsp_definitions, { desc = 'LSP [D]efinition' })
map('n', '<leader>gd', vim.lsp.buf.implementation, { desc = 'LSP [D]efinition implementation' })

-- Code actions with ca
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ctions' })

-- Format buffer
map('n', '<leader>ff', vim.lsp.buf.format, { desc = 'LSP [F]ormat [F]ile' })


--[[---------


--------------
-- Markdown --
--------------

map('n', '<leader>md', '<Plug>MarkdownPreviewToggle', { desc = '[M]ark[d]own preview toggle' })

---------------
-- Databases --
---------------

map('n', '<leader>sq', '<Cmd>DBUIToggle<CR>', { desc = '[SQ]L Database UI Toggle' })

---

]]--
