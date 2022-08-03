--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
vim.cmd([[let g:python3_host_prog="/usr/bin/python3"]])


require("impatient") --speed up start up
require("plugins") -- all plugins and some configs using packer.nvim
require("bubbles") -- custom lualine
require("mappings") -- custom mappings
require("vimplugin_setting") -- vim plugins settings
require("general_settings") -- neovim general settings
require("colorscheme") -- custom colorscheme, gitsigns and github.theme
require("luaplugin_setting") -- dashboard and orgmode configurations
require("autocmd") -- custom auto commands
require("functions") -- custom functions
require("coc") -- coc.nvim configurations and keybindings
-- vim.cmd("source $HOME/.config/nvim/settings.vim")
