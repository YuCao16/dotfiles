-- setup inlayhint
local M = {}
local inlayhints_exists, inlayhints = pcall(require, "lsp-inlayhints")
opt = require("configs.inlay_hint").configs
inlayhints.setup(opt)

M.navic_server_list = {
    "jedi_language_server",
    "rust_analyzer",
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
    "taplo",
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

-- Setup basic lsp utils such as lspSymbol and border style
local lsp_handlers = function()
    local diagnostic = vim.diagnostic
    local lsp = vim.lsp

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

    local popup_opts =
        { border = "rounded", max_width = 80, silent = false, focusable = true }
    local popup_opts_f = {
        border = "rounded",
        max_width = 80,
        silent = false,
        focusable = false,
    }

    lsp.handlers["textDocument/hover"] =
        lsp.with(lsp.handlers.hover, popup_opts)
    lsp.handlers["textDocument/signatureHelp"] =
        lsp.with(lsp.handlers.hover, popup_opts)

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

M.on_attach = function(client, bufnr)
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

    buf_set_keymap(
        "n",
        "<leader>gd",
        "<cmd>lua vim.lsp.buf.definition()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<leader>gr",
        "<cmd>lua vim.lsp.buf.references()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<leader>gs",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "<leader>gq",
        "<cmd>lua vim.diagnostic.setqflist()<CR>",
        opts
    )
    buf_set_keymap(
        "n",
        "[d",
        '<cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>',
        opts
    )
    buf_set_keymap(
        "n",
        "]d",
        '<cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>',
        opts
    )
    buf_set_keymap(
        "n",
        "<leader>go",
        ":symbolsoutline<CR>",
        { noremap = false, silent = false }
    )
    if client.name == "rust_analyzer" then
        vim.keymap.set(
            "n",
            "<Leader>gh",
            require("rust-tools").hover_actions.hover_actions,
            { buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "<Leader>ga",
            require("rust-tools").code_action_group.code_action_group,
            { buffer = bufnr }
        )
    end

    -- custome command
    vim.api.nvim_create_user_command(
        "Format",
        ":lua vim.lsp.buf.format { async = true }<CR>",
        {}
    )

    -- autocmd
    local lsplinediagnosticsgroup =
        vim.api.nvim_create_augroup("lsplinediagnostics", { clear = true })
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
        local lspcodelensgroup =
            vim.api.nvim_create_augroup("lspcodelens", { clear = true })
        vim.api.nvim_create_autocmd({ "cursorhold", "bufenter", "insertleave" }, {
            group = lspcodelensgroup,
            callback = function()
                vim.lsp.codelens.refresh()
                vim.notify("codelens refreshed")
            end,
            buffer = 0,
        })
    end

    if support_navic(M.navic_server_list, client.name) then
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

return M
