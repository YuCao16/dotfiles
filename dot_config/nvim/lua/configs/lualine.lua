-- Bubbles config for lualine

local navic = require('nvim-navic')

-- Allows display of word count in md/text files
local function getWords()
	if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
		if vim.fn.wordcount().visual_words == 1 then
			return tostring(vim.fn.wordcount().visual_words) .. " word"
		elseif not (vim.fn.wordcount().visual_words == nil) then
			return tostring(vim.fn.wordcount().visual_words) .. " words"
		else
			return tostring(vim.fn.wordcount().words) .. " words"
		end
	else
		return vim.opt.fileencoding:get()
	end
end

function Split(s, delimiter)
	result = {}
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end

local function getPath()
	local filepath = vim.fn.expand("%:p")
	split_string = Split(filepath, "/")
	filename = split_string[#split_string]
	-- filename = vim.fn.expand('%:t')
	if string.len(filepath) < 50 then
		return filepath
	elseif vim.bo.filetype == "help" then
		return filename
	else
		return filename
	end
end

local function navic_location()
	local none_display = "🙈🙊🙉"
	if navic.is_available() then
		local l = navic.get_location()
		return (l ~= "") and l or none_display
	else
		return none_display
	end
end

local winbar = {
	lualine_a = {
		{ navic_location },
	},
}

-- I don't know how to center this line in lualine
local function showLsp()
	local msg = " LSP: No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return " LSP:" .. client.name
		end
	end
	return msg
end

require("lualine").setup({
	options = {
		component_separators = "|",
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		-- lualine_c = { getPath },
		lualine_c = { showLsp },
		lualine_x = { getWords },
		lualine_y = { "filetype", "filesize", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = { "toggleterm", "nvim-tree", "nvim-dap-ui" },
	-- winbar = winbar,
})
