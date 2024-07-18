_G._command_panel = function()
	require("telescope.builtin").keymaps({
		lhs_filter = function(lhs)
			return not string.find(lhs, "Þ")
		end,
		layout_config = {
			width = 0.6,
			height = 0.6,
			prompt_position = "bottom",
		},
	})
end

_G._flash_esc_or_noh = function()
	local flash_active, state = pcall(function()
		return require("flash.plugins.char").state
	end)
	if flash_active and state then
		state:hide()
	else
		pcall(vim.cmd.noh)
	end
end

local _lazygit = nil
_G._toggle_lazygit = function()
	if vim.fn.executable("lazygit") == 1 then
		if not _lazygit then
			_lazygit = require("toggleterm.terminal").Terminal:new({
				cmd = "lazygit",
				direction = "float",
				close_on_exit = true,
				hidden = true,
			})
		end
		_lazygit:toggle()
	else
		vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
	end
end

local _runcode = nil
_G._toggle_runcode = function()
	if vim.fn.executable("python") == 1 then
		if not _lazygit then
			_runcode = require("toggleterm.terminal").Terminal:new({
				cmd = "python " .. vim.fn.expand("%:p"),
				direction = "horizontal",
				close_on_exit = false,
				hidden = false,
			})
		end
		_runcode:toggle()
	else
		vim.notify("Command [python] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
	end
end
