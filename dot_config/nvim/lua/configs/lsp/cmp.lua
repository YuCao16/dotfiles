-- safely load cmp.nvim
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	vim.notify("nvim-cmp failed", "error", { render = "minimal" })
	return
end

-- safely load luasnip.nvim
local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
	vim.notify("luasnip failed", "error", { render = "minimal" })
	return
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
})
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "./snippets/" },
})

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 30
local MAX_KIND_WIDTH = 14

local get_ws = function(max, len)
	return (" "):rep(max - len)
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local content = vim_item.abbr

			-- max width
			if #content > MAX_LABEL_WIDTH then
				vim_item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
			else
				vim_item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
			end

			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

			-- This concatonates the icons with the name of the item kind
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				luasnip = "[Snippet]",
				buffer = "[Buf]",
				path = "[Path]",
				dictionary = "[Dic]",
				treesitter = "[Tree]",
				cmp_tabnine = "[TN]",
				orgmode = "[ORG]",
				latex_symbols = "[TEX]",
			})[entry.source.name]
			return vim_item
		end,
	},
	window = {
		completion = cmp.config.window.bordered("rounded"),
		documentation = cmp.config.window.bordered("rounded"),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 15 },
		{ name = "luasnip", max_item_count = 15 },
		{ name = "path" },
		{ name = "cmp_tabnine", max_item_count = 5 },
		{ name = "orgmode" },
		{ name = "nvim_lua" },
		{ name = "latex_symbols", max_item_count = 5 },
		-- { name = "dictionary" },
		-- { name = "treesitter" },
		-- { name = "buffer" },
	}),
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<down>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
		["<up>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
