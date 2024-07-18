-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["colorscheme"] = "onedark"

-- Mode
settings["mode"] = "full"

-- Set to cmp menu max width
---@type number
settings["cmp_max_width"] = 45

settings["diagnostics_virtual_text"] = false
settings["format_on_save"] = false

local server_lsp_deps = {
	"pyright",
	"jedi_language_server",
}

local full_lsp_deps = {
	"bashls",
	"clangd",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"jedi_language_server",
	"gopls",
}

local server_null_ls_deps = {
	"prettier",
	"stylua",
	"ruff",
}

local full_null_ls_deps = {
	"clang_format",
	"gofumpt",
	"goimports",
	"prettier",
	"shfmt",
	"stylua",
	"vint",
}

local base_disabled_plugins = {
	"fatih/vim-go",
	"m4xshen/autoclose.nvim",
	"max397574/better-escape.nvim",
	"ojroques/nvim-bufdel",
	"romainl/vim-cool",
	"stevearc/aerial.nvim",
	"goolord/alpha-nvim",
	"zbirenbaum/neodim",
	"dstein64/nvim-scrollview",
	"edluffy/specs.nvim",
	"nvim-tree/nvim-tree.lua",
	"NvChad/nvim-colorizer.lua",
	"nvim-treesitter/nvim-treesitter-context",
	"ahmedkhalf/project.nvim",
	"hrsh7th/cmp-nvim-lua",
	"tzachar/local-highlight.nvim",
	"ibhagwan/smartyank.nvim",
}
local server_specific_plugins = {
	"LunarVim/bigfile.nvim",
	"hrsh7th/cmp-nvim-lua",
	"andersevenrud/cmp-tmux",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-buffer",
	"kdheepak/cmp-latex-symbols",
	"ray-x/cmp-treesitter",
	"Exafunction/codeium.nvim",
	"tzachar/cmp-tabnine",
	"Wansmer/treesj",
	"nvim-treesitter/playground",
	"RRethy/nvim-treesitter-endwise",
	"andymass/vim-matchup",
	"mfussenegger/nvim-treehopper",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"windwp/nvim-ts-autotag",
	"ziontee113/syntax-tree-surfer",
	"lervag/vimtex",
	"KeitaNakamura/tex-conceal.vim",
	"jbyuki/nabla.nvim",
	"ellisonleao/glow.nvim",
	"nvim-orgmode/orgmode",
	"akinsho/org-bullets.nvim",
	"lukas-reineke/headlines.nvim",
	"dhruvasagar/vim-table-mode",
	"folke/neodev.nvim",
	"CRAG666/code_runner.nvim",
	"kaarmu/typst.vim",
	"NeogitOrg/neogit",
	"neomake/neomake",
	"sidebar-nvim/sidebar.nvim",
	"m4xshen/hardtime.nvim",
	"folke/tokyonight.nvim",
	"uga-rosa/ccc.nvim",
	"AckslD/nvim-neoclip.lua",
	"jackMort/ChatGPT.nvim",
	"tzachar/local-highlight.nvim",
	"echasnovski/mini.align",
	"karb94/neoscroll.nvim",
	"kylechui/nvim-surround",
	"folke/paint.nvim",
	"mrjones2014/smart-splits.nvim",
}

local function merge_lists(base_list, additional_list)
	local merged_list = {}
	local unique_check = {}
	for _, item in ipairs(base_list) do
		table.insert(merged_list, item)
		unique_check[item] = true
	end
	for _, item in ipairs(additional_list) do
		if not unique_check[item] then
			table.insert(merged_list, item)
		end
	end
	return merged_list
end

local function update_settings_for_mode(mode, base_config, specific_config, merge_type)
	if mode == "full" then
		return base_config
	elseif mode == "server" then
		if merge_type == "merge" then
			return merge_lists(base_config, specific_config)
		elseif merge_type == "use-specific" then
			return specific_config
		else
			error("Unknown merge_type: " .. merge_type)
		end
	else
		error("Unknown mode: " .. mode)
	end
end

settings.disabled_plugins =
	update_settings_for_mode(settings.mode, base_disabled_plugins, server_specific_plugins, "merge")
settings.lsp_deps = update_settings_for_mode(settings.mode, full_lsp_deps, server_lsp_deps, "use-specific")
settings.null_ls_deps = update_settings_for_mode(settings.mode, full_null_ls_deps, server_null_ls_deps, "use-specific")

return settings
