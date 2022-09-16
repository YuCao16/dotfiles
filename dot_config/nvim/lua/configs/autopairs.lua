local apairs_ok, apairs = pcall(require, "nvim-autopairs")
if not apairs_ok then
	vim.notify("nvim-autopairs failed", "error", { render = "minimal" })
	return
end

apairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local cond = require("nvim-autopairs.conds")
local Rule = require("nvim-autopairs.rule")
apairs.add_rules(
	{
		Rule("$", "$", { "tex", "latex" })
			-- don't add a pair if the next character is %
			:with_pair(cond.not_after_regex("%%"))
			-- don't add a pair if  the previous character is xxx
			:with_pair(cond.not_before_regex("xxx", 3))
			-- don't move right when repeat character
			:with_move(cond.none())
			-- don't delete if the next character is xx
			:with_del(cond.not_after_regex("xx"))
			-- disable adding a newline when you press <cr>
			:with_cr(cond.none()),
	},
	-- disable for .vim files, but it work for another filetypes
	Rule("a", "a", "-vim")
)

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { text = "" } }))

-- local remap = vim.api.nvim_set_keymap
-- local npairs = require("nvim-autopairs")
-- npairs.setup({ map_cr = false, disabled_filetypes = { "latex", "tex" } })
--
-- -- skip it, if you use another global object
-- _G.MUtils = {}
-- MUtils.completion_confirm = function()
-- 	-- if vim.fn.pumvisible() ~= 0 then
-- 	if vim.fn["coc#pum#visible"]() ~= 0 then
-- 		return vim.fn["coc#_select_confirm"]()
-- 	else
-- 		return npairs.autopairs_cr()
-- 	end
-- end
-- remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })

-- apairs.add_rules({
-- 	Rule("$$", "$$", "tex"):with_pair(function(opts)
-- 		print(vim.inspect(opts))
-- 		if opts.line == "aa $$" then
-- 			-- don't add pair on that line
-- 			return false
-- 		end
-- 	end),
-- })
