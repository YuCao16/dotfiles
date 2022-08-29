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
local ok, apairs = pcall(require, 'nvim-autopairs')
if not ok then
    return
end

apairs.setup{
    check_ts = true,
    ts_config = {
        lua = {'string', 'source'},
        javascript = {'string', 'template_string'},
        java = false,
    },
    disable_filetype = {'TelescopePrompt', 'spectre_panel'},
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'", },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done {map_char = { text = ""}})

