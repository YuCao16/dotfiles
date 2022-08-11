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
g["tagbar_width"] = 34

-- "=====================================================
-- "" Lens/Animate settings
-- "=====================================================
g["lens#animate"] = 0
g["animate#duration"] = 100.0
g["lens#disabled_filetypes"] = {
	"tagbar",
	"nvimtree",
	"dapui_watches",
	"dapui_stacks",
	"dapui_breakpoints",
	"dapui_scopes",
	"dapui_console",
	"dap-repl",
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
cmd([[set conceallevel=2]])
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
g["gruvbox_materiala_background"] = "hard"

-- "=====================================================
-- "" registers.nvim settings
-- "=====================================================
g["registers_delay"] = 200
g["registers_window_border"] = "rounded"
g["system_clip"] = 1
g["peekup_open"] = '"'
