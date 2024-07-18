return function()
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end

	local exclude_filetype = {
		["help"] = true,
		["dashboard"] = true,
		["packer"] = true,
		["neogitstatus"] = true,
		["NvimTree"] = true,
		["Trouble"] = true,
		["alpha"] = true,
		["lir"] = true,
		["Outline"] = true,
		["spectre_panel"] = true,
		["toggleterm"] = true,
		["qf"] = true,
		["VistaNvim"] = true,
	}

	local home = require("core.global").home

	local excludes = function()
		return exclude_filetype[vim.bo.filetype]
			or vim.b[0].navic_client_id == nil
			or vim.api.nvim_win_get_config(0).relative ~= ""
	end

	local clean_filepath = function(path)
		if path:find(home, 1, true) == 1 then
			path = " ~" .. path:sub(#home + 1)
		end
		local max_width = math.floor((vim.fn.winwidth(0)) * 0.5)
		local path_width = path:len()
		if path_width > max_width then
			path = path:sub(1, max_width) .. "…"
		else
			path = path:sub(1, path_width)
		end
		return path
	end

	local get_filetype_icon = function()
		local file_extension = vim.fn.expand("%:e")
		local file_name = string.lower(vim.fn.expand("%:t"))
		local icons_ok, icons = pcall(require, "nvim-web-devicons")
		if not icons_ok then
			return "/"
		else
			local icon_color_ok, icon, color = pcall(icons.get_icon_color, file_name, file_extension)
			if not icon_color_ok or icon == nil or icon == "" then
				return ""
			end
			local hl_group_name = "WinbarIcon_" .. (file_extension ~= "" and file_extension or file_name)
			vim.api.nvim_set_hl(0, hl_group_name, { fg = color })
			return string.format("%%#%s#%s%%*", hl_group_name, icon)
		end
	end

	local show_winbar = function()
		if excludes() then
			return
		end
		local filetype_icon = " " .. get_filetype_icon() .. " "
		local file_path_clean = clean_filepath(vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h"))
		local file_name = vim.fn.expand("%:t")
		local separator = " 〉"
		local location = "%{%v:lua.require'nvim-navic'.get_location()%}"
		local value = string.format("%s%s%s%s%s", file_path_clean, filetype_icon, file_name, separator, location)
		local set_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
		if not set_ok then
			return
		end
	end

	local default_winbar_value = function()
		local file_path = vim.fn.expand("%:p")
		if file_path == "" then
			return
		end
		local filetype_icon = " " .. get_filetype_icon() .. " "
		if filetype_icon == "  " then -- if filetype icon not available, then no need to toggle winbar
			return nil
		end
		local file_path_clean = clean_filepath(file_path)
		local file_name = vim.fn.expand("%:t")
		local separator = " 〉"
		local location = "…"
		local value = string.format("%s%s%s%s%s", file_path_clean, filetype_icon, file_name, separator, location)
		return value
	end

	require("modules.utils").load_plugin("nvim-navic", {
		icons = require("modules.utils.icons").get("kind_space"),
		highlight = true,
		separator = " 〉",
		depth_limit = 0,
		depth_limit_indicator = "…",
	})
	-- This autocmd is used to show winbar even for those buffer without lsp attached
	-- TODO: Better handler popup
	vim.api.nvim_create_autocmd({ "DirChanged", "BufWinEnter", "BufFilePost" }, {
		group = vim.api.nvim_create_augroup("LspAttach_navic", { clear = true }),
		callback = function()
			if string.sub(vim.api.nvim_buf_get_name(0), 1, 1) == "/" and vim.wo.winbar == "" then
				-- otherwise, there is a ">" above separator
				local default_value = default_winbar_value()
				if default_value ~= nil then
					vim.wo.winbar = default_value
				end
			end
		end,
	})
	vim.api.nvim_create_autocmd({ "WinEnter" }, {
		group = "LspAttach_navic",
		callback = function()
			if (vim.bo.filetype == "VistaNvim") or (vim.bo.filetype == "NvimSeparator") then
				return
			end
			show_winbar()
		end,
	})

	vim.api.nvim_create_autocmd({ "LspAttach" }, {
		group = "LspAttach_navic",
		callback = function(args)
			if not (args.data and args.data.client_id) then
				return
			end
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client.server_capabilities.documentSymbolProvider then
				if client.name ~= "pyright" then
					navic.attach(client, args.buf)
					show_winbar()
				end
			end
		end,
	})
end
