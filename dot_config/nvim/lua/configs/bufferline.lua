--=====================================================
-- Bufferline settings
--=====================================================

require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		close_command = function(bufnum)
			require("bufdelete").bufdelete(bufnum, true)
		end,
	},
})
