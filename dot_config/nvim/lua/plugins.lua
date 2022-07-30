--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })

	-- "-------------------=== Basic ===-------------
	use({
		"neoclide/coc.nvim",
		branch = "release",
		event = { "BufAdd", "InsertEnter" },
		ft = { "python", "markdown", "tex", "ipynb", "org", "json", "html" },
	})
	use({ "github/copilot.vim" })
	use({ "majutsushi/tagbar", ft = { "python", "markdown", "tex", "ipynb", "org" } })
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
				},
				symbols = {
					icon = "ƒ",
				},
			})
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
	use({ "mhinz/vim-startify", event = { "BufAdd", "InsertEnter" } })
	use({ "glepnir/dashboard-nvim" })
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
		"petertriho/nvim-scrollbar",
		event = { "BufAdd", "InsertEnter" },
		ft = { "python", "markdown", "tex", "ipynb", "org" },
		config = function()
			require("scrollbar").setup()
		end,
	})
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

	-- use("romgrk/barbar.nvim")
	-- use { 'startup-nvim/startup.nvim' }
	-- use { 'nvim-neo-tree/neo-tree.nvim',
	-- 	branch = "v1.x",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim"
	--    },
	-- }
	-- use {'ms-jpq/chadtree', branch= 'chad', run = 'python3 -m chadtree deps'}
	-- " use 'scrooloose/NERDTree'		      " File Explorer
	-- " use 'vim-airline/vim-airline'

	-- "-------------------=== Utile ===-------------
	use({
		"lewis6991/impatient.nvim",
		-- config = function()
		-- 	require("impatient")
		-- end,
	})
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
			require("pretty-fold").setup({
				-- keep_indentation = false,
				-- fill_char = "━",
				-- sections = {
				-- 	left = {
				-- 		"━ ",
				-- 		function()
				-- 			return string.rep("*", vim.v.foldlevel)
				-- 		end,
				-- 		" ━┫",
				-- 		"content",
				-- 		"┣",
				-- 	},
				-- 	right = {
				-- 		"┫ ",
				-- 		"number_of_folded_lines",
				-- 		": ",
				-- 		"percentage",
				-- 		" ┣━━",
				-- 	},
				-- },
				-- config = {
				-- 	key = "h",
				-- 	border = { " ", "", " ", " ", " ", " ", " ", " " },
				-- },
			})
		end,
	})
	-- use({ "junegunn/fzf" })
	-- use({ "junegunn/fzf.vim" }) -- " Search Tools
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
	use({
		"Pocco81/TrueZen.nvim",
		event = { "BufAdd", "InsertEnter" },
		config = function()
			local true_zen = require("true-zen")
			true_zen.setup({
				modes = {
					ataraxis = {
						ideal_writing_area_width = { 0 },
						custom_bg = { "#1e222a" },
						disable_bg_configuration = false,
					},
				},
			})
		end,
	})
	use({
		"karb94/neoscroll.nvim",
		-- event = { "BufAdd", "InsertEnter", "VimEnter" },
		config = function()
			require("neoscroll").setup()
		end,
	})
	use({ "camspiers/animate.vim" }) -- " window resizer
	use({ "camspiers/lens.vim" })
	use({ "https://gitlab.com/yorickpeterse/nvim-window.git", event = { "BufAdd" } })
	use({ "junegunn/limelight.vim", event = { "BufAdd", "InsertEnter" } })
	use({ "kevinhwang91/nvim-hlslens", event = { "BufAdd", "InsertEnter" } })
	use({
		"rmagatti/auto-session",
		config = function()
			local opts = {
				log_level = "info",
				auto_session_enable_last_session = false,
				auto_session_root_dir = vim.fn.stdpath("data") .. "/session/",
				auto_session_enabled = true,
				auto_save_enabled = false,
				auto_restore_enabled = false,
				auto_session_suppress_dirs = nil,
			}

			require("auto-session").setup(opts)
		end,
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
		"nvim-neorg/neorg",
		event = { "BufAdd", "InsertEnter" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.norg.concealer"] = {},
					["core.norg.dirman"] = {
						config = {
							workspaces = {
								work = "~/notes/work",
								home = "~/notes/home",
							},
						},
					},
				},
			})
		end,
	})
	use({ "tpope/vim-repeat", event = { "BufAdd", "InsertEnter" } })
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	})
	use({ "rcarriga/nvim-notify" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "RRethy/vim-illuminate", event = { "BufAdd", "InsertEnter" } })
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

	-- use({ "tmhedberg/SimpylFold", event = { "BufAdd", "InsertEnter" } })
	-- use({ "folke/twilight.nvim" })
	-- use({ "sindrets/winshift.nvim", event = { "BufAdd", "InsertEnter" } })
	-- use({
	-- 	"matbme/JABS.nvim",
	-- 	event = { "BufAdd", "InsertEnter" },
	-- 	config = function()
	-- 		local ui = vim.api.nvim_list_uis()[1]
	-- 		require("jabs").setup({
	-- 			position = "corner", -- center, corner
	-- 			width = 50,
	-- 			height = 10,
	-- 			border = "shadow", -- none, single, double, rounded, solid, shadow, (or an array or chars)
	-- 			preview_position = "left", -- top, bottom, left, right
	-- 			preview = {
	-- 				width = 40,
	-- 				height = 30,
	-- 				border = "double", -- none, single, double, rounded, solid, shadow, (or an array or chars)
	-- 			},
	-- 			col = ui.width, -- Window appears on the right
	-- 			row = ui.height / 2, -- Window appears in the vertical middle
	-- 		})
	-- 	end,
	-- })

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
				if vim.fn.pumvisible() ~= 0 then
					return vim.fn["coc#_select_confirm"]()
				else
					return npairs.autopairs_cr()
				end
			end
			remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
		end,
	})
	use({ "RRethy/nvim-treesitter-endwise" })
	-- use({
	-- 	"romgrk/nvim-treesitter-context",
	-- 	-- event = 'BufAdd',
	-- 	config = function()
	-- 		require("treesitter-context").setup()
	-- 	end,
	-- })
	use({
		"lewis6991/spellsitter.nvim",
		ft = { "markdown", "latex" },
		config = function()
			require("spellsitter").setup({
				enable = true,
			})
		end,
	})
	use({ "sbdchd/neoformat", event = { "BufAdd", "InsertEnter" } }) -- " Format .tex
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		event = { "BufAdd", "InsertEnter" },
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "mg979/vim-visual-multi", branch = "master", event = { "BufAdd", "InsertEnter" } })
	use({ "junegunn/vim-easy-align", event = { "BufAdd", "InsertEnter" } })
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
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
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
	use({ "weilbith/nvim-code-action-menu" })
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
		event = { "BufAdd", "InsertEnter" },
	})
	use({ "honza/vim-snippets", event = { "BufAdd", "InsertEnter" } })

	-- " use 'sirver/ultisnips'
	-- use({ "tpope/vim-surround", event = { "BufAdd", "InsertEnter" } })

	-- "-------------------=== Debugging navigation ===-------------
	use({ "mfussenegger/nvim-dap", ft = { "python" }, event = { "BufAdd", "InsertEnter" } })
	use({
		"rcarriga/nvim-dap-ui",
		ft = { "python" },
		event = { "BufAdd", "InsertEnter" },
		config = function()
			require("dapui").setup()
		end,
	})
	use({ "Pocco81/dap-buddy.nvim" })
	use({
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		-- event = { "BufAdd", "InsertEnter" },
		config = function()
			require("dap-python").setup("/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9")
		end,
	})
	-- use({
	-- 	"Pocco81/DAPInstall.nvim",
	-- 	event = { "BufAdd", "InsertEnter" },
	-- 	ft = { "python" },
	-- 	config = function()
	-- 		local dap_install = require("dap-install")
	--
	-- 		dap_install.setup({
	-- 			installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	-- 		})
	--
	-- 		local dap, dapui = require("dap"), require("dapui")
	-- 		dap.listeners.after.event_initialized["dapui_config"] = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.event_terminated["dapui_config"] = function()
	-- 			dapui.close()
	-- 		end
	-- 		dap.listeners.before.event_exited["dapui_config"] = function()
	-- 			dapui.close()
	-- 		end
	-- 	end,
	-- })

	-- "-------------------=== Languages support ===-------------------
	use({ "lervag/vimtex", ft = { "markdown", "tex", "ipynb", "org" } }) -- " LaTex
	use({ "KeitaNakamura/tex-conceal.vim", ft = { "markdown", "tex", "ipynb", "org" } })
	use({ "cmhughes/latexindent.pl", ft = { "markdown", "tex", "ipynb", "org" } })
	use({ "jbyuki/nabla.nvim", ft = { "markdown", "tex", "ipynb", "org" } })

	use({ "plasticboy/vim-markdown", ft = { "markdown", "tex", "ipynb" } }) -- " MarkDown
	use({
		"godlygeek/tabular",
		ft = { "markdown", "tex", "ipynb", "org", "json" },
		event = { "BufAdd", "InsertEnter" },
	})
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
						-- done = { "✓", "OrgDone" },
						-- todo = { "x", "OrgTODO" },
						-- todo = { "✗", "OrgTODO" },
						todo = { "☐", "OrgTODO" },
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
	-- "-------------------=== Games ===--------------------------
	use({ "ThePrimeagen/vim-be-good", event = { "BufAdd", "InsertEnter" } }) --"game
	use({ "tjdevries/train.nvim", event = { "BufAdd", "InsertEnter" } })
	use({
		"gbprod/cutlass.nvim",
		config = function()
			require("cutlass").setup({ cut_key = "c" })
		end,
	})

	-- "-------------------=== Color/Theme ===-------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"xiyaowong/nvim-transparent",
		event = {
			"BufAdd",
			"InsertEnter",
			config = function()
				require("xiyaowong").setup()
			end,
		},
	})
	use({ "p00f/nvim-ts-rainbow", event = { "BufAdd", "InsertEnter" } })
	use({ "nvim-treesitter/playground", event = { "BufAdd", "InsertEnter" } })

	use({ "ryanoasis/vim-devicons", event = { "BufAdd", "InsertEnter" } }) -- " Beautiful Icon
	use({ "kyazdani42/nvim-web-devicons" })

	-- use({ "projekt0n/github-nvim-theme", commit = "715c554" })
	use({ "projekt0n/github-nvim-theme" })
	use({ "joshdick/onedark.vim" })
	-- use({ "navarasu/onedark.nvim" })
	use({ "sainnhe/everforest" })
	use({ "sainnhe/sonokai" })
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
	use({ "sainnhe/edge", event = { "BufAdd", "InsertEnter" } })
	use({ "sainnhe/gruvbox-material", event = { "BufAdd", "InsertEnter" } })

	-- "-------------------=== UI ===-------------------------------
	use({ "MunifTanjim/nui.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "RishabhRD/popfix" })
	use("machakann/vim-highlightedyank") --highlight yank region

	-- "-------------------=== LSP ===-------------------------------
	use({ "neovim/nvim-lspconfig", event = { "BufAdd", "InsertEnter" } })
	use({ "williamboman/nvim-lsp-installer" })
	-- "-------------------=== Other ===-------------------------------
	use({ "tami5/sqlite.lua" })

	-- " use 'TaDaa/vimade'                       " Eye Protection

	-- "-------------------=== Unknown ===-------------------------------
	use({ "neomake/neomake", event = { "BufAdd", "InsertEnter" } })
	-- use({ "svermeulen/vimpeccable", event = { "BufAdd", "InsertEnter" } })

	-- "-------------------=== Not used ===-------------------------------
end)
