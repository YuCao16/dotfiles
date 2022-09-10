local sidebar_nvim_ok, sidebar_nvim = pcall(require, "sidebar-nvim")
if not sidebar_nvim_ok then
	vim.notify("sidebar-nvim failed", "error", { render = "minimal" })
	return
end

sidebar_nvim.setup({
	sections = {
		"datetime",
		-- "git",
		"symbols",
		"todos",
		"files",
		"buffers",
	},
	symbols = {
		icon = "ƒ",
	},
	initial_width = 30,
})
