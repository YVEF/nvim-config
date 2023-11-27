

local dap = require("dap")
local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end




-- require("mason-nvim-dap").setup{
--     ensure_installed = {"codelldb"},
--     handlers = {
--         function(config)
--             require("mason-nvim-dap").default_setup(config)
--         end,
--     }
-- }

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.cpp = {
    {
        name = "Launch c++",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        cwd = "${workspaceFolder}",
        -- program = "${workspaceFolder}/cmake-build-Debug/test",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}
    },
}




local path = "/home/iaroslav/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(path)
