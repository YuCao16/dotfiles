return function()
	require("modules.utils").load_plugin("zen-mode", {
		window = {
			backdrop = 0.8,
			-- width = 0.75, -- width will be 75% of the editor width
			width = 100,
		},
	})
end
