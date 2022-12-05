--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local cmd = vim.cmd -- Execute Vim commands

-- require("kanagawa").setup({
--     transparent = false,
-- })
require("onedark").setup({
    highlights = {
        MatchParen = { bg = "#727169" },
    },
})
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- cmd([[colorscheme kanagawa]])
-- cmd([[colorscheme tokyonight]])
cmd([[colorscheme onedark]])
-- cmd([[colorscheme zenbones]])
-- cmd([[colorscheme tokyonight-moon]])
-- cmd([[colorscheme tokyonight-night]])
-- cmd([[colorscheme catppuccin]])

-- require("github-theme").setup({
-- 	transparent = false,
-- 	dark_sidebar = false,
-- })
-- cmd([[hi! link StatusLine Normal]])

-- cmd([[colorscheme github_dark]])
