return function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "UnceptionEditRequestReceived",
		callback = function()
			vim.api.nvim_command(":ToggleTerm")
		end,
	})

	vim.g.unception_open_buffer_in_new_tab = true

	require("modules.utils").load_plugin("unception", nil, true)
end

