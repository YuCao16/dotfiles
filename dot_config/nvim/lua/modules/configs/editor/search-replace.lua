return function()
	require("modules.utils").load_plugin("search-replace", {
		-- optionally override defaults
		default_replace_single_buffer_options = "gcI",
		default_replace_multi_buffer_options = "egcI",
	})
end
