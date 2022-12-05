local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
if not dap_ok then
    vim.notify("dap failed", "error", { render = "minimal" })
    return
end

if not dapui_ok then
    vim.notify("dapui failed", "error", { render = "minimal" })
    return
end

-- Setup Mason rootdir
local mason_rootdir = vim.fn.stdpath("data") .. "/mason"

----------------------
-- Setup dapUi
----------------------
opt = require("configs.dap.dapui")
dapui.setup(opt)

----------------------
-- Auto open dapUi
----------------------
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

----------------------
-- Dap setup
----------------------
-- c/c++
-- codetools ad: more readable
local cpptools_dir = mason_rootdir .. "/packages/cpptools/extension"

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = cpptools_dir .. "/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        setupCommands = { -- you have to set this to make dap debugger readable
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}
dap.configurations.c = dap.configurations.cpp

-- python
-- dap.adapters.python = {
--     type = "executable",
--     command = "/usr/bin/python3",
--     args = { "-m", "debugpy.adapter" },
-- }

-- Rust
local extension_path = vim.env.HOME
    .. "/.local/share/nvim/mason/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
dap.adapters.codelldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "rt_lldb",
}
dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = false,
    },
}

-- lldb-vscode ad: more information

-- dap.adapters.lldb = {
-- 	type = "executable",
-- 	command = "/home/linuxbrew/.linuxbrew/bin/lldb-vscode", -- adjust as needed, must be absolute path
-- 	name = "lldb",
-- }
--
-- dap.configurations.cpp = {
-- 	{
-- 		name = "Launch",
-- 		type = "lldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 		args = {},
-- 	},
-- }
