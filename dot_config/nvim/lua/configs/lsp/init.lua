local M = {}

-- Disable inline diagnostics
vim.diagnostic.config({ virtual_text = false })

local servers = {
	pyright = {
		analysis = {
			typeCheckingMode = "off",
		},
	},
	tsserver = { disable_formatting = true },
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
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
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
					-- library = vim.api.nvim_get_runtime_file("", true),
					maxPreload = 2000,
					preloadFileSize = 50000,
				},
				completion = { callSnippet = "Both" },
				telemetry = { enable = false },
			},
		},
	},
}

local opts = {
	flags = {
		debounce_text_changes = 150,
	},
}

notif_ok, vim.notify = pcall(require, "notify")
require("notify").setup({})

-- Setup LSP handlers
local status_ok, setup_lsp = pcall(require, "configs.lsp.installer")
if not status_ok then
	vim.notify("lsp installer" .. " failed", "error", { title = "lsp installer" .. ".lua", render = "minimal" })
	return
else
	setup_lsp.setup(servers, opts)
end

local oks = {
	["cmp"] = pcall(require, "configs.lsp.cmp"),
}

for name, item in pairs(oks) do
	local ok, _ = item
	if not ok and notif_ok then
		vim.notify(name .. " failed", "error", { title = name .. ".lua", render = "minimal" })
	end
end

return M
