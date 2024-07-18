return function()
	require("modules.utils").load_plugin("flote", {
		q_to_quit = true,
		window_style = "minimal",
		window_border = "rounded",
		window_title = true,
	})
end
