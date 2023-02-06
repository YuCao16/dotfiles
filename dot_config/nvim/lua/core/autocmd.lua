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

-- mapping for Vista.vim
local vista = vim.api.nvim_create_augroup("vista", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "vista",
    command = "map <buffer> o <CR>",
    group = vista,
})

-- quick exit from lspsaga
local lspsaga = vim.api.nvim_create_augroup("lspsaga", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    -- pattern = { "lspsagaoutline", "notify", "qf" },
    pattern = { "lspsagaoutline" },
    command = "nnoremap <buffer> q :Lspsaga outline<CR>",
    group = lspsaga,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "notify", "qf" },
    command = "nnoremap <buffer> q :q<CR>",
    group = lspsaga,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sagacodeaction", "nil", "nofile", "notify" },
    command = "nnoremap <buffer> <ESC> :q<CR>",
    group = lspsaga,
})

-- quick exit from toggleterm
local quickexit = vim.api.nvim_create_augroup("toggleterm", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "toggleterm" },
    command = "nnoremap <buffer> q :q<CR>",
    group = quickexit,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "TelescopePrompt" },
    command = "nnoremap <buffer> q :normal! <C-[><CR>",
    group = quickexit,
})

-- auto config scrollbar
local ScrollbarInit =
    vim.api.nvim_create_augroup("ScrollbarInit", { clear = true })
vim.api.nvim_create_autocmd(
    { "WinScrolled", "VimResized", "QuitPre", "WinEnter", "FocusGained" },
    {
        pattern = "*",
        command = "silent! lua require('scrollbar').show()",
        group = ScrollbarInit,
    }
)
vim.api.nvim_create_autocmd(
    { "WinLeave", "BufLeave", "BufWinLeave", "FocusLost" },
    {
        pattern = "*",
        command = "silent! lua require('scrollbar').clear()",
        group = ScrollbarInit,
    }
)

-- tabstop for filetypes
local tabstop = vim.api.nvim_create_augroup("tabstop", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab",
    group = tabstop,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex", "vim", "lua", "journal", "cpp", "c" },
    command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4",
    group = tabstop,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "css", "json", "html", "javascript" },
    command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
    group = tabstop,
})
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber",
    group = tabstop,
})

-- basic settings for latex and markdown
local textwidth = vim.api.nvim_create_augroup("textwidth", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "latex", "tex" },
    command = "setlocal textwidth=80",
    group = textwidth,
})

-- colorcolumn for programming language file type
local colorcolumn = vim.api.nvim_create_augroup("colorcolumn", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "python",
        "rust",
        "cpp",
        "lua",
        "javascript",
        "html",
        "css",
        "markdown",
        "tex",
    },
    command = "setlocal colorcolumn=80",
    group = colorcolumn,
})

-- This line map run python with <,2> and close python shell after running
local nvimrun = vim.api.nvim_create_augroup("nvimrun", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    command = "map <buffer> <leader>f :Format<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "map <buffer> <leader>f :Format<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    command = "map <buffer> <leader>2 :RustRun<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "js", "javascript" },
    command = "map <buffer> <leader>2 :w<CR>:exec '!node' shellescape(@%, 1)<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp" },
    command = "map <buffer> <leader>3 :w<CR>:exec '!./run.sh'<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    command = "map <buffer> <leader>2 :w<CR>:exec '!go run' shellescape(@%, 1)<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua" },
    command = "map <buffer> <leader>2 :w<CR>:exec '!lua' shellescape(@%, 1)<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "julia" },
    command = "map <buffer> <leader>2 :w<CR>:exec '!julia' shellescape(@%, 1)<CR>",
    group = nvimrun,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cc", "cpp", "c" },
    -- command = "map <buffer> <leader>2 :w<CR>:!g++ -std=c++11 linalg.cpp -ldlib -o out && ./out<CR>",
    -- command = "map <buffer> <leader>2 :w<CR>:exec '!g++ -std=c++11' shellescape(@%, 1) '-ldlib -o out && ./out'<CR>",
    command = "map <buffer> <leader>2 :w<CR>:exec '!clang++ -std=c++11' shellescape(@%, 1) '-o out && ./out'<CR>",
    group = nvimrun,
})

