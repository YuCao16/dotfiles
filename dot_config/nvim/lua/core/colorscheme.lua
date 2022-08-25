local cmd = vim.cmd -- Execute Vim commands

require("kanagawa").setup({
	transparent = false,
})
cmd([[colorscheme kanagawa]])

-- require("github-theme").setup({
-- 	transparent = false,
-- 	dark_sidebar = false,
-- })
-- vim.g.catppuccin_flavour = "mocha"
-- cmd([[hi! link StatusLine Normal]])
