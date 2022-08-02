--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function()
		use({ "wbthomason/packer.nvim" })

		-- "-------------------=== Core ===-------------
		use({
			"neoclide/coc.nvim",
			branch = "release",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "tex", "ipynb", "org", "json", "html", "lua" },
		})
		use({ "majutsushi/tagbar", ft = { "python", "markdown", "tex", "ipynb", "org" } })
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("lualine").setup({
					options = {
						theme = "auto",
					},
				})
			end,
		})
		use({
			"sidebar-nvim/sidebar.nvim",
			event = { "BufAdd", "InsertEnter" },
			config = function()
				require("sidebar-nvim").setup({
					sections = {
						"datetime",
						"git",
						"symbols",
						"todos",
						"files",
						"buffers",
					},
					symbols = {
						icon = "ƒ",
					},
				})
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
				require("bufferline").setup({
					options = {
						close_command = "Bdelete!",
						-- left_mouse_command = "Bdelete! %d",
					},
				})
			end,
		})
		use({ "glepnir/dashboard-nvim" })
		use({
			"petertriho/nvim-scrollbar",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "tex", "ipynb", "org" },
			config = function()
				require("scrollbar").setup()
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("nvim-tree").setup({
					auto_close = ture,
					-- show_on_startup = true,
					view = {
						hide_root_folder = false,
					},
					filters = {
						dotfiles = true,
					},
					git = {
						enable = true,
						ignore = true,
					},
					view = {
						width = 30,
					},
					actions = {
						open_file = {
							quit_on_open = false,
							resize_window = false,
						},
					},
				})
			end,
		})
		use({ "lewis6991/impatient.nvim" })
		-- use({ "mhinz/vim-startify", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Utile ===-------------
		use({
			"folke/zen-mode.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "tex", "ipynb", "org" },
			config = function()
				require("zen-mode").setup({
					window = {
						width = 0.75, -- width will be 85% of the editor width
					},
				})
			end,
		})
		use({
			"Pocco81/true-zen.nvim",
			config = function()
				require("true-zen").setup({
					-- your config goes here
					-- or just leave it empty :)
				})
			end,
		})
		-- use { 'github/copilot.vim', ft = {"python", "markdown", "tex"} }
		use({ "antoinemadec/FixCursorHold.nvim" })
		use({ "famiu/bufdelete.nvim", event = { "BufAdd" } })
		use({ "anuvyklack/nvim-keymap-amend" })
		use({
			"anuvyklack/fold-preview.nvim",
			requires = "anuvyklack/keymap-amend.nvim",
			config = function()
				require("fold-preview").setup()
			end,
		})
		use({
			"anuvyklack/pretty-fold.nvim",
			config = function()
				require("pretty-fold").setup({})
			end,
		})
		use({
			"karb94/neoscroll.nvim",
			-- event = { "BufAdd", "InsertEnter", "VimEnter" },
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
		use({ "camspiers/animate.vim", event = { "BufAdd" } }) -- " window resizer
		use({ "camspiers/lens.vim", event = { "BufAdd" } })
		use({ "https://gitlab.com/yorickpeterse/nvim-window.git", event = { "BufAdd" } })
		use({ "junegunn/limelight.vim", event = { "BufAdd", "InsertEnter" } })
		use({ "kevinhwang91/nvim-hlslens", event = { "BufAdd", "InsertEnter" } })
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
				require("nvim-lastplace").setup({})
			end,
		})
		use({ "lewis6991/gitsigns.nvim" })
		use({ "RRethy/vim-illuminate", event = { "BufAdd", "InsertEnter" } }) --Vim plugin for automatically highlighting other uses of the current word under the cursor

		use({
			"gbprod/substitute.nvim",
			event = { "BufAdd", "InsertEnter" },
			config = function()
				require("substitute").setup()
			end,
		})
		use({
			"gennaro-tedesco/nvim-peekup",
			config = function()
				require("nvim-peekup.config").on_keystroke["delay"] = "100ms"
			end,
		})

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
			-- event = 'BufAdd',
			config = function()
				require("treesitter-context").setup()
			end,
		})
		use({ "p00f/nvim-ts-rainbow", event = { "BufAdd", "InsertEnter" } })
		use({ "nvim-treesitter/playground", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Code/Project navigation ===-------------
		use({
			"windwp/nvim-autopairs",
			-- event = { "BufAdd", "InsertEnter" },
			config = function()
				local remap = vim.api.nvim_set_keymap
				local npairs = require("nvim-autopairs")
				npairs.setup({ map_cr = false })

				-- skip it, if you use another global object
				_G.MUtils = {}
				MUtils.completion_confirm = function()
					-- if vim.fn.pumvisible() ~= 0 then
					if vim.fn["coc#pum#visible"]() ~= 0 then
						return vim.fn["coc#_select_confirm"]()
					else
						return npairs.autopairs_cr()
					end
				end
				remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
			end,
		})
		use({ "sbdchd/neoformat", event = { "BufAdd", "InsertEnter" } }) -- " Format .tex
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({ "mg979/vim-visual-multi", branch = "master", event = { "BufAdd", "InsertEnter" } })
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufAdd", "InsertEnter" },
			config = function()
				vim.opt.termguicolors = true
				vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

				vim.opt.list = true
				vim.opt.listchars:append("eol:↴")
				require("indent_blankline").setup({
					space_char_blankline = " ",
					filetype_exclude = { "dashboard", "lsp-installer" },
					buftype_exclude = { "terminal" },
					char_highlight_list = {
						"IndentBlanklineIndent1",
						"IndentBlanklineIndent2",
						"IndentBlanklineIndent3",
						"IndentBlanklineIndent4",
						"IndentBlanklineIndent5",
						"IndentBlanklineIndent6",
					},
				})
			end,
		})
		use({
			"michaelb/sniprun",
			run = "bash install.sh",
			event = { "BufAdd", "InsertEnter" },
			config = function()
				require("sniprun").setup({
					display = { "NvimNotify" },
					display_options = {
						notification_timeout = 10, -- timeout for nvim_notify output
					},
				})
			end,
		})
		use({ "weilbith/nvim-code-action-menu" }) -- code action popup, but there is no quickif x for python
		use({
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
			event = { "BufAdd", "InsertEnter" },
		})
		use({ "honza/vim-snippets", after = "coc.nvim" }) -- snippets collections

		-- use({ "junegunn/vim-easy-align", event = { "BufAdd", "InsertEnter" } })
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
			-- ft = { "python" },
			-- event = { "BufAdd", "InsertEnter" },
			-- config = function()
			-- 	require("dapui").setup()
			-- end,
		})
		use({ "Pocco81/dap-buddy.nvim" })
		use({
			"mfussenegger/nvim-dap-python",
			ft = { "python" },
			-- event = { "BufAdd", "InsertEnter" },
			config = function()
				require("dap-python").setup("/usr/bin/python3")
			end,
		})

		-- "-------------------=== Languages plugins ===-------------------
		use({ "lervag/vimtex", ft = { "markdown", "tex", "ipynb", "org" } }) -- " LaTex
		use({ "KeitaNakamura/tex-conceal.vim", ft = { "markdown", "tex", "ipynb", "org" } })
		use({ "cmhughes/latexindent.pl", ft = { "markdown", "tex", "ipynb", "org" } })
		use({ "jbyuki/nabla.nvim", ft = { "markdown", "tex", "ipynb", "org" } })

		use({ "plasticboy/vim-markdown", ft = { "markdown", "tex", "ipynb" } }) -- " MarkDown
		use({
			"ellisonleao/glow.nvim",
			ft = { "markdown" },
			config = function()
				require("glow").setup({
					border = "double",
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
		})
		use({
			"akinsho/org-bullets.nvim",
			config = function()
				require("org-bullets").setup({
					concealcursor = true,
					symbols = {
						headlines = { "◉", "○", "✸", "✿" },
						checkboxes = {
							cancelled = { "", "OrgCancelled" },
							todo = { "-", "OrgTODO" },
							done = { "✓", "OrgDone" },
						},
					},
				})
			end,
		})
		use({
			"lukas-reineke/headlines.nvim",
			-- config = function()
			-- 	require("headlines").setup()
			-- end,
		})
		use({
			"dhruvasagar/vim-table-mode",
			ft = { "markdown", "tex", "ipynb", "org" },
			event = { "BufAdd", "InsertEnter" },
		})

		use({ "goerz/jupytext.vim", ft = { "markdown", "tex", "ipynb" } })

		-- use("vim-pandoc/vim-pandoc")
		-- use({
		-- 	"godlygeek/tabular",
		-- 	ft = { "markdown", "tex", "ipynb", "org", "json" },
		-- 	event = { "BufAdd", "InsertEnter" },
		-- })

		-- "-------------------=== Color/Theme ===-------------------
		use({
			"xiyaowong/nvim-transparent",
			event = {
				"BufAdd",
				"InsertEnter",
				config = function()
					require("transparent").setup({
						enable = true, -- boolean: enable transparent
						extra_groups = { -- table/string: additional groups that should be cleared
							-- In particular, when you set it to 'all', that means all available groups

							-- example of akinsho/nvim-bufferline.lua
							"BufferLineTabClose",
							"BufferlineBufferSelected",
							"BufferLineFill",
							"BufferLineBackground",
							"BufferLineSeparator",
							"BufferLineIndicatorSelected",
						},
						exclude = {}, -- table: groups you don't want to clear
					})
				end,
			},
		})

		-- use({ "ryanoasis/vim-devicons", event = { "BufAdd", "InsertEnter" } }) -- " Beautiful Icon
		use({ "kyazdani42/nvim-web-devicons" })

		use({ "projekt0n/github-nvim-theme" })
		use({ "rebelot/kanagawa.nvim" })
		use({ "joshdick/onedark.vim", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/everforest", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/sonokai", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/edge", event = { "BufAdd", "InsertEnter" } })
		use({ "sainnhe/gruvbox-material", event = { "BufAdd", "InsertEnter" } })
		use({ "ayu-theme/ayu-vim", event = { "BufAdd", "InsertEnter" } })
		use({ "arcticicestudio/nord-vim", event = { "BufAdd", "InsertEnter" } })
		use({ "dracula/vim", event = { "BufAdd", "InsertEnter" } })
		use({ "sickill/vim-monokai", event = { "BufAdd", "InsertEnter" } })
		use({ "yucao16/monokai_transparent", event = { "BufAdd", "InsertEnter" } })
		use({ "tomasiser/vim-code-dark", event = { "BufAdd", "InsertEnter" } })
		use({ "marko-cerovac/material.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "olimorris/onedarkpro.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "rose-pine/neovim", event = { "BufAdd", "InsertEnter" } })
		use({ "folke/tokyonight.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "EdenEast/nightfox.nvim", event = { "BufAdd", "InsertEnter" } })
		use({ "catppuccin/nvim", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== UI ===-------------------------------
		use({ "MunifTanjim/nui.nvim" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "RishabhRD/popfix" })
		use("machakann/vim-highlightedyank") --highlight yank region
		use({ "rcarriga/nvim-notify" })

		-- "-------------------=== LSP ===-------------------------------
		use({ "neovim/nvim-lspconfig", event = { "BufAdd", "InsertEnter" } })
		use({ "williamboman/nvim-lsp-installer" })

		-- "-------------------=== Games ===--------------------------
		use({ "ThePrimeagen/vim-be-good", event = { "BufAdd", "InsertEnter" } }) --"game
		use({ "tjdevries/train.nvim", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Other ===-------------------------------
		use({ "tami5/sqlite.lua" })
		use({ "neomake/neomake", event = { "BufAdd", "InsertEnter" } })

		-- " use 'TaDaa/vimade'                       " Eye Protection

		-- "-------------------=== Unknown ===-------------------------------
		-- use({ "svermeulen/vimpeccable", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Not used ===-------------------------------
	end,
	config = {
		-- compile_path = "~/.local/share/packer_compiled/packer_compiled.lua",
		-- compile_path = vim.fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
	},
})
