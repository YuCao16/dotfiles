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
}

return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })

		-- "-------------------=== Core ===-------------
		use({
			"neoclide/coc.nvim",
			branch = "release",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"sidebar-nvim/sidebar.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("configs.sidebar")
			end,
		})
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("toggleterm").setup()
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("configs.bufferline")
			end,
		})
		use({ "glepnir/dashboard-nvim" })
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "nvim-lua/plenary.nvim" },
			-- config = function()
			-- 	require("configs.nvimtree")
			-- end,
		})
		use({ "lewis6991/impatient.nvim" })

		-- use({"nvim-neo-tree/neo-tree.nvim"})
		-- use { 'dstein64/vim-startuptime' }
		-- use({ "mhinz/vim-startify", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Utile ===-------------
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
		use({ "antoinemadec/FixCursorHold.nvim" })
		use({
			"famiu/bufdelete.nvim",
		})
		use({
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup()
			end,
		})
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
		use({ "camspiers/lens.vim", event = { "WinNew" } })
		use({ "https://gitlab.com/yorickpeterse/nvim-window.git", event = { "WinNew" } })
		use({
			"kevinhwang91/nvim-hlslens",
		})
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
		})
		use({
			"RRethy/vim-illuminate", -- highlight other uses of the current word under the cursor
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			require("illuminate").configure({
				filetypes_denylist = {
					"NvimTree",
					"dashboard",
					"SidebarNvim",
				},
			}),
		})
		use({
			"gbprod/substitute.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = workflow_filetype,
			config = function()
				require("substitute").setup()
			end,
		})
		use({ "yucao16/registers.nvim" })

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
		--
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
			"nvim-telescope/telescope-file-browser.nvim",
			config = function()
				require("telescope").load_extension("file_browser")
			end,
		})
		use({
			"crispgm/telescope-heading.nvim",
			config = function()
				require("telescope").load_extension("heading")
			end,
		})

		-- "-------------------=== Treesitter ===-------------
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use({ "RRethy/nvim-treesitter-endwise" })
		use({
			"romgrk/nvim-treesitter-context",
			config = function()
				require("treesitter-context").setup()
			end,
		})
		use({ "p00f/nvim-ts-rainbow", event = { "BufAdd", "InsertEnter" } })
		use({ "nvim-treesitter/playground", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Code/Project navigation ===-------------
		use({ "majutsushi/tagbar", ft = workflow_filetype })
		use({ "github/copilot.vim", ft = { "python", "markdown", "tex" } })
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
		use({ "honza/vim-snippets", after = "coc.nvim" }) -- snippets collections

		-- use({
		-- 	"simrat39/symbols-outline.nvim",
		-- 	ft = workflow_filetype,
		-- 	config = function()
		-- 		require("symbols-outline").setup()
		-- 	end,
		-- })
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

		use({ "goerz/jupytext.vim", ft = { "markdown", "tex", "ipynb" } })

		-- use({
		-- 	"iamcco/markdown-preview.nvim",
		-- 	run = function()
		-- 		vim.fn["mkdp#util#install"]()
		-- 	end,
		-- 	ft = { "markdown", "tex", "ipynb" },
		-- })
		-- use({ "dkarter/bullets.vim", ft = { "markdown", "tex", "latex" } })
		-- use("vim-pandoc/vim-pandoc")
		-- use({ "cmhughes/latexindent.pl", ft = { "markdown", "tex", "ipynb", "org" } })
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
		use({ "projekt0n/github-nvim-theme" })
		use({ "rebelot/kanagawa.nvim" })
		use({ "Mofiqul/vscode.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/everforest", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/sonokai", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/edge", event = { "BufAdd", "InsertEnter" } })
		use({ "yucao16/monokai_transparent", event = { "BufAdd", "InsertEnter" } })
		use({ "folke/tokyonight.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "EdenEast/nightfox.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "catppuccin/nvim", event = { "BufAdd", "InsertEnter" } })

		-- use({ "rose-pine/neovim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "marko-cerovac/material.nvim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "arcticicestudio/nord-vim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "ryanoasis/vim-devicons", event = { "BufAdd", "InsertEnter" } }) -- " Beautiful Icon
		-- use({ "joshdick/onedark.vim", event = { "BufAdd", "InsertEnter" } })
		-- use { 'navarasu/onedark.nvim' }
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
		use({ "neovim/nvim-lspconfig", event = { "BufAdd", "InsertEnter" } })
		use({ "williamboman/nvim-lsp-installer" })

		-- use { 'ray-x/lsp_signature.nvim',
		-- 	config = function ()
		-- 		require "lsp_signature".setup()
		--
		-- 	end
		-- }

		-- "-------------------=== Other ===-------------------------------
		use({ "ThePrimeagen/vim-be-good", event = { "BufAdd", "InsertEnter" } }) -- game
		use({ "neomake/neomake", event = { "BufAdd", "InsertEnter" } })

		-- use({ "tami5/sqlite.lua" })
		-- " use 'TaDaa/vimade'                       " Eye Protection
		-- use({ "tjdevries/train.nvim", event = { "BufAdd", "InsertEnter" } })
		-- use({ "svermeulen/vimpeccable", event = { "BufAdd", "InsertEnter" } })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		-- compile_path = "~/.local/share/packer_compiled/packer_compiled.lua",
		-- compile_path = vim.fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
	},
})
