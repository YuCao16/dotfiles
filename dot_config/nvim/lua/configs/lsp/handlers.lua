--=====================================================
-- LSP handlers settings
--=====================================================

-- Ensure safely requrie dependencies
local mason_exists, mason = pcall(require, "mason")
local mason_lspconfig_exists, mason_lspconfig =
    pcall(require, "mason-lspconfig")
local nvim_lsp_exists, nvim_lsp = pcall(require, "lspconfig")
local navic_exists, navic = pcall(require, "nvim-navic")

-- check if lspconfig ok, if so, set LspInfo border to rounded
-- if not ok, then stop loading
if not nvim_lsp_exists then
    vim.notify(
        "LSP config failed to setup",
        vim.log.levels.INFO,
        { render = "minimal" }
    )
    return
else
    require("lspconfig.ui.windows").default_options.border = "rounded"
end

-- check if other required plugins ok, if not won't return
if not (mason_exists and mason_lspconfig_exists and navic_exists) then
    vim.notify(
        "Error when loading handlers dependencies",
        "error",
        { render = "minimal" }
    )
end

-- List of servers support navic
local ensure_installed = require("configs.lsp.config").navic_server_list

-- lsp handler
local on_attach = require("configs.lsp.config").on_attach

-- lsp settings
local server_settings = {
    tsserver = require("configs.lsp.settings.tsserver"),
    jedi_language_server = require("configs.lsp.settings.jedi"),
    sourcery = require("configs.lsp.settings.sourcery"),
    sumneko_lua = require("configs.lsp.settings.sumneko_lua"),
    pyright = require("configs.lsp.settings.pyright"),
}

-- setup on_attach and capabilities
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
    }
    -- nvim-cmp supports additional completion capabilities
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    return {
        -- include enable snippet support, etc
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

-- setup Mason.nvim
if mason_exists then
    mason_opt = require("configs.mason")
    mason.setup(mason_opt)
end

-- load lsp by mason.lspconfig
if mason_lspconfig_exists then
    mason_lspconfig.setup({
        ensure_installed = ensure_installed,
        automatic_installation = true,
    })
    mason_lspconfig.setup_handlers({
        function(server_name)
            local config = make_config()
            local has_settings = server_settings[server_name] ~= nil
            local current_server_settings = vim.tbl_deep_extend(
                "force",
                has_settings and server_settings[server_name] or {},
                config
            )
            if server_name == "sumneko_lua" then
                -- lua_dev_exist, lua_dev = pcall(require, "lua-dev")
                lua_dev_exist, lua_dev = pcall(require, "neodev")
                if lua_dev_exist then
                    lua_dev.setup({
                        override = function(root_dir, library)
                            library.enabled = false
                            library.plugins = false
                        end,
                    })
                else
                    vim.notify(
                        "lua-dev load failed",
                        "Error",
                        { render = "minimal" }
                    )
                end
            elseif server_name == "rust_analyzer" then
                rt_opts = require("configs.rust_tools").opts
                rt_opts.server.on_attach = on_attach
                rt_opts.server.capabilities = capabilities
                rt_ok, rt = pcall(require, "rust-tools")
                if rt_ok then
                    rt.setup(rt_opts)
                    return
                else
                    vim.notify("rust-tools load failed")
                end
            end
            nvim_lsp[server_name].setup(current_server_settings)
        end,
    })
end

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
