return function()
	require("modules.utils").load_plugin("sidebar-nvim", {
		sections = {
			"datetime",
			"git",
			-- "symbols",
			"todos",
			"files",
			"buffers",
		},
		symbols = {
			icon = "ƒ",
		},
		initial_width = 30,
	})
end
