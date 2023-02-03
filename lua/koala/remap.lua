-- Remaps

local map = vim.keymap.set

---------
-- Vim --
---------

-- Set <leader> to Space
vim.g.mapleader = ' '

-- Move selected lines with J/K
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Half page up/down with C-u/i (since C-d is remapped)
-- Also keeps the cursor centered
map('n', '<C-i>', '<C-d>zz', { desc = 'Half page down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })

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
map('n', '<leader>d', '"_d', { desc = 'Delete to void register' })
map('v', '<leader>d', '"_d', { desc = 'Delete to void register' })

-- Don't press capital Q
map('n', 'Q', '<nop>', { desc = 'Don\'t press capital Q' })

-- Map jj to <Esc>
map('i', 'jj', '<Esc>', { desc = 'Map jj to <Esc>' })

-- Backspace to go to previous buffer
map('n', '<BS>', '<c-^>\'”zz', { desc = 'Backspace to previous buffer' })

-- Redo with U
map('n', 'U', '<C-r>', { desc = 'Redo' })

---------------
-- Telescope --
---------------

local telescope = require('telescope.builtin')

-- Search for files with sf (or only git files with C-s)
map('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
map('n', '<C-s>', telescope.git_files, { desc = 'Search only git files' })

-- Search for a string in the project with sp
map('n', '<leader>sp', function() telescope.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = '[S]earch [P]royect' })

-- Keymap list and search
map('n', '<leader><leader>', telescope.keymaps, { desc = 'Search mappings' })
map('n', '<leader>sc', telescope.commands, { desc = '[S]earch [C]ommands' })

-- Neoclip (clipboard manager)
map('n', '<C-c>', ':Telescope neoclip<CR>', { desc = 'Clipboard manager' })

---------------
-- File tree --
---------------

-- Toggle file tree with C-t
map('n', '<C-t>', ':NvimTreeToggle<CR>', { desc = 'View [T]ree' })

------------------
-- Undo history --
------------------

-- Show undo tree with C-u
map('n', '<C-u>', vim.cmd.UndotreeToggle, { desc = '[U]ndo tree history' })

---------
-- LSP --
---------

local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
    -- Show diagnostics with d and next/previous with ]d/[d
    map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'LSP [D]iagnostics', buffer = bufnr })
    map('n', '[d', vim.diagnostic.goto_next, { desc = 'LSP next [D]iagnostic', buffer = bufnr })
    map('n', ']d', vim.diagnostic.goto_prev, { desc = 'LSP previous [D]iagnostic', buffer = bufnr })

    -- Show references with C-r
    map('n', '<C-r>', vim.lsp.buf.references, { desc = 'LSP [R]eferences', buffer = bufnr })

    -- Hover and info with C-h and h
    map('n', '<leader>h', vim.lsp.buf.signature_help, { desc = 'LSP [H]over signature help', buffer = bufnr })
    map('n', '<C-h>', vim.lsp.buf.hover, { desc = 'LSP [H]over info', buffer = bufnr })

    -- Rename with C-n
    map('n', '<C-n>', vim.lsp.buf.rename, { desc = 'LSP re[N]ame', buffer = bufnr })

    -- Go to definition with C-d and implementation with C-D
    map('n', '<C-d>', vim.lsp.buf.definition, { desc = 'LSP [D]efinition', buffer = bufnr })
    map('n', '<C-D>', vim.lsp.buf.implementation, { desc = 'LSP [D]efinition implementation', buffer = bufnr })

    -- Code actions with ca
    map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ctions', buffer = bufnr })
end)

-----------
-- Debug --
-----------

local dap = require('dap')
local dapui = require('dapui')
local pbr = require('persistent-breakpoints.api')

local dap_keybind = function(dap_action, key)
    if dap.session() then
        dap_action()
    else
        vim.cmd("normal! " .. key)
    end
end

-- Toggle breakpoints with C-b and conditional breakpoints with 
map('n', '<C-b>', pbr.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
map('n', '<leader>ebc', pbr.set_conditional_breakpoint, { desc = '[C]onditional [B]reakpoint' })

-- Delete all breakpoints with
map('n', '<leader>ebd', pbr.clear_all_breakpoints, { desc = '[D]elete all [B]reakpoints' })

-- Start/continue debugging with C-c and stop with C-t
map('n', '<C-c>', function() dap_keybind(dap.continue, '<C-c>') end, { desc = '[C]ontinue debug' })
map('n', '<C-q>', function()
    if dap.session() then
        dap.terminate()
    end
    dapui.toggle()
end, { desc = '[Q]uit debug (and toggle UI)' })
map('n', 'C-Q', dapui.toggle, { desc = 'Toggle debug UI' })

-- Step into/out/over with C-i/o/u
map('n', '<C-i>', function() dap_keybind(dap.step_into, '<C-i>') end, { desc = '[I]n debug step' })
map('n', '<C-o>', function() dap_keybind(dap.step_out, '<C-o>') end, { desc = '[O]ut debug step' })
map('n', '<C-u>', function() dap_keybind(dap.step_over, '<C-u>') end, { desc = '[U]p debug step (over)' })

-- Run to cursor with C-r
map('n', '<C-r>', function() dap_keybind(dap.run_to_cursor, '<C-r>') end, { desc = '[R]un to cursor' })

-- Goto with C-g
map('n', '<C-g>', function() dap_keybind(dap.goto_, '<C-g>') end, { desc = '[G]oto debug' })

-- Start debugging c++/lua/python
-- (implemented in dap.lua)

-------------
-- Tab bar --
-------------

-- Move between tabs with Alt-Left/Right
map('n', '<M-Left>', '<Cmd>BufferPrevious<CR>', { desc = 'Tab previous' })
map('n', '<M-Right>', '<Cmd>BufferNext<CR>', { desc = 'Tab next' })

-- Close tab with tc/tco
map('n', '<leader>tc', '<Cmd>BufferClose<CR>', { desc = '[T]ab [C]lose' })
map('n', '<leader>tco', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = '[T]ab [C]lose [O]ther' })

-- Move tabs with Alt-Up/Down
map('n', '<M-Up>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Tab move previous' })
map('n', '<M-Down>', '<Cmd>BufferMoveNext<CR>', { desc = 'Tab move next' })

-- Go to tab with t1-9
map('n', '<leader>t1', '<Cmd>BufferGoto 1<CR>', { desc = '[T]ab go to [1]' })
map('n', '<leader>t2', '<Cmd>BufferGoto 2<CR>', { desc = '[T]ab go to [2]' })
map('n', '<leader>t3', '<Cmd>BufferGoto 3<CR>', { desc = '[T]ab go to [3]' })
map('n', '<leader>t4', '<Cmd>BufferGoto 4<CR>', { desc = '[T]ab go to [4]' })
map('n', '<leader>t5', '<Cmd>BufferGoto 5<CR>', { desc = '[T]ab go to [5]' })
map('n', '<leader>t6', '<Cmd>BufferGoto 6<CR>', { desc = '[T]ab go to [6]' })
map('n', '<leader>t7', '<Cmd>BufferGoto 7<CR>', { desc = '[T]ab go to [7]' })
map('n', '<leader>t8', '<Cmd>BufferGoto 8<CR>', { desc = '[T]ab go to [8]' })
map('n', '<leader>t9', '<Cmd>BufferGoto 9<CR>', { desc = '[T]ab go to [9]' })

