--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local cmd = vim.cmd -- Execute Vim commands

require("kanagawa").setup({
	transparent = false,
})
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- cmd([[colorscheme kanagawa]])
cmd([[colorscheme tokyonight]])
-- cmd([[colorscheme tokyonight-moon]])
-- cmd([[colorscheme tokyonight-storm]])
-- cmd([[colorscheme tokyonight-night]])
-- cmd([[colorscheme catppuccin]])
-- cmd([[colorscheme nightfox]])
-- cmd([[colorscheme onedarkpro]])

-- require("github-theme").setup({
-- 	transparent = false,
-- 	dark_sidebar = false,
-- })
-- cmd([[hi! link StatusLine Normal]])

-- cmd([[colorscheme github_dark]])
