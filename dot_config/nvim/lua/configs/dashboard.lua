--=====================================================
-- Dashborad settings
--=====================================================

local home = os.getenv("HOME")
local db = require("dashboard")
db.session_directory = "~/.local/share/nvim/sessions/"
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
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "lua require('telescope').extensions.recent_files.pick()",
		-- action = "Telescope oldfiles",
		shortcut = "SPC s o",
	},
	{
		icon = "  ",
		desc = "Recently latest session                 ",
		shortcut = "SPC s l",
		action = "SessionManager load_last_session",
	},
	{
		icon = "  ",
		desc = "Session History                         ",
		shortcut = "SPC p u",
		-- action = "lua require('telescope.builtin').find_files({ cwd = '~/.local/share/nvim/sessions' })",
		action = "SessionManager load_session",
	},
	{
		icon = "  ",
		desc = "New File                                ",
		action = "enew",
		shortcut = "SPC f d",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Change colorscheme                      ",
		action = "Telescope colorscheme",
		shortcut = "SPC f d",
	},
	{
		icon = "  ",
		desc = "Open Personal dotfiles                  ",
		action = "lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })",
		shortcut = "SPC f d",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "File Browser                            ",
	-- 	action = "Telescope file_browser",
	-- 	shortcut = "SPC f b",
	-- },
	-- {
	-- 	icon = "  ",
	-- 	desc = "Update Plugins                          ",
	-- 	shortcut = "SPC p u",
	-- 	action = "PackerUpdate",
	-- },
}
