return function()
	require("modules.utils").load_plugin("scrollbar", {
		excluded_filetypes = {
			"noice",
			"prompt",
			"TelescopePrompt",
			"lazy",
			"cmp_menu",
			"cmp_docs",
		},
		exclude_func = function(winid, bufnr)
			if not vim.api.nvim_win_is_valid(winid) then
				return true
			end

			local is_floating = vim.api.nvim_win_get_config(winid).relative ~= ""

			local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
			local exclude_filetype = {
				TelescopePrompt = true,
				lspsagafinder = true,
				[""] = true,
			}

			local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
			local exclude_buftype = {
				terminal = true,
				prompt = true,
			}

			return is_floating or exclude_buftype[buftype] or exclude_filetype[filetype]
		end,
	})
	require("scrollbar.handlers.gitsigns").setup()
end
