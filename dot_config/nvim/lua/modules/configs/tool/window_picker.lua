return function()
	require("modules.utils").load_plugin("window-picker", {
		-- hint = "floating-big-letter",
		autoselect_one = true,
		include_current = false,
		filter_rules = {
			bo = {
				filetype = { "neo-tree-popup", "quickfix", "VistaNvim", "notify", "fidget" },
				buftype = { "terminal", "quickfix" },
			},
		},
	})
end
