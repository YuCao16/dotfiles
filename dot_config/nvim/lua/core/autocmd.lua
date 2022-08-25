--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
-- quick exit from dashboard
local dashboard = vim.api.nvim_create_augroup("dashboard", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dashboard" },
	command = "nnoremap <buffer> <down> j && nnoremap <buffer> <up> k",
	group = dashboard,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dashboard" },
	command = "nnoremap <buffer> q :lua Handle_dashboard()<CR>",
	group = dashboard,
})

-- Update signature help on jump placeholder
local cocautocmd = vim.api.nvim_create_augroup("cocautocmd", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "CocJumpPlaceholder",
	command = "call CocActionAsync('showSignatureHelp') <cr>",
	group = cocautocmd,
})

-- config toggleterm
local toggleterm = vim.api.nvim_create_augroup("toggleterm", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "toggleterm",
	command = "nnoremap <buffer> q :q<cr>",
	group = cocautocmd,
})

-- auto config scrollbar
local ScrollbarInit = vim.api.nvim_create_augroup("ScrollbarInit", { clear = true })
vim.api.nvim_create_autocmd({ "WinScrolled", "VimResized", "QuitPre", "WinEnter", "FocusGained" }, {
	pattern = "*",
	command = "silent! lua require('scrollbar').show()",
	group = ScrollbarInit,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "BufWinLeave", "FocusLost" }, {
	pattern = "*",
	command = "silent! lua require('scrollbar').clear()",
	group = ScrollbarInit,
})

local tabstop = vim.api.nvim_create_augroup("tabstop", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab",
	group = tabstop,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "vim", "lua", "journal", "cpp", "cc", "c", "htmldjango" },
	command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4",
	group = tabstop,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "css", "xml", "json", "html", "js", "javascript" },
	command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
	group = tabstop,
})

-- config for vim-jupyter, convert *.ipynb to markdown
local jupytext = vim.api.nvim_create_augroup("jupytext", { clear = true })
vim.api.nvim_create_autocmd(
	{ "FileType", "BufNewFile", "BufFilePre", "BufRead", "BufCreate" },
	{ pattern = { "*.ipynb" }, command = "set filetype=tex", group = jupytext }
)
vim.api.nvim_create_autocmd(
	"BufCreate",
	{ pattern = { "*.ipynb" }, command = "set filetype=markdown", group = jupytext }
)

-- basic settings for python and markdown
local textwidth = vim.api.nvim_create_augroup("textwidth", { clear = true })
local python = vim.api.nvim_create_augroup("python", { clear = true })
vim.api.nvim_create_autocmd(
	"FileType",
	{ pattern = { "markdown", "latex", "tex" }, command = "set textwidth=80", group = textwidth }
)
vim.api.nvim_create_autocmd("FileType", { pattern = "python", command = "set colorcolumn=80", group = python })

-- This line map run python with <,2> and close python shell after running
local nvimrun = vim.api.nvim_create_augroup("python", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	command = "map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>",
	group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"js", "javascript"},
	command = "map <buffer> <leader>2 :w<CR>:exec '!node' shellescape(@%, 1)<CR>",
	group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cc","cpp","c"},
	-- command = "map <buffer> <leader>2 :w<CR>:!g++ -std=c++11 linalg.cpp -ldlib -o out && ./out<CR>",
	command = "map <buffer> <leader>2 :w<CR>:exec '!g++ -std=c++11' shellescape(@%, 1) '-ldlib -o out && ./out'<CR>",
	group = nvimrun,
})

-- quit nvimtree if it's the only buffer left
local nvimtree = vim.api.nvim_create_augroup("nvimtree", { clear = true })
vim.api.nvim_create_autocmd(
	"bufenter",
	{ pattern = "*", command = 'if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif', group = nvimtree }
)

-- highlight yank use build in command
-- vim.cmd([[
-- augroup highlight_yank
-- 	autocmd!
-- 	au TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=750}
-- augroup END
-- ]])
-- vim.cmd([[
-- autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=750}
-- ]])
-- vim.cmd([[
-- augroup highlight_yank
--     autocmd!
--     au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=800 }
-- augroup END
-- ]])

-- basic settings for python and markdown
-- vim.cmd([[
-- autocmd FileType python set colorcolumn=80
-- autocmd FileType markdown set textwidth=80
-- ]])

-- autocmd for filetype settings
-- vim.cmd([[
-- autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
-- autocmd FileType tex setlocal shiftwidth=4 tabstop=4 softtabstop=4
-- autocmd FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
-- autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4
-- autocmd FileType json setlocal shiftwidth=4 tabstop=4 softtabstop=4
-- autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
-- autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
-- autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
-- autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
-- autocmd FileType journal setlocal shiftwidth=4 tabstop=4 softtabstop=4
-- ]])

-- quit nvimtree if it's the only buffer left
-- vim.cmd([[
-- autocmd bufenter * if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif
-- ]])

-- This line map run python with <,2> and close python shell after running
-- vim.cmd([[
-- autocmd FileType python map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
-- ]])

-- Missing the best setup Plugin
-- vim.cmd([[
-- autocmd FileType startify :lua require"nvim-tree".toggle(false, true)
-- ]])

-- quick exit from dashboard
-- vim.cmd([[
-- autocmd FileType dashboard nnoremap <buffer> q :lua Handle_dashboard()<CR>
-- autocmd FileType dashboard nnoremap <buffer> <up> k
-- autocmd FileType dashboard nnoremap <buffer> <down> j
-- ]])

-- Update signature help on jump placeholder
-- vim.cmd([[
-- augroup cocautocmd
-- 	autocmd!
-- 	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
-- augroup end
-- ]])

-- config toggleterm
-- vim.cmd([[
-- autocmd FileType toggleterm nnoremap <buffer> <ESC> :q<cr>
-- tnoremap <silent> <ESC> <C-\><C-n>
-- ]])

-- auto config scrollbar
-- vim.cmd([[
-- augroup ScrollbarInit
--   autocmd!
--   autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
--   autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
--   autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
-- augroup end
-- ]])

-- config for vim-jupyter, convert *.ipynb to markdown
-- vim.cmd([[
-- autocmd FileType,BufNewFile,BufFilePre,BufRead *.ipynb set filetype=tex
-- autocmd BufCreate *.ipynb set filetype=tex
-- autocmd BufCreate *.ipynb set filetype=markdown
-- ]])
