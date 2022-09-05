local indent_line_ok, indent_line = pcall(require, "indent_blankline")
if not indent_line_ok then
	vim.notify("indent_blankline failed", "error", { render = "minimal" })
	return
end

-- vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

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
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})
