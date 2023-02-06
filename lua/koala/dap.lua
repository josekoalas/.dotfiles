local dap = require('dap')
local dapui = require('dapui')

-- DAP UI

local dapui_config = {
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.65 },
                { id = 'stacks', size = 0.25 },
                { id = 'watches', size = 0.1 },
            },
            position = 'left',
            size = 32,
        },
        {
            elements = {
                { id = 'repl', size = 0.5 },
                { id = 'console', size = 0.5 },
            },
            position = 'bottom',
            size = 8,
        }
    }
}

-- Debug configurations

local python_config = {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    console = 'integratedTerminal',
}

local c_cpp_config = {
    type = 'lldb',
    request = 'launch',
    name = 'Debug C/C++',
    program = './${relativeFileDirname}/bin/${fileBasenameNoExtension}',
    cwd = vim.fn.getcwd(),
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

local make_config = c_cpp_config
make_config.name = 'Debug C/C++ (make)'
make_config.program = './${relativeFileDirname}/bin/main'
make_config.preLaunchTask = 'make build'

local java_config = {
    type = 'java',
    request = 'launch',
    name = 'Debug Java',
    preLaunchTask = 'gradle build'
}

-- Debug adapters

local lldb_adapter = {
    type = 'executable',
    command = '/usr/local/bin/lldb-vscode',
    name = 'lldb'
}

-- DAP Setup

local dap_setup = function()
    dapui.setup(dapui_config)
    dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end

    dap.config = {
        python = python_config,
        c = { c_cpp_config, make_config },
        cpp = { c_cpp_config, make_config },
        java = java_config,
    }
    dap.adapters = {
        lldb = lldb_adapter,
    }

    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
end

return {
    setup = dap_setup,
    config = {
        python = python_config,
        ccpp = c_cpp_config,
        make = make_config,
        java = java_config,
    },
}
