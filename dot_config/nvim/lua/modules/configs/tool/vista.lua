return function()
	require("modules.utils").load_plugin("vista-nvim", {
		theme = "tree",
		-- TODO: fix width, wirter.lua clean_path
		width = 28,
	})
end
