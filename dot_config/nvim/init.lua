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
-- vim.cmd("source $HOME/.config/nvim/settings.vim")
require("vimplug_settings") -- vim plugins settings
require("general_settings") -- neovim general settings
require("colorscheme") -- custom colorscheme, gitsigns and github.theme
require("load_plugins") -- dashboard and orgmode configurations
require("autocmd") -- custom auto commands
require("functions") -- custom functions
require("coc")
