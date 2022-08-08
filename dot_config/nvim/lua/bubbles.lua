-- Bubbles config for lualine

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
	local filepath = vim.fn.expand('%:p')
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
		lualine_c = { getPath },
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
})
