return function()
	local icons = {
		kind = require("modules.utils.icons").get("kind"),
		type = require("modules.utils.icons").get("type"),
		cmp = require("modules.utils.icons").get("cmp"),
		other = require("modules.utils.icons").get("other"),
	}
	local settings = require("core.settings")
	local MAX_LABEL_WIDTH = settings.cmp_max_width
	-- safely load luasnip.nvim
	local snip_ok, luasnip = pcall(require, "luasnip")
	if not snip_ok then
		vim.notify("luasnip failed", "error", { render = "minimal" })
		return
	end

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	local compare = require("cmp.config.compare")
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local use_copilot = require("core.settings").use_copilot
	local mode = require("core.settings").mode
	local comparators
	if use_copilot and mode ~= "server" then
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			require("copilot_cmp.comparators").score,
			-- require("cmp_tabnine.compare"),
			compare.offset,
			compare.exact,
			-- compare.scopes,
			compare.lsp_scores,
			compare.sort_text,
			compare.score,
			compare.recently_used,
			-- compare.locality,
			require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		}
	elseif mode == "server" then
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			require("copilot_cmp.comparators").score,
			compare.offset,
			compare.exact,
			compare.lsp_scores,
			compare.sort_text,
			compare.score,
			compare.recently_used,
			require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		}
	else
		comparators = {
			-- require("cmp_tabnine.compare"),
			compare.offset,
			compare.exact,
			-- compare.scopes,
			compare.lsp_scores,
			compare.sort_text,
			compare.score,
			compare.recently_used,
			-- compare.locality,
			require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		}
	end

	local cmp = require("cmp")
	require("modules.utils").load_plugin("cmp", {
		preselect = cmp.PreselectMode.Item,
		window = {
			completion = cmp.config.window.bordered({
				bordered = "rounded",
				col_offset = -1,
				scrollbar = true,
				winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:PmenuSel",
			}),
			documentation = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = comparators,
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				local lspkind_icons = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
				-- load lspkind icons
				vim_item.kind = string.format("%s ", lspkind_icons[vim_item.kind] or icons.cmp.undefined)

				vim_item.menu = setmetatable({
					cmp_tabnine = "[TN]",
					copilot = "[CPLT]",
					buffer = "[BUF]",
					orgmode = "[ORG]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[LUA]",
					path = "[PATH]",
					tmux = "[TMUX]",
					treesitter = "[TS]",
					luasnip = "[SNIP]",
					spell = "[SPELL]",
					codeium = "[CODI]",
					latex_symbols = "[LTEX]",
				}, {
					__index = function()
						return "[BTN]" -- builtin/unknown source names
					end,
				})[entry.source.name]

				local label = vim_item.abbr

				local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
				if truncated_label ~= label then
					vim_item.abbr = truncated_label .. icons.other.ellipsis
				end

				return vim_item
			end,
		},
		matching = {
			disallow_partial_fuzzy_matching = false,
		},
		performance = {
			async_budget = 1,
			max_view_entries = 120,
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
			["<down>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
			["<up>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-w>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif not check_backspace() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		-- You should specify your *installed* sources.
		sources = {
			{ name = "nvim_lsp", max_item_count = 350 },
			{ name = "nvim_lua" },
			{ name = "luasnip", priority = 9 },
			{ name = "path" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "orgmode" },
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end,
				},
			},
			{ name = "latex_symbols", priority = 9 },
			{ name = "copilot" },
			-- { name = "cmp_tabnine" },
			{ name = "codeium" },
		},
		experimental = {
			ghost_text = {
				hl_group = "Whitespace",
			},
		},
	})
	cmp.setup.cmdline(":", {
		completion = {
			completeopt = "nenu,menuone,noselect",
		},
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end
