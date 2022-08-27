local M = {}

function M.setup(servers, options)
	local lspconfig = require("lspconfig")

	-- nvim-lsp-installer must be set up before nvim-lspconfig
	require("mason").setup({
		automatic_installation = false,
	})

	-- Set up LSP servers
	for server_name, _ in pairs(servers) do
		local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})

		if server_name == "sumneko_lua" then
			opts = require("lua-dev").setup({ lspconfig = opts })
		end

		if server_name == "tsserver" then
		else
			lspconfig[server_name].setup(opts)
		end
	end
end

return M
