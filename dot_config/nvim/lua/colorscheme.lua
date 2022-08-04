local cmd = vim.cmd -- Execute Vim commands
-- require("github-theme").setup({
-- 	transparent = false,
-- 	dark_sidebar = false,
-- })
cmd([[colorscheme kanagawa]])

cmd([[
hi! link StatusLine Normal
hi OrgDONE guifg=green
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
]])

-- config orgmode Done symbol
cmd([[
function! s:setup_org_colors() abort
  hi OrgDONE guifg=green
endfunction

autocmd ColorScheme * call s:setup_org_colors()
]])

-- add a red line one column 80
-- cmd([[
-- hi ColorColumn guibg=#ff3131 ctermbg=236
-- ]])
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ff3131", ctermbg = 236 })

-- set windows separator to None
-- cmd([[
-- hi WinSeparator guibg = NONE
-- ]])
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })

require("gitsigns").setup({
	signs = {
		add = { hl = "GitGutterAdd", text = "+" },
		change = { hl = "GitGutterChange", text = "~" },
		delete = { hl = "GitGutterDelete", text = "_" },
		topdelete = { hl = "GitGutterDelete", text = "‾" },
		changedelete = { hl = "GitGutterChange", text = "~" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}
