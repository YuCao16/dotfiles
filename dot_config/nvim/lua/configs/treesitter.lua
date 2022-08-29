require("nvim-treesitter.configs").setup({
	-- ensure_installed = "maintained",
	ensure_installed = { "org", "python", "norg" },
	sync_install = false,
	ignore_install = { "ruby" },
	highlight = {
		enable = true,
		disable = { "c", "rust", "org" }, -- note connot remove org
		additional_vim_regex_highlighting = false,
		-- additional_vim_regex_highlighting = { "org" },
	},
	autopairs = {
		enable = true,
	},
	textobjects = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	endwise = {
		enable = true,
		disable = { "rust" },
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
-- Orgmode parsers
--=====================================================
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

--=====================================================
-- Neorg parsers
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
