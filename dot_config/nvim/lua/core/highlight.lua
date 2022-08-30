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

-- config CocSearch and CocMenuSel
-- vim.api.nvim_set_hl(0, "CocSearch", { bg = "#13354A", ctermbg = 12 })
-- vim.api.nvim_set_hl(0, "CocMenuSel", { bg = "#13354A", ctermbg = 109 })
