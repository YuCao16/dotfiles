local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local plug_map = {
	-- Plugin persisted.nvim
	["n|<leader>sl"] = map_cu("SessionLoadLast"):with_noremap():with_silent():with_desc("session: Save"),
	["n|<leader>sS"] = map_cu("SessionSave"):with_noremap():with_silent():with_desc("session: Save"),
	["n|<leader>sL"] = map_cu("SessionLoad"):with_noremap():with_silent():with_desc("session: Load current"),
	["n|<leader>sD"] = map_cu("SessionDelete"):with_noremap():with_silent():with_desc("session: Delete"),

	-- Plugin window.nvim
	["n|<leader><TAB>"] = map_cu("lua require('nvim-window').pick()")
		:with_silent()
		:with_desc("Nvim-window: Pickup a window"),

	-- Plugin: diffview
	["n|<leader>Do"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("git: Show diff"),
	["n|<leader>Dc"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("git: Close diff"),

	-- Plugin: vim-easy-align
	["nx|gea"] = map_cr("EasyAlign"):with_desc("edit: Align with delimiter"),

	-- Plugin: hop
	["nv|<leader>v"] = map_cmd("<Cmd>HopWord<CR>"):with_noremap():with_desc("jump: Goto word"),

	-- Plugin: treehopper
	["o|m"] = map_cu("lua require('tsht').nodes()"):with_silent():with_desc("jump: Operate across syntax tree"),

	-- Plugin: treesj
	["n|<space>m"] = map_cu("TSJToggle"):with_silent():with_desc("Treesj: Toggle"),
	["n|<space>s"] = map_cu("TSJSplit"):with_silent():with_desc("Treesj: Split"),
	["n|<space>j"] = map_cu("TSJJoin"):with_silent():with_desc("Treesj: Join"),

	-- Plugin suda.vim
	["n|<A-s>"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editn: Save file using sudo"),

	-- Plugin flash.nvim
	["n|S"] = map_cmd("<Cmd>lua require('flash').jump()<CR>"):with_silent():with_noremap():with_desc("Flash"),
	["n|<leader>gs"] = map_cmd("<Cmd>lua require('flash').treesitter()<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("Flash Treesitter"),
	["o|r"] = map_cmd("<Cmd>lua require('flash').remote()<CR>"):with_silent():with_noremap():with_desc("Remote Flash"),
	["ox|R"] = map_cmd("<Cmd>lua require('flash').treesitter_search()<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("Treesitter Search"),
	["c|<c-s>"] = map_cmd("<Cmd>lua require('flash').toggle()<CR>")
		:with_silent()
		:with_noremap()
		:with_desc("Toggle Flash Search"),
}

bind.nvim_load_mapping(plug_map)
