"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"
"            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  "
"            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  "
"            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  "
"            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  "
"            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  "
"            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  "
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

"=====================================================
"" Coc Configurations
"=====================================================
" imap <C-y> <Plug>(coc-snippets-expand)
" inoremap <silent><expr> <tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

"=====================================================
"" Lua Plugin setup
"=====================================================
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"=====================================================
"" Custom Functions
"=====================================================
" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Switch format package for different filetype
function! SwitchFormatter()
    if &filetype == 'python'
	:call CocAction('format')
	elseif &filetype == 'markdown'
	:call CocAction('format')
    else
	:Neoformat
    endif
endfunction

" handle nvimtree, if nvimtree open then focus, if no nvimtree then toggle
" nvimtree
lua << EOF
function Handle_nvimtree()
	if require'nvim-tree.view'.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			require'nvim-tree'.toggle()
		else
			require'nvim-tree'.focus()
		end
	else
		require'nvim-tree'.open()
	end
end
EOF

" if dashboard is the only buffer, then press q to quit nvim
function! Handle_dashboard()
	if len(getbufinfo({'buflisted':1}))==0
	:q
	else
	:bd
	endif
endfunction

" check if coc.nvim documentation available
function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
