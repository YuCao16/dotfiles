local indent_line_ok, indent_line = pcall(require, "indent_blankline")
if not indent_line_ok then
	vim.notify("indent_blankline failed", "error", { render = "minimal" })
	return
end

indent_line.setup({
	space_char_blankline = " ",
	show_current_context = true,
	-- show_current_context_start = true,
	filetype_exclude = {
		"dashboard",
		"lsp-installer",
		"peek",
		"tagbar",
		"NvimTree",
		"lspinfo",
		"Outline",
		"glowpreview",
		"mason",
		"Trouble",
		"code-action-menu-menu",
		"help",
	},
	buftype_exclude = { "terminal", "nofile", "prompt" },
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
})