-- quit nvimtree/vista if it's the only buffer left
local lastwin = vim.api.nvim_create_augroup("lastwin", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = 'if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif',
    group = lastwin,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = 'if (winnr("$") == 1 && &filetype == "vista") | q | endif',
    group = lastwin,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = 'if (winnr("$") == 1 && &filetype == "vista_markdown") | q | endif',
    group = lastwin,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = 'if (winnr("$") == 1 && &filetype == "VistaNvim") | q | endif',
    group = lastwin,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = 'if (winnr("$") == 1 && &filetype == "Outline") | q | endif',
    group = lastwin,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = 'if (winnr("$") == 1 && &filetype == "lspsagaoutline") | q | endif',
    group = lastwin,
})
-- nvim-tree is also there in modified buffers so this function filter it out

-- Save session when vimleave
local session = vim.api.nvim_create_augroup("session", { clear = true })
vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    command = "SessionManager save_current_session",
    group = session,
})

-- Edit large file
local largefile = vim.api.nvim_create_augroup("largefile", { clear = true })
local function big_file_disable()
    local file_size = vim.fn.getfsize(vim.fn.expand("%"))
    if file_size > 256 * 1024 then
        vim.cmd("setlocal foldmethod=manual")
        vim.notify("Big file, disable treesitter foldmethod.")
    end
end
vim.api.nvim_create_autocmd({"BufReadPre", "FileReadPre"}, {
    pattern = "*",
    callback = big_file_disable,
    group = largefile,
})

-- Custom user command
vim.api.nvim_create_user_command(
    "Path",
    'lua print(vim.fn.expand("%:p"))<cr>',
    {}
)

-- reload cursorword and highlight after changing colorscheme
local colorscheme = vim.api.nvim_create_augroup("colorscheme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = colorscheme,
    pattern = "*",
    callback = function()
        pcall(vim.cmd, "source ~/.config/nvim/plugin/cursorword.lua")
        pcall(vim.cmd, "source ~/.config/nvim/lua/core/highlight.lua")
    end,
})

-- Avoid default all folds to be closed on any file that you open.
-- autocmd BufReadPost,FileReadPost * normal zR
-- local treefold = vim.api.nvim_create_augroup("treefold", { clear = true })
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     -- pattern = { "*" },
--     command = "norm! zz",
--     group = treefold,
-- })
-- vim.api.nvim_create_autocmd("FileReadPost", {
--     -- pattern = { "*" },
--     command = "norm! zz",
--     group = treefold,
-- })
-- lsp-inlayhints.nvim
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", { clear = true })
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = "LspAttach_inlayhints",
-- 	callback = function(args)
-- 		if not (args.data and args.data.client_id) then
-- 			return
-- 		end
-- 		local bufnr = args.buf
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		require("lsp-inlayhints").on_attach(client, bufnr)
-- 	end,
-- })

-- Some fix for neovim nightly  DONE: not neovim, it's lens.vim
-- local nightly = vim.api.nvim_create_augroup("nightly", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "set cmdheight=1", group = nightly })
-- vim.api.nvim_create_autocmd("WinEnter", { pattern = "*", command = "set cmdheight=1", group = nightly })
-- vim.api.nvim_create_autocmd("BufLeave", { pattern = "*", command = "set cmdheight=1", group = nightly })

-- -- config for vim-jupyter, convert *.ipynb to markdown
-- local jupytext = vim.api.nvim_create_augroup("jupytext", { clear = true })
-- vim.api.nvim_create_autocmd(
-- 	{ "FileType", "BufNewFile", "BufFilePre", "BufRead", "BufCreate" },
-- 	{ pattern = { "*.ipynb" }, command = "set filetype=tex", group = jupytext }
-- )
-- vim.api.nvim_create_autocmd(
-- 	"BufCreate",
-- 	{ pattern = { "*.ipynb" }, command = "set filetype=markdown", group = jupytext }
-- )

-- Update signature help on jump placeholder
-- local cocautocmd = vim.api.nvim_create_augroup("cocautocmd", { clear = true })
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "CocJumpPlaceholder",
-- 	command = "call CocActionAsync('showSignatureHelp') <CR>",
-- 	group = cocautocmd,
-- })

-- highlight yank use build in command
-- local highlightyank = vim.api.nvim_create_augroup("highlightyank", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	group = highlighyank,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 600 })
-- 	end,
-- })

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
-- autocmd FileType toggleterm nnoremap <buffer> <ESC> :q<CR>
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
