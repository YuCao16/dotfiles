--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- add a red line one column 80
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ff3131", ctermbg = 236 })

-- set windows separator to None
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })

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
-- Navic highlight
-------------------
vim.api.nvim_set_hl(0, "NavicIconsFile", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = false, bg = "", fg = "#61aFeF" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = false, bg = "", fg = "#55b6c2" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = false, bg = "", fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = false, bg = "", fg = "#E06c75" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = false, bg = "", fg = "#C678DD" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = false, bg = "", fg = "#E06c75" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = false, bg = "", fg = "#98C379" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = false, bg = "", fg = "#e5c07b" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = false, bg = "", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NavicText", { default = false, bg = "", fg = "#9095a2" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = false, bg = "", fg = "#9095a2" })
