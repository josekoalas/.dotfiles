local dap = require('dap')
local dapui = require('dapui')

-- DAP UI
dapui.setup{}
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
--dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

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

require('persistent-breakpoints').setup{
    load_breakpoints_event = { "BufReadPost" }
}