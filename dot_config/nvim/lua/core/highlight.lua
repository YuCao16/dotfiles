--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-------------------
-- Utils highlight
-------------------
-- add a red line one column 80
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ffpssa131", ctermbg = 236 })
-- set windows separator to None
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", fg = "black" })
-- change float border color
vim.api.nvim_set_hl(0, "FloatBorder", {
    bg = "none",
    -- fg = "#f7bb3b", -- whatever your border color for the float is, check it with :highlight
    -- fg = "#54546D",
    -- fg = "#DCD7BA",
    fg = "#C8C093",
})
vim.api.nvim_set_hl(0, "NormalFloat", {
    bg = "none",
    fg = "none",
    -- fg = "#54546D",
})

-------------------
-- Winbar highlight
-------------------
vim.api.nvim_set_hl(0, "Winbar", { fg = "#9095a2" })
-- vim.api.nvim_set_hl(0, "Winbar", { fg = "#A3D4D5" })

-------------------
-- InlayHint highlight
-------------------
vim.api.nvim_set_hl(0, "LspInlayHint", { link = "DiagnosticHint" })

-------------------
-- Rainbow brackets
-------------------

-- For tokyonight
if vim.g.colors_name == "tokyonight" then
    local tk_colors_ok, tk_colors = pcall(require, "tokyonight.colors")
    if tk_colors_ok then
        local tokyonight_colors = tk_colors.setup({})
        vim.api.nvim_set_hl(
            0,
            "rainbowcol1",
            { fg = tokyonight_colors.blue, ctermfg = 9 }
        )
        vim.api.nvim_set_hl(
            0,
            "IncSearch",
            { fg = "#1e2030", bg = "#86c5d2", ctermfg = 9 }
        )
    else
        return
    end
end

if vim.g.colors_name == "onedark" then
    local c = require("onedark.colors")
    -- vim.api.nvim_set_hl(0, "NavicIconsFile", { link = "Directory" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = None, fg = c.bg0 })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#99a3b3" })
    vim.api.nvim_set_hl(0, "TagbarHighlight", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IncSearch", { link = "Search" })
    vim.api.nvim_set_hl(0, "SagaBorder", { bg = None, fg = "#c8c093" })
    vim.api.nvim_set_hl(
        0,
        "FinderPreviewSearch",
        { bg = "#e95678", fg = "#1f2329" }
    )
    -- vim.api.nvim_set_hl(0, "SagaBorder", { bg = None, fg="#99a3b3" })
    -- vim.api.nvim_set_hl(0, "SagaExpand", { bg = None, fg="#a0a8b7" })
    -- vim.api.nvim_set_hl(0, "SagaCollapse", { bg = None, fg="#a0a8b7" })
    vim.api.nvim_set_hl(
        0,
        "Search",
        { bg = "#99D1DB", fg = "#282c34", ctermfg = 0, ctermbg = 11 }
    )
    vim.api.nvim_set_hl(0, "rainbowcol1", { fg = "#ffd700" })
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "@constructor", { fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "@method.call", { fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "@function.call", { fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "@parameter", { fg = "#d19a66" })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#E86671" })
    vim.api.nvim_set_hl(0, "lualine_c_normal", { fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "Conceal", { fg = "#abb2bf", bg = "#282C34" })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#8094b4" })
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#abb2bf" })
    vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#abb2bf" })
    -- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#7E9CD8" })
    -- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#76946A" })
    -- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#0db9d7" })
    -- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#0db9d7" })
    -- vim.api.nvim_set_hl(
    --     0,
    --     "DiagnosticUnderlineHint",
    --     {underline=true, undercurl=true, sp="#0db9d7"}
    -- )
end

------------------------
-- Indent-Line highlight
------------------------
vim.api.nvim_set_hl(
    0,
    "IndentBlanklineIndent1",
    { fg = "#E06C75", nocombine = true }
)
vim.api.nvim_set_hl(
    0,
    "IndentBlanklineIndent2",
    { fg = "#C0A36E", nocombine = true }
)
vim.api.nvim_set_hl(
    0,
    "IndentBlanklineIndent3",
    { fg = "#76946A", nocombine = true }
)
vim.api.nvim_set_hl(
    0,
    "IndentBlanklineIndent4",
    { fg = "#6A9689", nocombine = true }
)
vim.api.nvim_set_hl(
    0,
    "IndentBlanklineIndent5",
    { fg = "#658594", nocombine = true }
)
vim.api.nvim_set_hl(
    0,
    "IndentBlanklineIndent6",
    { fg = "#957FB8", nocombine = true }
)

-------------------
-- Navic highlight
-------------------
vim.api.nvim_set_hl(0, "NavicIconsFile", { link = "Directory" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { link = "@include" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { link = "Type" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { link = "Function" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { link = "@constructor" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { link = "@boolean" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { link = "@number" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { link = "@constant" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { link = "@field" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { link = "Type" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { link = "CmpItemKindEventDefault" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { link = "@operator" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { link = "Identifier" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { link = "@constant" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { link = "@type" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { link = "@namespace" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { link = "@namespace" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { link = "@type" })
vim.api.nvim_set_hl(
    0,
    "NavicIconsProperty",
    { default = false, bg = "", fg = "#61aFeF" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsField",
    { default = false, bg = "", fg = "#55b6c2" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsEnum",
    { default = false, bg = "", fg = "#abb2bf" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsInterface",
    { default = false, bg = "", fg = "#E06c75" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsFunction",
    { default = false, bg = "", fg = "#C678DD" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsVariable",
    { default = false, bg = "", fg = "#E06c75" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsString",
    { default = false, bg = "", fg = "#98C379" }
)
vim.api.nvim_set_hl(
    0,
    "NavicIconsKey",
    { default = false, bg = "", fg = "#e5c07b" }
)
vim.api.nvim_set_hl(
    0,
    "NavicText",
    { default = false, bg = "", fg = "#9095a2" }
)
vim.api.nvim_set_hl(
    0,
    "NavicSeparator",
    { default = false, bg = "", fg = "#9095a2" }
)
-- vim.api.nvim_set_hl(0, "NavicIconsFile", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsModule", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsClass", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsArray", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsObject", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = false, bg = "", fg = "#ffffff" })
-- vim.api.nvim_set_hl(0, "NavicIconsNull", { default = false, bg = "", fg = "#ffffff" })
