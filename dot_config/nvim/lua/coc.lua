local g = vim.g
local api = vim.api
local cmd = api.nvim_command
local fn = vim.fn

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
-- === Airline is natively supported ===
-- o.statusline = o.statusline .. [[ %{coc#status()}%{get(b:,'coc_current_function','')} ]]

local function register_mappings(mappings, default_options)
	for mode, mode_mappings in pairs(mappings) do
		for _, mapping in pairs(mode_mappings) do
			local options = #mapping == 3 and table.remove(mapping) or default_options
			local prefix, cmd = unpack(mapping)
			pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
		end
	end
end

-- g.coc_global_extensions = {
--    'coc-git',
--    'coc-highlight',
--    'coc-json',
--    'coc-lua',
--    'coc-marketplace',
--    'coc-metals',
--    'coc-prettier',
--    'coc-pyright',
--    'coc-snippets',
--    'coc-solargraph',
--    'coc-sourcekit',
--    'coc-styled-components',
--    'coc-tailwindcss',
--    'coc-tslint-plugin',
--    'coc-tsserver',
--    'coc-vetur',
--    'coc-vimlsp',
--    'coc-webpack',
--    'coc-word',
--    'coc-xml',
--    'coc-lists',
-- }

g.coc_global_extensions = {
	"coc-pyright",
	"coc-jedi",
	"coc-json",
	"coc-lightbulb",
	"coc-lua",
	"coc-markdownlint",
	"coc-prettier",
	"coc-snippets",
	"coc-tabnine",
	"coc-vimtex",
	"coc-lists",
	"coc-highlight",
	"coc-cspell-dicts",
	"coc-spell-checker",
}

function _G.check_back_space()
	local col = fn.col(".") - 1
	if col == 0 or fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

function _G.show_docs()
	local cw = fn.expand("<cword>")
	if fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		cmd("h " .. cw)
	elseif api.nvim_eval("coc#rpc#ready()") then
		fn.CocActionAsync("doHover")
	else
		cmd("!" .. vim.o.keywordprg .. " " .. cw)
	end
end

local mappings = {
	i = { -- Insert mode
		{
			"<TAB>",
			'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
			{ expr = true },
		},
		{ "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { expr = true } },
		-- { "<C-SPACE>", 'coc#refresh()', { expr = true } },
		{
			"<down>",
			'coc#float#has_scroll() ? coc#float#scroll(1) : "<down>"',
			{ expr = true, silent = true, nowait = true },
		},
		{
			"<up>",
			'coc#float#has_scroll() ? coc#float#scroll(0) : "<up>"',
			{ expr = true, silent = true, nowait = true },
		},
		{
			"<CR>",
			'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>" ',
			{ expr = true, silent = true },
		},
		-- {
		-- 	"<C-x><C-z>",
		-- 	'coc#pum#visible() ? coc#pum#confirm() : "<C-x>\<C-z>" ',
		-- 	{ expr = true, silent = true },
		-- },
	},
	n = { -- Normal mode
		{ "<tab>", "<CMD>lua _G.show_docs()<CR>", { silent = true } },
		{ "[g", "<Plug>(coc-diagnostic-prev)", { noremap = false } },
		{ "]g", "<Plug>(coc-diagnostic-next)", { noremap = false } },
		{ "gd", "<Plug>(coc-definition)", { noremap = false } },
		{ "gy", "<Plug>(coc-type-definition)", { noremap = false } },
		{ "gi", "<Plug>(coc-implementation)", { noremap = false } },
		{ "gr", "<Plug>(coc-references)", { noremap = false } },
		{ "rn", "<Plug>(coc-rename)", { noremap = false } },
		{ "<leader>ca", ":call CocActionAsync('codeAction','cursor')<cr>", { noremap = false, silent = false } },

		{
			"<down>",
			'coc#float#has_scroll() ? coc#float#scroll(1) : "<down>"',
			{ expr = true, silent = true, nowait = true },
		},
		{
			"<up>",
			'coc#float#has_scroll() ? coc#float#scroll(0) : "<up>"',
			{ expr = true, silent = true, nowait = true },
		},
		-- { "gb", "<Plug>(coc-cursors-word)", { noremap = false } },
	},
	o = {},
	t = { -- Terminal mode
	},
	v = { -- Visual/Select mode
	},
	x = { -- Visual mode
		-- { "<leader>a", "<CMD>lua _G.show_docs()<CR>", { silent = true } },
	},
	[""] = {},
}

vim.cmd([[
    " Add `:Format` command to format current buffer.
    " command! -nargs=0 Format :call CocAction('format')
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
]])

-- require("utils").define_augroups({
-- 	_coc = {
-- 		{ "filetype", "typescript,json", "setl", "formatexpr=CocAction('formatselected')" },
-- 		{ "User", "CocQuickfixChange", ":CocList", "--normal", "quickfix" },
-- 		{ "user", "cocjumpplaceholder", "call", "CocActionAsync('showSignatureHelp')" },
-- 	},
-- })

register_mappings(mappings, { silent = true, noremap = true })
