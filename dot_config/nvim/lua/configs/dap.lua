local dap = require("dap")
local dap_ui = require("dapui").setup()

local mason_rootdir = vim.fn.stdpath("data") .. "/mason"

-- c / c++
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
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		-- miDebuggerPath = "/usr/bin/gdb",
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
