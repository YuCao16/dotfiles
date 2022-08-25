require("bufferline").setup({
	options = {
		diagnostics = "coc",
		close_command = function(bufnum)
			require("bufdelete").bufdelete(bufnum, true)
		end,
	},
})
