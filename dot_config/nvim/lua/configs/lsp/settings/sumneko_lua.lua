-- Setup your lua path
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
				globals = { "vim" },
				disable = {
					"lowercase-global",
					"undefined-global",
					"unused-local",
					"unused-vararg",
					"trailing-space",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				-- library = vim.api.nvim_get_runtime_file("", true),
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				maxPreload = 2000,
				preloadFileSize = 50000,
			},
			completion = { callSnippet = "Both" },
			telemetry = { enable = false },
		},
	},
}
