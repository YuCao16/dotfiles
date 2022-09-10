--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
	impatient.enable_profile()
end

local oks = {

	-- core
	["options"] = pcall(require, "core.options"),
	["plugins"] = pcall(require, "core.plugins"),
	["colorscheme"] = pcall(require, "core.colorscheme"),
	["highlight"] = pcall(require, "core.highlight"),
	["mappings"] = pcall(require, "core.mappings"),
	["autocmd"] = pcall(require, "core.autocmd"),
	["functions"] = pcall(require, "core.functions"),

	-- configs
	["vimplugin_setting"] = pcall(require, "configs.vimplugin_configs"),
	["dashboard"] = pcall(require, "configs.dashboard"),
	["nvimtree"] = pcall(require, "configs.nvimtree"),
	["lualine"] = pcall(require, "configs.lualine"),
	["bufferline"] = pcall(require, "configs.bufferline"),
	["treesitter"] = pcall(require, "configs.treesitter"),
	["telescope"] = pcall(require, "configs.telescope"),

	-- Move to plugin for lazy loading
	-- ["gitsigns"] = pcall(require, "configs.gitsign"),
	-- ["lsp"] = pcall(require, "configs.lsp"),
	-- ["Dap"] = pcall(require, "configs.dap"),

	-- currenyly not using
	-- ["coc"] = pcall(require, "configs.coc"),
	-- ["neotree"] = pcall(require, "configs.neotree"),
}

notif_ok, vim.notify = pcall(require, "notify")
require("notify").setup({
	on_open = function(win)
		-- set vim.notify() not focusable
		-- vim.api.nvim_win_set_config(win, { focusable = false })
	end,
})

for name, item in pairs(oks) do
	local ok, _ = item
	if not ok and notif_ok then
		vim.notify(name .. " failed", "error", { title = name .. ".lua", render = "minimal" })
	end
end

-- require("impatient") --speed up start up
-- require("general_settings") -- neovim general settings
-- require("plugins") -- all plugins and some configs using packer.nvim
-- require("colorscheme") -- custom colorscheme, gitsigns and github.theme
-- require("bubbles") -- custom lualine
-- require("luaplugin_setting") -- dashboard and orgmode configurations
-- require("vimplugin_setting") -- vim plugins settings
-- require("mappings") -- custom mappings
-- require("autocmd") -- custom auto commands
-- require("functions") -- custom functions
-- require("coc") -- coc.nvim configurations and keybindings
-- vim.cmd("source $HOME/.config/nvim/settings.vim")
