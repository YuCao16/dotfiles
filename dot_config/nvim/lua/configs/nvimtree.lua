--=====================================================
-- Nvimtree settings
--=====================================================

require("nvim-tree").setup({
	auto_close = ture,
	-- show_on_startup = true,
	view = {
		hide_root_folder = false,
		float = {
			enable = false,
		},
		width = 30,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
		ignore = true,
	},
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = false,
		},
	},
})
