--=====================================================
-- LSP handlers settings
--=====================================================

-- Ensure safely requrie dependencies
local nvim_lsp_exists, nvim_lsp = pcall(require, "lspconfig")
local mason_exists, mason = pcall(require, "mason")
local mason_lspconfig_exists, mason_lspconfig = pcall(require, "mason-lspconfig")
local navic_exists, navic = pcall(require, "nvim-navic")
local inlayhints_exists, inlayhints = pcall(require, "lsp-inlayhints")
local lua_dev_exists, lua_dev = pcall(require, "lua-dev")

if not (nvim_lsp_exists and mason_exists and mason_lspconfig_exists and navic_exists) then
	vim.notify("Error when loading handlers dependencies", "error", { render = "minimal" })
end

-- setup inlay hint
opt = require("configs.inlay_hint").configs
inlayhints.setup(opt)

-- Pulling out things from
local diagnostic = vim.diagnostic
local lsp = vim.lsp

-- List of servers
local navic_server_list = {
	"jedi_language_server",
	"marksman",
	"texlab",
	"sumneko_lua",
	"gopls",
	"tsserver",
	"jsonls",
	"clangd",
	"html",
	"cssls",
	"tailwindcss",
	"bashls",
	"julials",
}

-- Check if current lsp supports document syntax
local function support_navic(server_list, server_name)
	for index, value in ipairs(server_list) do
		if value == server_name then
			return true
		end
	end

	return false
end

if not nvim_lsp_exists then
	vim.notify("LSP config failed to setup", vim.log.levels.INFO, { title = ":: Local ::" })
	return
else
	-- Lspinfo rounded border
	require("lspconfig.ui.windows").default_options.border = "rounded"
end

local M = {}

-- TODO: backfill this to template
local lsp_handlers = function()
	local function lspSymbol(name, icon)
		local hl = "DiagnosticSign" .. name
		vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
	end

	lspSymbol("Error", "")
	lspSymbol("Info", "")
	lspSymbol("Hint", "")
	lspSymbol("Warn", "")

	local popup_opts = { border = "rounded", max_width = 80, silent = false, focusable = true }
	local popup_opts_f = { border = "rounded", max_width = 80, silent = false, focusable = false }

	lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, popup_opts)
	lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.hover, popup_opts)

	diagnostic.config({
		virtual_text = false,
		signs = true,
		underline = true,
		severity_sort = true,
		update_in_insert = false, -- update diagnostics insert mode
		float = {
			focusable = false,
			-- style = "minimal",
			border = "rounded",
			source = "always",
			header = "🙀Diagnostics:",
			prefix = "",
		},
	})
end

local on_attach = function(client, bufnr)
	-- setup handlers
	lsp_handlers()

	-- general
	client.config.flags.allow_incremental_sync = true

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- keybindings
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>go", ":symbolsoutline<CR>", { noremap = false, silent = false })
	buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)

	-- custome command
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})

	-- autocmd
	local lsplinediagnosticsgroup = vim.api.nvim_create_augroup("lsplinediagnostics", { clear = true })
	vim.api.nvim_create_autocmd("cursorhold", {
		group = lsplinediagnosticsgroup,
		pattern = "*",
		callback = function()
			-- if change scope to "line", then diagnostic will toggle the whole line
			vim.diagnostic.open_float(0, {
				scope = "cursor",
				focusable = false,
			})
			-- if using lspsaga
			-- require'lspsaga.diagnostic'.show_cursor_diagnostics()
		end,
	})

	-- underline highlight
	if client.server_capabilities.documentformattingprovider then
		vim.api.nvim_set_hl(0, "lspreferenceread", { link = "specialkey" })
		vim.api.nvim_set_hl(0, "lspreferencetext", { link = "specialkey" })
		vim.api.nvim_set_hl(0, "lspreferencewrite", { link = "specialkey" })

		local lspdocumenthighlightgroup = vim.api.nvim_create_augroup("lspdocumenthighlight", { clear = true })
		vim.api.nvim_create_autocmd({ "cursormoved" }, {
			group = lspdocumenthighlightgroup,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			buffer = 0,
		})
		vim.api.nvim_create_autocmd({ "cursorhold" }, {
			group = lspdocumenthighlightgroup,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
			buffer = 0,
		})
	end

	if client.server_capabilities.codelensprovider then
		local lspcodelensgroup = vim.api.nvim_create_augroup("lspcodelens", { clear = true })
		vim.api.nvim_create_autocmd({ "cursorhold", "bufenter", "insertleave" }, {
			group = lspcodelensgroup,
			callback = function()
				vim.lsp.codelens.refresh()
			end,
			buffer = 0,
		})
	end

	-- try virtual type by rarely supported by lsp
	-- require("virtualtypes").on_attach(client)

	if support_navic(navic_server_list, client.name) then
		navic.attach(client, bufnr)
		require("configs.navic").show_winbar()
	end

	if client.name == "pyright" then
		-- I have to say, sometimes, pyright is shit!
		client.server_capabilities.hoverProvider = false
		client.server_capabilities.signatureHelpProvider = false
		-- client.server_capabilities.completionProvider = false
	elseif client.name == "jedi_language_server" then
		client.server_capabilities.completionProvider = false
	elseif client.name == "clangd" then
		inlayhints.on_attach(client, bufnr)
	end
