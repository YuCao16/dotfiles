require("bufferline").setup({
	options = {
		-- close_command = "Bdelete!",
		diagnostics = "coc",
		close_command = function(bufnum)
			require("bufdelete").bufdelete(bufnum, true)
		end,
	},
})
