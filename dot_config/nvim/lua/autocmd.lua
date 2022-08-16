--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- quick exit from dashboard
vim.cmd([[
autocmd FileType dashboard nnoremap <buffer> q :lua Handle_dashboard()<CR>
autocmd FileType dashboard nnoremap <buffer> <up> k
autocmd FileType dashboard nnoremap <buffer> <down> j
]])
vim.cmd([[
augroup cocautocmd
	autocmd!
  " Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]])

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

-- config toggleterm
vim.cmd([[
autocmd FileType toggleterm nnoremap <buffer> <ESC> :q<cr>
tnoremap <silent> <ESC> <C-\><C-n>
]])

-- Missing the best setup Plugin
vim.cmd([[
autocmd FileType startify :lua require"nvim-tree".toggle(false, true)
]])

-- auto config scrollbar
vim.cmd([[
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
]])

-- autocmd for filetype settings
vim.cmd([[
autocmd FileType html setlocal shiftwidth=2 tabstop=4 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType tex setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType vim setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType json setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType journal setlocal shiftwidth=4 tabstop=4 softtabstop=4
]])

-- This line map run python with <,2> and close python shell after running
vim.cmd([[
autocmd FileType python map <buffer> <leader>2 :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
]])

-- config for vim-jupyter, convert *.ipynb to markdown
vim.cmd([[
autocmd FileType,BufNewFile,BufFilePre,BufRead *.ipynb set filetype=tex
autocmd BufCreate *.ipynb set filetype=tex
autocmd BufCreate *.ipynb set filetype=markdown
autocmd BufWinEnter echo 1
]])

-- basic settings for python and markdown
vim.cmd([[
autocmd FileType python set colorcolumn=80
autocmd FileType markdown set textwidth=80
]])

-- quit nvimtree if it's the only buffer left
vim.cmd([[
autocmd bufenter * if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif
]])

-- learn lua autocmd api
-- local group = vim.api.nvim_create_augroup("mytest", {clear = true})
-- vim.api.nvim_create_autocmd("BufEnter", {command = "echo 'hello'", group = group})
-- vim.api.nvim_create_autocmd("BufEnter", {command = "echo 'hello'"})
-- vim.cmd([[
-- autocmd BufEnter :echo 'hello'<cr>
-- ]])