end

local server_settings = {
	tsserver = require("configs.lsp.settings.tsserver"),
	jedi_language_server = require("configs.lsp.settings.jedi"),
	sourcery = require("configs.lsp.settings.sourcery"),
	sumneko_lua = require("configs.lsp.settings.sumneko_lua"),
	pyright = require("configs.lsp.settings.pyright"),
	-- pylsp = require("configs.lsp.settings.pylsp"),
}

local function make_config()
	local capabilities = lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
	}

	-- nvim-cmp supports additional completion capabilities
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

	return {
		-- enable snippet support
		capabilities = capabilities,

		-- map buffer local keybindings when the language server attaches
		on_attach = on_attach,
	}
end

if mason_exists then
	mason.setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		log_level = vim.log.levels.DEBUG,
	})
end

if mason_lspconfig_exists then
	mason_lspconfig.setup({
		ensure_installed = {
			"sumneko_lua",
			"clangd",
			"pyright",
		},
	})
	mason_lspconfig.setup_handlers({
		function(server_name)
			local config = make_config()
			local has_settings = server_settings[server_name] ~= nil
			local current_server_settings =
				vim.tbl_deep_extend("force", has_settings and server_settings[server_name] or {}, config)

			-- nvim_lsp[server_name].setup(current_server_settings)

			if server_name == "sumneko_lua" then
				if lua_dev_exists then
					local luadev = lua_dev.setup({
						lspconfig = {
							on_attach = current_server_settings.on_attach,
							capabilities = current_server_settings.capabilities,
							settings = current_server_settings.settings,
						},
					})
					nvim_lsp.sumneko_lua.setup(luadev)
				else
					vim.notify("lua-dev load failed", "error", { render = "minimal" })
					nvim_lsp[server_name].setup(current_server_settings)
				end
			else
				nvim_lsp[server_name].setup(current_server_settings)
			end
		end,
	})
end

return M
-- example to load a nonMason lsp
-- if nvim_lsp_exists then
-- 	nvim_lsp.jedi_language_server.setup({
-- 		on_attach = on_attach,
-- 	})
-- end

-- buf_set_keymap("n", "<tab>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- buf_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- buf_set_keymap("n", "c-k", "<cmd>lua vim.lsp.signature_help()", opts)
-- buf_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.diagnostic.setloclist()<CR>", opts)
-- buf_set_keymap("n", "<leader>lp", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- buf_set_keymap("n", "<leader>lwd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--
-- function make_config()
-- capabilities.textDocument.completion.completionItem = {
-- 	documentationFormat = { "markdown", "plaintext" },
-- 	snippetSupport = true,
-- 	preselectSupport = true,
-- 	insertReplaceSupport = true,
-- 	labelDetailsSupport = true,
-- 	deprecatedSupport = true,
-- 	commitCharactersSupport = true,
-- 	tagSupport = { valueSet = { 1 } },
-- 	resolveSupport = {
-- 		properties = {
-- 			"documentation",
-- 			"detail",
-- 			"additionalTextEdits",
-- 		},
-- 	},
-- }
