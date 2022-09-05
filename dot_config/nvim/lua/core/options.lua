--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- local cmd = vim.cmd  -- Execute Vim commands
-- local exec = vim.api.nvim_exec  -- Execute Vimscript
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

opt.mouse = "a" -- Enable mouse support, a stand for all mode
opt.updatetime = 250
opt.termguicolors = true
opt.number = true -- Show line number
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.hidden = true -- Enable background buffers
opt.ruler = true
opt.cursorline = true
opt.foldenable = false
opt.incsearch = true
opt.hlsearch = true
opt.laststatus = 3
opt.pumheight = 20
opt.scrolloff = 12 -- set for signature, make sure it can always display above current line
opt.encoding = "utf-8"
opt.cmdheight = 1

-- tab behavior
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.conceallevel = 2

-- Others
opt.wildignore = "*.png,*.gif,*.jpeg,*.jpg,*.DS_Store,*.zip"
vim.g.python3_host_prog = "/usr/bin/python3.10"

-- vim.cmd([[set enc=utf-8]])
-- vim.cmd([[set spelllang=en]])
-- vim.cmd([[set nofoldenable]])
-- vim.cmd([[set foldmethod=indent]])
-- vim.cmd([[set t_Co=256]])
