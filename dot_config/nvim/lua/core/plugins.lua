--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

local workflow_filetype = {
	"python",
	"markdown",
	"tex",
	"latex",
	"ipynb",
	"org",
	"json",
	"html",
	"javascript",
	"css",
	"lua",
	"cc",
	"cpp",
	"c",
	"vim",
}

return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })

		-- "-------------------=== Core ===-------------
		use({ "lewis6991/impatient.nvim" })
		use({ "glepnir/dashboard-nvim" })
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("toggleterm").setup({
					float_opts = {
						border = "rounded",
					},
				})
			end,
		})

		-- use({
		-- 	"neoclide/coc.nvim",
		-- 	branch = "release",
		-- 	event = { "BufAdd", "InsertEnter" },
		-- 	ft = workflow_filetype,
		-- })
		-- use({"nvim-neo-tree/neo-tree.nvim"})
		-- use({ "dstein64/vim-startuptime" })
		-- use({ "mhinz/vim-startify", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Nvim Fix/Improve ===-------------
		use({ "antoinemadec/FixCursorHold.nvim" })
		use({ "famiu/bufdelete.nvim" })
		use({
			"karb94/neoscroll.nvim",
			ft = workflow_filetype,
			event = { "BufAdd", "InsertEnter" },
			config = function()
				require("neoscroll").setup()
			end,
		})
		use({
			"gbprod/cutlass.nvim",
			config = function()
				require("cutlass").setup({ cut_key = "c" })
			end,
		})

		-- "-------------------=== Util ===-------------
		use({
			"sidebar-nvim/sidebar.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("configs.sidebar")
			end,
		})
		use({
			"petertriho/nvim-scrollbar",
			event = { "WinScrolled" },
			ft = workflow_filetype,
			config = function()
				require("scrollbar").setup()
			end,
		})
		use({
			"folke/zen-mode.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("zen-mode").setup({
					window = {
						width = 0.75, -- width will be 75% of the editor width
					},
				})
			end,
		})
		use({
			"folke/which-key.nvim",
			ft = workflow_filetype,
			event = { "CmdlineEnter", "InsertEnter", "BufAdd" },
			config = function()
				require("which-key").setup({
					window = {
						border = "rounded",
					},
				})
			end,
		})
		use({
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup()
			end,
		})
		use({ "camspiers/lens.vim", event = { "WinNew" } })
		use({ "https://gitlab.com/yorickpeterse/nvim-window.git", event = { "WinNew" } })
		use({ "kevinhwang91/nvim-hlslens" })
		use({
			"Shatur/neovim-session-manager",
			config = function()
				require("session_manager").setup({
					autoload_mode = false,
					-- sessions_dir = "~/.local/share/nvim/sessions/",
				})
			end,
		})
		use({
			"ethanholz/nvim-lastplace",
			config = function()
				require("nvim-lastplace").setup()
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			ft = workflow_filetype,
			event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
			config = function()
				require("configs.gitsign")
			end,
		})
		use({ "yucao16/registers.nvim" })

		-- use({ "RRethy/vim-illuminate" })
		-- use({
		-- 	"RRethy/vim-illuminate", -- highlight other uses of the current word under the cursor
		-- 	event = { "BufAdd", "InsertEnter" },
		-- 	ft = workflow_filetype,
		-- 	require("illuminate").configure({
		-- 		filetypes_denylist = {
		-- 			"NvimTree",
		-- 			"dashboard",
		-- 			"SidebarNvim",
		-- 		},
		-- 	}),
		-- })
		-- use({
		-- 	"gbprod/substitute.nvim",
		-- 	event = { "BufAdd", "InsertEnter" },
		-- 	ft = workflow_filetype,
		-- 	config = function()
		-- 		require("substitute").setup()
		-- 	end,
		-- })
		-- use({ "camspiers/animate.vim", event = { "BufAdd" } }) -- " window resizer
		-- use({ "junegunn/limelight.vim", event = { "BufAdd", "InsertEnter" } })
		-- use({
		-- 	"yucao16/nvim-peekup", -- register
		-- 	config = function()
		-- 		require("nvim-peekup.config").on_keystroke["delay"] = "100ms"
		-- 	end,
		-- })
		-- use({ "junegunn/fzf" })
		-- use({ "junegunn/fzf.vim" }) -- " Search Tools
		-- use({ "tmhedberg/SimpylFold", event = { "BufAdd", "InsertEnter" } })
		-- use({ "folke/twilight.nvim" })
		-- use({ "sindrets/winshift.nvim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "tpope/vim-repeat", event = { "BufAdd", "InsertEnter" } })
		-- use({
		-- 	"rmagatti/auto-session",
		-- 	config = function()
		-- 		local opts = {
		-- 			log_level = "info",
		-- 			auto_session_enable_last_session = false,
		-- 			auto_session_root_dir = vim.fn.stdpath("data") .. "/session/",
		-- 			auto_session_enabled = true,
		-- 			auto_save_enabled = false,
		-- 			auto_restore_enabled = false,
		-- 			auto_session_suppress_dirs = nil,
		-- 		}
		-- 		require("auto-session").setup(opts)
		-- 	end,
		-- })
		-- use({ "anuvyklack/nvim-keymap-amend" })
		-- use({
		-- 	"anuvyklack/fold-preview.nvim",
		-- 	requires = "anuvyklack/keymap-amend.nvim",
		-- 	config = function()
		-- 		require("fold-preview").setup()
		-- 	end,
		-- })
		-- use({
		-- 	"Pocco81/true-zen.nvim",
		-- 	config = function()
		-- 		require("true-zen").setup({
		-- 			-- your config goes here
		-- 			-- or just leave it empty :)
		-- 		})
		-- 	end,
		-- })

		-- "-------------------=== Telescope ===-------------
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({
			"crispgm/telescope-heading.nvim",
			ft = workflow_filetype,
			config = function()
				require("telescope").load_extension("heading")
			end,
		})

		-- use({
		-- 	"nvim-telescope/telescope-file-browser.nvim",
		-- 	config = function()
		-- 		require("telescope").load_extension("file_browser")
		-- 	end,
		-- })

		-- "-------------------=== Treesitter ===-------------
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use({ "RRethy/nvim-treesitter-endwise" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({ "p00f/nvim-ts-rainbow" })
		use({ "nvim-treesitter/playground", event = { "BufAdd", "InsertEnter" } })

		-- use({ "romgrk/nvim-treesitter-context" })

		-- "-------------------=== Code/Project navigation ===-------------
		use({ "majutsushi/tagbar", ft = workflow_filetype })
		-- use({ "github/copilot.vim", ft = { "python", "markdown", "tex" } })
		use({
			"windwp/nvim-autopairs",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("configs.autopairs")
			end,
		})
		use({
			"anuvyklack/pretty-fold.nvim",
			ft = { "python", "lua" },
			config = function()
				require("pretty-fold").setup()
			end,
		})
		use({
			"sbdchd/neoformat", -- " Format everything
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"folke/todo-comments.nvim",
			config = function()
				require("todo-comments").setup()
			end,
		})
		use({
			"mg979/vim-visual-multi",
			branch = "master",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("configs.indent-line")
			end,
		})
		use({
			"michaelb/sniprun",
			run = "bash install.sh",
			ft = workflow_filetype,
			config = function()
				require("sniprun").setup({
					display = { "NvimNotify" },
					display_options = {
						notification_timeout = 10, -- timeout for nvim_notify output
					},
				})
			end,
		})
		use({
			"kylechui/nvim-surround",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		})
		use({
			"simrat39/symbols-outline.nvim",
			ft = workflow_filetype,
			config = function()
				require("configs.symbols_outline")
			end,
		})

		-- use({ "APZelos/blamer.nvim", ft = workflow_filetype })
		-- use({ "honza/vim-snippets", after = "coc.nvim" }) -- snippets collections
		-- use({ "junegunn/vim-easy-align", event = { "BufAdd", "InsertEnter" } })
		-- use({ "weilbith/nvim-code-action-menu" }) -- code action popup, but there is no quickif x for python
		-- " use 'sirver/ultisnips'
		-- use({
		-- 	"lewis6991/spellsitter.nvim",
		-- 	ft = { "markdown", "latex", "org" },
		-- 	config = function()
		-- 		require("spellsitter").setup({
		-- 			enable = true,
		-- 		})
		-- 	end,
		-- })

		-- "-------------------=== Debugging navigation ===-------------
		use({ "mfussenegger/nvim-dap" })
		use({
			"rcarriga/nvim-dap-ui",
			-- config = function()
			-- 	require("dapui").setup()
			-- end,
		})
		use({
			"mfussenegger/nvim-dap-python",
			ft = { "python" },
			config = function()
				require("dap-python").setup("/usr/bin/python3")
				require("dapui").setup()
			end,
		})
		-- use({ "Pocco81/dap-buddy.nvim" })

		-- "-------------------=== Languages plugins ===-------------------
		use({ "lervag/vimtex", ft = { "markdown", "tex", "ipynb", "org" } }) -- " LaTex
		use({ "KeitaNakamura/tex-conceal.vim", ft = { "markdown", "tex", "ipynb", "org" } })
		use({ "jbyuki/nabla.nvim", ft = { "markdown", "tex", "ipynb", "org" } })

		use({ "plasticboy/vim-markdown", ft = { "markdown", "tex", "ipynb" } }) -- " MarkDown
		use({
			"ellisonleao/glow.nvim",
			ft = { "markdown" },
			config = function()
				require("glow").setup({
					border = "rounded",
				})
			end,
		})

		use({ "chrisbra/csv.vim", ft = { "csv" } }) -- " CSV

		use({ -- Neorg
			"nvim-neorg/neorg",
			ft = "norg",
			after = "nvim-treesitter",
			config = function()
				require("neorg").setup()
			end,
		})

		use({
			"nvim-orgmode/orgmode", -- " ORG
			ft = { "org", "orgmode" },
			config = function()
				require("orgmode").setup_ts_grammar()
				require("orgmode").setup({
					org_highlight_latex_and_related = "entities",
					-- org_agenda_files = {'~/Dropbox/org/*', '~/org/**/*'},
					org_agenda_files = { "~/Dropbox/org/*" },
					-- org_indent_mode = 'noindent',
				})
			end,
		})
		use({
			"akinsho/org-bullets.nvim",
			after = "orgmode",
			config = function()
				require("configs.org-bullets")
			end,
		})
		use({
			"dhruvasagar/vim-table-mode",
			ft = { "markdown", "tex", "ipynb", "org" },
			event = { "BufAdd", "InsertEnter" },
		})

		-- use({ "goerz/jupytext.vim", ft = { "markdown", "tex", "ipynb" } })
		-- use({
		-- 	"iamcco/markdown-preview.nvim",
		-- 	run = function()
		-- 		vim.fn["mkdp#util#install"]()
		-- 	end,
		-- 	ft = { "markdown", "tex", "ipynb" },
		-- })
		-- use({ "dkarter/bullets.vim", ft = { "markdown", "tex", "latex" } })
		-- use({
		-- 	"godlygeek/tabular",
		-- 	ft = { "markdown", "tex", "ipynb", "org", "json" },
		-- 	event = { "BufAdd", "InsertEnter" },
		-- })
		-- use({
		-- 	"lukas-reineke/headlines.nvim",
		-- 	config = function()
		-- 		require("headlines").setup()
		-- 	end,
		-- })

		-- "-------------------=== Color/Theme ===-------------------
		use("machakann/vim-highlightedyank") --highlight yank (copyed line/lines) region
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({
			"xiyaowong/nvim-transparent",
			event = { "BufAdd", "InsertEnter" },
			config = function()
				require("configs.transparent")
			end,
		})
		use({ "kyazdani42/nvim-web-devicons" })

		-- "-------------------=== ColorScheme ===-------------------
		use({ "projekt0n/github-nvim-theme" })
		use({ "rebelot/kanagawa.nvim" })
		use({ "catppuccin/nvim" })
		use({ "sainnhe/sonokai", event = { "BufAdd", "InsertEnter" } })
		use({ "EdenEast/nightfox.nvim", event = { "BufAdd", "InsertEnter" } })

		-- use({ "yucao16/monokai_transparent", event = { "BufAdd", "InsertEnter" } })
		-- use({ "Mofiqul/vscode.nvim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "folke/tokyonight.nvim", event = { "BufAdd", "InsertEnter" } })

		-- use({ "sainnhe/edge", event = { "BufAdd", "InsertEnter" } })
		-- use({ "sainnhe/everforest", event = { "BufAdd", "InsertEnter" } })
		-- use({ "rose-pine/neovim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "marko-cerovac/material.nvim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "arcticicestudio/nord-vim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "ryanoasis/vim-devicons", event = { "BufAdd", "InsertEnter" } }) -- " Beautiful Icon
		-- use({ "joshdick/onedark.vim", event = { "BufAdd", "InsertEnter" } })
		-- use { 'navarasu/onedark.nvim' }
		-- use({ "lunarvim/horizon.nvim" })
		-- use({ "ayu-theme/ayu-vim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "dracula/vim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "sickill/vim-monokai", event = { "BufAdd", "InsertEnter" } })
		-- use({ "tomasiser/vim-code-dark", event = { "BufAdd", "InsertEnter" } })
		-- use({ "sainnhe/gruvbox-material", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== UI ===-------------------------------
		use({ "nvim-lua/plenary.nvim" })
		use({ "rcarriga/nvim-notify" })
		use({ "MunifTanjim/nui.nvim" })

		-- use({ "RishabhRD/popfix" })

		-- "-------------------=== LSP ===-------------------------------
		-- NOTE:
		-- The loading structure below is:
		-- First load mason based on rules:
		-- 1. filetype
		-- 2. event: CmdlineEnter, InsertEnter
		-- If ruled satisfied, then a list of plugins such as mason-lspconfig will be loaded
		-- Secondly, nvim-lspconfig will be loaded and then load config file: configs.lsp
		-- Finally, nvim-cmp will be loaded after lsp being configed, a list of cmp plugins
		-- will be loaded as well.
		-- NOTE: If mason not be loaded, a list of event(plugins loaded) will not happen.
		-- so if add one programming language server, be aware of adding filetype to
		-- workflow_filetype list!
		use({
			"neovim/nvim-lspconfig",
			after = {
				"mason.nvim",
				"mason-lspconfig.nvim",
				"null-ls.nvim",
				"lsp_signature.nvim",
				"lspsaga.nvim",
				"fidget.nvim",
				"nvim-navic",
			},
			config = function()
				pcall(require, "configs.lsp")
			end,
		})
		use({
			"williamboman/mason.nvim",
			ft = workflow_filetype,
			event = { "CmdlineEnter", "InsertEnter", "CursorHold" },
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			after = "mason.nvim",
		})
		use({ "glepnir/lspsaga.nvim", branch = "main", after = "mason.nvim" })
		use({ "jose-elias-alvarez/null-ls.nvim", after = "mason.nvim" })

		use({
			"j-hui/fidget.nvim",
			after = "mason.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})
		use({
			"ray-x/lsp_signature.nvim",
			after = "mason.nvim",
		})
		use({
			"folke/trouble.nvim",
			ft = workflow_filetype,
			config = function()
				require("trouble").setup({
					mode = "document_diagnostics",
				})
			end,
		})
		use({
			"SmiteshP/nvim-navic",
			-- requires = "neovim/nvim-lspconfig",
			after = "mason.nvim",
			config = function()
				require("configs.navic").enable()
			end,
		})

		-- use({
		-- 	"b0o/incline.nvim",
		-- 	config = function()
		-- 		require("configs.incline")
		-- 	end,
		-- })
		-- use({ "jubnzv/virtual-types.nvim" })
		-- use({
		-- 	"ray-x/navigator.lua",
		-- 	requires = {
		-- 		{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		-- 		{ "neovim/nvim-lspconfig" },
		-- 	},
		-- })
		-- "-------------------=== CMP ===-------------------------------
		use({
			"hrsh7th/nvim-cmp",
			-- event = { "CmdlineEnter", "InsertEnter" },
			-- ft = workflow_filetype,
			after = "nvim-lspconfig",
			config = function()
				cmp_ok, _ = pcall(require, "configs.lsp.cmp")
				if not cmp_ok then
					vim.notify("cmp loading failed", "error", { title = "configs/lsp/cmp.lua", render = "minimal" })
				end
			end,
		})
		use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp", ft = workflow_filetype })
		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
		use({ "kdheepak/cmp-latex-symbols", ft = { "latex", "tex" } })
		use({ "folke/lua-dev.nvim" })

		-- use({ "weilbith/nvim-code-action-menu" })
		-- use({ "hrsh7th/cmp-buffer" })
		-- use({ "uga-rosa/cmp-dictionary" })

		-- "-------------------=== Snippets ===-------------------------------
		use({ "L3MON4D3/LuaSnip" })
		use({ "rafamadriz/friendly-snippets", event = { "VimLeave" } })

		-- "-------------------=== Other ===-------------------------------
		use({ "neomake/neomake", event = { "BufAdd", "InsertEnter" } })

		-- use({ "ThePrimeagen/vim-be-good", event = { "BufAdd", "InsertEnter" } }) -- game
		-- use({ "tami5/sqlite.lua" })
		-- " use 'TaDaa/vimade'                       " Eye Protection
		-- use({ "tjdevries/train.nvim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "svermeulen/vimpeccable", event = { "BufAdd", "InsertEnter" } })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
	},
})
