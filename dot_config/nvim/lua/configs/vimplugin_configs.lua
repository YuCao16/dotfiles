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
-- "" Vista settings
-- "=====================================================
g["vista#renderer#enable_icon"] = 1
g["vista_highlight_whole_line"] = 0
g["vista_echo_cursor"] = 0
g["vista_stay_on_open"] = 0
g["vista_executive_for"] = {
    lua = "nvim_lsp",
}
g["vista_floating_border"] = "rounded"
-- "=====================================================
-- "" tagbar settings
-- "=====================================================
g["tagbar_width"] = 34
g["tagbar_compact"] = 1
g["tagbar_silent"] = 1
g["tagbar_sort"] = 0
g["tagbar_show_linenumbers"] = 0
g["tagbar_no_autocmds"] = 0

-- "=====================================================
-- "" Lens/Animate settings
-- "=====================================================
g["lens#animate"] = 0
g["animate#duration"] = 100.0
g["lens#disable_buftypes"] = {
    "terminal",
}
g["lens#disabled_filetypes"] = {
    "tagbar",
    "NvimTree",
    "dapui_watches",
    "dapui_stacks",
    "dapui_breakpoints",
    "dapui_scopes",
    "dapui_console",
    "dap-repl",
    "Outline",
    "SidebarNvim",
}

-- "=====================================================
-- "" CSV settings
-- "=====================================================
g["csv_delim"] = ","

-- "=====================================================
-- "" VimTex settings
-- "=====================================================
if vim.fn.has("macunix") == 1 then --make sure skim for macos only
    g["vimtex_view_method"] = "skim"
else
    g["vimtex_view_method"] = "general"
end
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
-- "" Tex-Conceal.vim settings
-- "=====================================================
-- cmd([[set conceallevel=2]])
g["tex_superscripts"] = "[0-9a-zA-W.,:;+-<>/()=]"
g["tex_subscripts"] = "[0-9aehijklmnoprstuvx,+-/().]"
g["tex_conceal"] = "abdmg"
g["tex_flavor"] = "latex"
-- cmd([[set concealcursor=nc]])
-- cmd([[hi Conceal ctermbg=none]])

-- "=====================================================
-- "" everforest settings
-- "=====================================================
g["everforest_background"] = "hard"
g["edge_style"] = "hard"
g["gruvbox_materiala_background"] = "hard"

-- "=====================================================
-- "" registers.nvim settings
-- "=====================================================
g["registers_delay"] = 200
g["registers_window_border"] = "rounded"
g["system_clip"] = 1
g["peekup_open"] = '"'

-- "=====================================================
-- "" latex settings
-- "=====================================================
-- ignore latex itemize autoindent
g["tex_indent_items"] = 0
g["tex_indent_and"] = 0
g["tex_indent_brace"] = 0

-- "=====================================================
-- "" bullets.vim settings
-- "=====================================================
g["bullets_line_spacing"] = 2
-- g["bullets_outline_level"] = ['num', 'abc', 'std-']

-- "=====================================================
-- "" Code action menu settings
-- "=====================================================
g["code_action_menu_window_border"] = "rounded"

-- "=====================================================
-- "" neoformat settings
-- "=====================================================
g.neoformat_enabled_markdown = { "prettier" }
g.neoformat_enabled_python = { "black" }
g.neoformat_markdown_prettier = {
    exe = "prettier",
    args = { "--write --prose-wrap=always --tab-width=4 --listItemIndent=1" },
    replace = 1,
}
g.neoformat_javascript_prettier = { "prettier" }
g.neoformat_javascript_prettier = {
    exe = "prettier",
    args = { "--write --prose-wrap=always --tab-width=2" },
    replace = 1,
}
g.neoformat_lua_stylua = {
    exe = "stylua",
    args = { "--column-width 80 --indent-type Spaces --indent-width 4 -" },
    stdin = 1,
}
g.neoformat_rust_rustfmt = {
    exe = "rustfmt",
    args = { "--config max_width=80" },
    replace = 1,
}
g.neoformat_cpp_clangformat =
    { exe = "clang-format", args = { "--style='{IndentWidth: 4}'" } }

-- cmd([[
-- let g:neoformat_enabled_markdown = ['prettier']
-- let g:neoformat_markdown_prettier = {
--       \ 'exe': 'prettier',
--       \ 'args': ['--write', '--prose-wrap=always','--tab-width=4'],
--       \ 'replace': 1
--       \ }
-- let g:neoformat_enabled_javascript = ['prettier']
-- let g:neoformat_javascript_prettier = {
--       \ 'exe': 'prettier',
--       \ 'args': ['--write', '--prose-wrap=always','--tab-width=2'],
--       \ 'replace': 1
--       \ }
-- let g:neoformat_cpp_clangformat = {
--     \ 'exe': 'clang-format',
--     \ 'args': ['--style="{IndentWidth: 4}"'],
-- \}
-- let g:neoformat_rust_rustfmt = {
--     \ 'exe': 'rustfmt',
--     \ 'args': ['--config', 'max_width=80'],
--     \ 'replace': 1
-- \}
-- let g:neoformat_lua_stylua = {
--     \ 'exe': 'stylua',
--     \ 'args': ['--column-width 80', '--indent-type Spaces',
--     \          '--indent-width 4', '-'],
--     \ 'stdin': 1,
--     \ }
-- ]])

-- "=====================================================
-- "" Coc Configurations
-- "=====================================================
-- g["coc_snippet_next"] = "<tab>"
