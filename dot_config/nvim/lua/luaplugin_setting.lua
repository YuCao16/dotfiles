--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

--=====================================================
-- Dashborad settings
--=====================================================
local home = os.getenv('HOME')
local db = require('dashboard')
db.custom_header = {
 "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
 "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
 "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
 "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
 "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
 "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
 "                                                      ",
 "                                                      ",
 "                                                      ",
 "           Don‘t forget why you neovim!               ",
 "                                                      ",
}

db.custom_center = {
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'Telescope oldfiles',
  shortcut = 'SPC s o'},
  {icon = '  ',
  desc = 'Recently latest session                 ',
  shortcut = 'SPC s l',
  action ='SessionManager load_last_session'},
  {icon = '  ',
  desc = 'New File                                ',
  action = 'enew',
  shortcut = 'SPC f d'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Change colorscheme                      ',
  action = 'Telescope colorscheme',
  shortcut = 'SPC f d'},
  -- {icon = '  ',
  -- desc = 'Open Personal dotfiles                  ',
  -- action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
  -- shortcut = 'SPC f d'},
}

--=====================================================
-- Org Mode settings
--=====================================================
-- require("orgmode").setup_ts_grammar()
-- require("orgmode").setup({
-- 	org_highlight_latex_and_related = "entities",
-- 	-- org_agenda_files = {'~/Dropbox/org/*', '~/org/**/*'},
-- 	org_agenda_files = {'~/Dropbox/org/*'},
-- 	-- org_indent_mode = 'noindent',
-- })

--=====================================================
-- Treesitter settings
--=====================================================
require("nvim-treesitter.configs").setup({
	-- ensure_installed = "maintained",
	ensure_installed = {'org','python','norg'},
	sync_install = false,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		disable = { "c", "rust", "org" }, -- note connot remove org
		additional_vim_regex_highlighting = false,
		-- additional_vim_regex_highlighting = { "org" },
	},
	indent = {
		enable = true,
		-- disable = { "org" }
	},
	endwise = {
		enable = true,
		disable = {"cpp"}
	},
	playground = {
		enable = true,
		disable = {},
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})


--=====================================================
-- Neorg settings
--=====================================================
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}
parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}
parser_configs.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}
