-- LSP settings
local nvim_lsp_exists, nvim_lsp = pcall(require, "lspconfig")

-- Pulling out things from
local diagnostic = vim.diagnostic
local lsp = vim.lsp

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
	-- Setup handlers
	lsp_handlers()

	-- GENERAL
	client.config.flags.allow_incremental_sync = true

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- keybindings
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>go", ":SymbolsOutline<CR>", { noremap = false, silent = false })
	buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>', opts)
	buf_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>', opts)

	-- buf_set_keymap("n", "<tab>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- buf_set_keymap("n", "C-k", "<cmd>lua vim.lsp.signature_help()", opts)
	-- buf_set_keymap("n", "<leader>LD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	-- buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.diagnostic.setloclist()<CR>", opts)
	-- buf_set_keymap("n", "<leader>lp", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<leader>lwd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)

	-- Custome Command
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})

	-- AutoCmd
	local lspLineDiagnosticsGroup = vim.api.nvim_create_augroup("LspLineDiagnostics", { clear = true })
	vim.api.nvim_create_autocmd("CursorHold", {
		group = lspLineDiagnosticsGroup,
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
	if client.resolved_capabilities.documentFormattingProvider then
		vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "SpecialKey" })
		vim.api.nvim_set_hl(0, "LspReferenceText", { link = "SpecialKey" })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "SpecialKey" })

		local lspDocumentHighlightGroup = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			group = lspDocumentHighlightGroup,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
			buffer = 0,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved" }, {
			group = lspDocumentHighlightGroup,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
			buffer = 0,
		})
	end

	if client.resolved_capabilities.codeLensProvider then
		local lspCodeLensGroup = vim.api.nvim_create_augroup("LspCodeLens", { clear = true })
		vim.api.nvim_create_autocmd({ "CursorHold", "BufEnter", "InsertLeave" }, {
			group = lspCodeLensGroup,
			callback = function()
				vim.lsp.codelens.refresh()
			end,
			buffer = 0,
		})
	end

	-- try virtual type
	-- require("virtualtypes").on_attach(client, bufnr)

	if client.name == "pyright" then
		client.resolved_capabilities.hover = false
		-- client.server_capabilities.hover = false
	end
end

local server_settings = {
	tsserver = require("configs.lsp.settings.tsserver"),
	pyright = require("configs.lsp.settings.pyright"),
	jedi_language_server = require("configs.lsp.settings.jedi"),
	-- pylsp = require("configs.lsp.settings.pylsp"),
	sumneko_lua = require("configs.lsp.settings.sumneko_lua"),
}

local function make_config()
	local capabilities = lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
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

local mason_exists, mason = pcall(require, "mason")
local mason_lspconfig_exists, mason_lspconfig = pcall(require, "mason-lspconfig")

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
-- require'nvim_lsp'.ocamllsp.setup{on_attach=require'virtualtypes'.on_attach}

if mason_lspconfig_exists then
	mason_lspconfig.setup()
	mason_lspconfig.setup_handlers({
		function(server_name)
			local config = make_config()
			local has_settings = server_settings[server_name] ~= nil
			local current_server_settings =
				vim.tbl_deep_extend("force", has_settings and server_settings[server_name] or {}, config)

			nvim_lsp[server_name].setup(current_server_settings)

			if server_name == "sumneko_lua" then
				require("lua-dev").setup(current_server_settings)
			end
		end,
	})
end

-- example to load a nonexist lsp
-- if nvim_lsp_exists then
-- 	nvim_lsp.jedi_language_server.setup({
-- 		on_attach = on_attach,
-- 	})
-- end

return M
