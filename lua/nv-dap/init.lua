local dap = require("dap")
local dapui = require("dapui")
dapui.setup{}
require("nvim-dap-virtual-text").setup{}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end


dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}

dap.configurations.cpp = {
    {
        name = "Gdb Debug Attach",
        type = "gdb",
        request = "attach",
        pid = require('dap.utils').pick_process,
        args = {}
    },
    {
        name = "Gdb Debug Executable",
        type = "gdb",
        request = "launch",
        stopOnEntry = false,
        cwd = "${workspaceFolder}",
        -- program = "${file}",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}
    },
    {
        name = "LLDB Debug",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        cwd = "${workspaceFolder}",
        -- program = "${file}",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}
    },
}



local path = "/home/iaroslav/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)
