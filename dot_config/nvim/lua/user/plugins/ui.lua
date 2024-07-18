local ui = {}

ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
	dependencies = {
		{ "tiagovla/scope.nvim" },
	},
}
ui["folke/tokyonight.nvim"] = {
	lazy = true,
}
ui["yucao16/dashboard-nvim"] = {
	lazy = true,
	event = { "BufWinEnter" },
	config = require("ui.dashboard"),
}
ui["yucao16/onedark.nvim"] = {
	lazy = false,
	config = require("ui.onedark"),
}
ui["petertriho/nvim-scrollbar"] = {
	lazy = true,
	event = { "VeryLazy" },
	config = require("ui.scroll_bar"),
}
ui["itchyny/vim-highlighturl"] = {
	lazy = true,
	event = { "BufReadPost" },
	config = function()
		vim.g.highlighturl_guifg = "#8AB4F8"
	end,
}
ui["dvoytik/hi-my-words.nvim"] = {
	lazy = true,
	config = true,
	cmd = { "HiMyWordsToggle", "HiMyWordsClear" },
}
ui["folke/zen-mode.nvim"] = {
	lazy = true,
	cmd = { "ZenMode" },
	config = require("ui.zenmode"),
}
ui["stevearc/dressing.nvim"] = {
	lazy = true,
	event = { "VeryLazy" },
	config = require("ui.dressing_config"),
}
ui["uga-rosa/ccc.nvim"] = {
	lazy = true,
	cmd = { "CCCPick", "CCCHighlighterToggle", "CCCHighlighterEnable", "CCCHighlighterDisable" },
	ft = { "lua" },
	config = require("ui.ccc_config"),
}
ui["machakann/vim-highlightedyank"] = {
	lazy = true,
	event = { "VeryLazy" },
}
ui["lvimuser/lsp-inlayhints.nvim"] = {
	lazy = true,
	event = { "LspAttach" },
	config = require("ui.inlay_hint"),
}

return ui
