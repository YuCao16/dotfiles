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
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"sidebar-nvim/sidebar.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "tex", "org", "json", "lua" },
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
					},
				})
			end,
		})
		use({ "glepnir/dashboard-nvim" })
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
		-- use { 'dstein64/vim-startuptime' }

		-- use({ "mhinz/vim-startify", event = { "BufAdd", "InsertEnter" } })

		-- "-------------------=== Utile ===-------------
		use({
			"petertriho/nvim-scrollbar",
			event = { "WinScrolled" },
			ft = { "python", "markdown", "tex", "ipynb", "org", "json" },
			config = function()
				require("scrollbar").setup()
			end,
		})
		use({
			"folke/zen-mode.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "tex", "ipynb", "org", "json" },
			config = function()
				require("zen-mode").setup({
					window = {
						width = 0.75, -- width will be 85% of the editor width
					},
				})
			end,
		})
		use({
			"folke/which-key.nvim",
			ft = { "python", "markdown", "tex", "ipynb", "org", "json", "html", "lua" },
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
			-- event = { "BufAdd" },
			-- ft = { "python", "markdown", "tex", "json", "lua" },
		})
		use({
			"karb94/neoscroll.nvim",
			ft = { "python", "markdown", "tex", "json", "lua" },
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
			-- ft = { "python", "markdown", "tex", "ipynb", "org", "json", "html", "lua" },
			-- event = { "BufAdd", "InsertEnter" },
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
			-- event = { "BufAdd", "InsertEnter" },
			-- ft = { "python", "markdown", "tex", "org", "json", "lua" },
		})
		use({
			"RRethy/vim-illuminate", -- highlight other uses of the current word under the cursor
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "lua", "markdown", "org", "tex" },
		})
		use({
			"gbprod/substitute.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "lua", "markdown", "org", "tex" },
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
		use({ "majutsushi/tagbar", ft = { "python", "markdown", "tex", "ipynb", "org" } })
		use({ "github/copilot.vim", ft = { "python", "markdown", "tex" } })
		use({
			"windwp/nvim-autopairs",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "lua", "tex", "markdown", "org" },
			config = function()
				local remap = vim.api.nvim_set_keymap
				local npairs = require("nvim-autopairs")
				npairs.setup({ map_cr = false, disabled_filetypes = { "latex", "tex" } })

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
		use({
			"anuvyklack/pretty-fold.nvim",
			ft = { "python", "lua" },
			config = function()
				require("pretty-fold").setup()
			end,
		})
		use({
			"sbdchd/neoformat",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "tex", "markdown", "lua" },
		}) -- " Format everything
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
			ft = { "python", "lua", "markdown", "org", "tex" },
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "tex", "ipynb", "org", "json", "lua" },
			config = function()
				vim.opt.termguicolors = true
				vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
				vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

				vim.opt.list = true
				vim.opt.listchars:append("space:⋅")
				vim.opt.listchars:append("eol:↴")
				require("indent_blankline").setup({
					space_char_blankline = " ",
					show_current_context = true,
					show_current_context_start = true,
					filetype_exclude = { "dashboard", "lsp-installer", "peek" },
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
			-- event = { "BufAdd", "InsertEnter" },
			ft = { "python", "markdown", "ipynb", "org", "lua" },
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
			ft = { "python", "markdown", "tex", "ipynb", "org", "json", "html", "lua" },
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
				})
			end,
		})
		use({ "honza/vim-snippets", after = "coc.nvim" }) -- snippets collections

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
			-- event = { "BufAdd", "InsertEnter" },
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
		-- 		vim.cmd([[highlight Headline1 guibg=#1e2718]])
		-- 		vim.cmd([[highlight Headline2 guibg=#21262d]])
		-- 		vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
		-- 		vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])
		--
		-- 		require("headlines").setup({
		-- 			org = {
		-- 				headline_highlights = { "Headline1", "Headline2" },
		-- 			},
		-- 		})
		-- 	end,
		-- })

		-- "-------------------=== Color/Theme ===-------------------
		use("machakann/vim-highlightedyank") --highlight yank (copyed line/lines) region
		use({
			"xiyaowong/nvim-transparent",
			event = {
				"BufAdd",
				"InsertEnter",
			},
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
					exclude = {
						"WinSeparator",
					}, -- table: groups you don't want to clear
				})
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
	end,
	config = {
		-- compile_path = "~/.local/share/packer_compiled/packer_compiled.lua",
		-- compile_path = vim.fn.stdpath("data") .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua",
	},
})
