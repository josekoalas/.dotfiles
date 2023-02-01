local dap = require('dap')
local dapui = require('dapui')
local pbr = require('persistent-breakpoints')
-- DAP mappings

vim.keymap.set('n', '<leader>pc', dap.continue, { desc = 'Debug [P]rogram [C]ontinue', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pi', dap.step_into, { desc = 'Debug [P]rogram step [I]nto', noremap = true, silent = true })
vim.keymap.set('n', '<leader>po', dap.step_over, { desc = 'Debug [P]rogram step [O]ver', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pu', dap.step_out, { desc = 'Debug [P]rogram step [U]p (out)', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pr', dap.repl.open, { desc = 'Debug [P]rogram [R]epl', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pt', dap.run_to_cursor, { desc = 'Debug [P]rogram [T]o cursor', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pg', dap.goto_, { desc = 'Debug [P]rogram [G]oto', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pv', function() require("telescope").extensions.dap.variables() end, { desc = 'Debug [P]rogram [V]ariables', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pf', function() require("telescope").extensions.dap.frames() end, { desc = 'Debug [P]rogram [F]rames', noremap = true, silent = true })
vim.keymap.set('n', '<leader>pb', function() require("telescope").extensions.dap.list_breakpoints() end, { desc = 'Debug [P]rogram [B]reakpoints', noremap = true, silent = true })

-- DAP UI
dapui.setup{}
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
--dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
--dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

vim.keymap.set('n', '<leader>ps', dapui.open, { desc = 'Debug [P]rogram [S]how', noremap = true, silent = true })
vim.keymap.set('n', '<leader>ph', dapui.close, { desc = 'Debug [P]rogram [H]ide', noremap = true, silent = true })

-- Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

-- C/C++
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/bin/lldb-vscode',
    name = 'lldb'
}
dap.configurations.cpp = {
    {
        type = 'lldb',
        request = 'launch',
        name = 'Debug',
        program = './bin/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        runInTerminal = true,
        args = {},
        env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
        end,
        preLaunchTask = 'gcc build',
    }
}
dap.configurations.c = dap.configurations.cpp

-- Persistent breakpoints

pbr.setup{
    load_breakpoints_event = { "BufReadPost" }
}

local pbr_api = require('persistent-breakpoints.api')
vim.keymap.set('n', '<leader>bt', pbr_api.toggle_breakpoint, { desc = '[B]reakpoint [T]oggle', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bc', pbr_api.set_conditional_breakpoint, { desc = '[B]reakpoint [C]onditional', noremap = true, silent = true })
vim.keymap.set('n', '<leader>bda', pbr_api.clear_all_breakpoints, { desc = '[B]reakpoint [D]elete [A]ll', noremap = true, silent = true })
