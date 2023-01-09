local symbol_outline_ok, symbol_outline = pcall(require, "symbols-outline")
if not symbol_outline_ok then
    vim.notify("symbols-outline failed", "error", { render = "minimal" })
    return
end

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = "right",
    relative_width = true,
    width = 15,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    wrap = false,
    -- preview_bg_highlight = "Pmenu",
    preview_bg_highlight = "NormalFloat",
    autofold_depth = 2,
    auto_unfold_hover = true,
    fold_markers = { "", "" },
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "FW",
        unfold_all = "E",
        fold_reset = "R",
    },
    -- lsp_blacklist = { "python-lsp-server", "pylsp", "jedi_language_server" },
    lsp_blacklist = { "python-lsp-server", "pylsp", "pyright" },
    symbol_blacklist = {},
    symbols = {
        File = { icon = " ", hl = "@text.uri" },
        Module = { icon = " ", hl = "@namespace" },
        Namespace = { icon = " ", hl = "@namespace" },
        Package = { icon = " ", hl = "@namespace" },
        Class = { icon = "ﴯ ", hl = "@type" },
        Method = { icon = "ƒ ", hl = "@method" },
        Property = { icon = " ", hl = "@method" },
        Field = { icon = " ", hl = "@field" },
        Constructor = { icon = " ", hl = "@constructor" },
        Enum = { icon = "ℰ ", hl = "@type" },
        Interface = { icon = "ﰮ ", hl = "@type" },
        Function = { icon = "ƒ ", hl = "@function" },
        Variable = { icon = " ", hl = "@constant" },
        Constant = { icon = " ", hl = "@constant" },
        String = { icon = "𝓐 ", hl = "@string" },
        Number = { icon = "# ", hl = "@number" },
        Boolean = { icon = "⊨ ", hl = "@boolean" },
        Array = { icon = " ", hl = "@constant" },
        Object = { icon = "⦿ ", hl = "@type" },
        Key = { icon = " ", hl = "@type" },
        Null = { icon = "NULL ", hl = "@type" },
        EnumMember = { icon = " ", hl = "@field" },
        Struct = { icon = " ", hl = "@type" },
        Event = { icon = " ", hl = "@type" },
        Operator = { icon = "+ ", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
    },
}
symbol_outline.setup(opts)
-- nnoremap("<leader>sm", "<cmd>SymbolsOutline<CR>", { desc = "Open symbols outline" })
