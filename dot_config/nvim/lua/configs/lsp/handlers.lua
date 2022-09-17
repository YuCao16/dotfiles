--=====================================================
-- LSP handlers settings
--=====================================================

-- Ensure safely requrie dependencies
local mason_exists, mason = pcall(require, "mason")
local mason_lspconfig_exists, mason_lspconfig = pcall(require, "mason-lspconfig")
local nvim_lsp_exists, nvim_lsp = pcall(require, "lspconfig")
local navic_exists, navic = pcall(require, "nvim-navic")
local inlayhints_exists, inlayhints = pcall(require, "lsp-inlayhints")

if not (nvim_lsp_exists and mason_exists and mason_lspconfig_exists and navic_exists) then
	vim.notify("Error when loading handlers dependencies", "error", { render = "minimal" })
end

-- setup inlay hint, auto toggle config in core.autocmd.lua
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
	"bashls",
	"julials",
	"yamlls",
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
	-- LspInfo rounded border
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
	-- lspSymbol("Error", "")
	-- lspSymbol("Info", "")
	-- lspSymbol("Hint", "")
	-- lspSymbol("Warn", "")

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
	buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)
	buf_set_keymap("n", "<leader>go", ":symbolsoutline<CR>", { noremap = false, silent = false })

	-- custome command
	vim.api.nvim_create_user_command("Format", ":lua vim.lsp.buf.format { async = true }<CR>", {})

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
		end,
	})

	if client.server_capabilities.codelensprovider then
		local lspcodelensgroup = vim.api.nvim_create_augroup("lspcodelens", { clear = true })
		vim.api.nvim_create_autocmd({ "cursorhold", "bufenter", "insertleave" }, {
			group = lspcodelensgroup,
			callback = function()
				vim.lsp.codelens.refresh()
				vim.notify("codelens refreshed")
			end,
			buffer = 0,
		})
	end

	if support_navic(navic_server_list, client.name) then
		navic.attach(client, bufnr)
		require("configs.navic").show_winbar()
		inlayhints.on_attach(client, bufnr)
	end

	if client.name == "pyright" then
		-- I have to say, sometimes, pyright is shit!
		client.server_capabilities.hoverProvider = false
		client.server_capabilities.signatureHelpProvider = false
	elseif client.name == "jedi_language_server" then
		client.server_capabilities.completionProvider = false
	end
end

local server_settings = {
	tsserver = require("configs.lsp.settings.tsserver"),
	jedi_language_server = require("configs.lsp.settings.jedi"),
	sourcery = require("configs.lsp.settings.sourcery"),
	sumneko_lua = require("configs.lsp.settings.sumneko_lua"),
	pyright = require("configs.lsp.settings.pyright"),
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

-- setup Mason.nvim
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

-- setup lua-dev
lua_dev_exist, lua_dev = pcall(require, "lua-dev")
if lua_dev_exist then
	lua_dev.setup({
		override = function(root_dir, library)
			library.enabled = false
			library.plugins = false
		end,
	})
else
	vim.notify("lua-dev load failed", "Error", { render = "minimal" })
end

-- load lsp by mason.lspconfig
if mason_lspconfig_exists then
	mason_lspconfig.setup({
		ensure_installed = navic_server_list,
		automatic_installation = true,
	})
	mason_lspconfig.setup_handlers({
		function(server_name)
			local config = make_config()
			local has_settings = server_settings[server_name] ~= nil
			local current_server_settings =
				vim.tbl_deep_extend("force", has_settings and server_settings[server_name] or {}, config)
			nvim_lsp[server_name].setup(current_server_settings)
		end,
	})
end

return M

-- in on_attach function
-- underline highlight, should be deprecated since it will keep flesh
-- if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_set_hl(0, "lspreferenceread", { link = "specialkey" })
--     vim.api.nvim_set_hl(0, "lspreferencetext", { link = "specialkey" })
--     vim.api.nvim_set_hl(0, "lspreferencewrite", { link = "specialkey" })
--
--     local lspdocumenthighlightgroup = vim.api.nvim_create_augroup("lspdocumenthighlight", { clear = true })
--     vim.api.nvim_create_autocmd({ "CursorMoved" }, {
--         group = lspdocumenthighlightgroup,
--         callback = function()
--             vim.lsp.buf.clear_references()
--         end,
--         buffer = 0,
--     })
--     vim.api.nvim_create_autocmd({ "CursorHold" }, {
--         group = lspdocumenthighlightgroup,
--         callback = function()
--             vim.lsp.buf.document_highlight()
--         end,
--         buffer = 0,
--     })
-- end

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
