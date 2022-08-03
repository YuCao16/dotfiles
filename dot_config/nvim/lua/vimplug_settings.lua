--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local g = vim.g -- Global variables
local cmd = vim.cmd -- Execute Vim commands

-- "=====================================================
-- "" Coc Configurations
-- "=====================================================
g["coc_snippet_next"] = "<tab>"

-- "=====================================================
-- "" tagbar settings
-- "=====================================================
-- cmd([[let g:tagbar_width = 50]])
g["tagbar_width"] = 34

-- cmd("let g:lens#disabled_filetypes = ['nerdtree','tagbar']")
g["lens#animate"] = 0
g["animate#duration"] = 100.0
g["lens#disabled_filetypes"] = { "nerdtree", "tagbar", "nvimtree" }

-- "=====================================================
-- "" Python settings
-- "=====================================================
-- cmd([[let g:syntastic_python_python_exec = 'python3']])
-- cmd([[let g:syntastic_python_checkers = ('python')]])
-- cmd([[let g:semshi#filetypes = ['python']]])
g["syntastic_python_checkers"] = "python"
g["syntastic_python_python_exec"] = "python3"

-- "=====================================================
-- "" CSV settings
-- "=====================================================
g["csv_delim"] = ","

-- "=====================================================
-- "" VimTex settings
-- "=====================================================
g["vimtex_view_method"] = "skim"
g["vimtex_compiler_method"] = "latexmk"

-- "=====================================================
-- "" vim-table-mode settings
-- "=====================================================
g["table_mode_corner"] = "|"

-- "=====================================================
-- "" Markdown settings
-- "=====================================================
g["vim_markdown_math"] = 1 -- enable markdown math
g["tex_conceal"] = ""

-- "=====================================================
-- "" UltiSnips settings
-- "=====================================================
g["UltiSnipsSnippetsDir"] = "~/.config/nvim/UltiSnips"

-- "=====================================================
-- "" FixCursorHold settings
-- "=====================================================
g["cursorhold_updatetime"] = 100

-- "=====================================================
-- "" Limelight settings
-- "=====================================================
g["limelight_conceal_ctermfg"] = "gray"
g["limelight_conceal_guifg"] = "gray"

-- "=====================================================
-- "" IndentLine settings
-- "=====================================================
g["indentLine_char"] = "▏"
g["indentLine_defaultGroup"] = "NonText"
g["indentLine_defaultGroup"] = "SpecialKey"

g["vim_json_syntax_conceal"] = 0
g["vim_markdown_concel"] = 0
g["vim_markdown_conceal_code_blocks"] = 0

-- "=====================================================
-- "" register.nvim settings
-- "=====================================================
g["registers_window_border"] = "single"
g["peekup_open"] = '"'

-- "=====================================================
-- "" Tex-Conceal.vim settings
-- "=====================================================
cmd([[set conceallevel=2]])
-- cmd([[set concealcursor=nc]])
g['tex_superscripts'] = "[0-9a-zA-W.,:;+-<>/()=]"
g['tex_subscripts'] = "[0-9aehijklmnoprstuvx,+-/().]"
g["tex_conceal"] = "abdmg"
g["tex_flavor"] = "latex"
-- cmd([[hi Conceal ctermbg=none]])

-- "=====================================================
-- "" everforest settings
-- "=====================================================
g['everforest_background'] = "hard"
g['gruvbox_materiala_background'] = "hard"

-- "=====================================================
-- "" registers.nvim settings
-- "=====================================================
g['registers_delay'] = 300
g['registers_window_border'] = "rounded"
g['system_clip'] = 1
