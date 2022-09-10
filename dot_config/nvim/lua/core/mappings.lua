--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local g = vim.g -- Global variables
local cmd = vim.cmd -- Execute Vim commands
local map = vim.api.nvim_set_keymap
g.mapleader = ","

-- Telescope
map("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = false, silent = false })
map("n", "<leader>ss", ":Telescope find_files<CR>", { noremap = false, silent = false })
map("n", "<leader>sg", ":Telescope live_grep<CR>", { noremap = false, silent = false })
map("n", "<leader>sb", ":Telescope buffers<CR>", { noremap = false, silent = false })
map("n", "<leader>sh", ":Telescope help_tags<CR>", { noremap = false, silent = false })
map("n", "<leader>so", ":Telescope oldfiles<CR>", { noremap = false, silent = false })
map(
	"n",
	"<leader>sd",
	":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })<CR>",
	{ noremap = false, silent = false }
)

-- Nvimtree
map("n", "<leader>q", ":lua Handle_nvimtree()<CR>", { noremap = false, silent = true })
map("n", "<leader>Q", ":NvimTreeClose<CR>", { noremap = false, silent = true })

-- ToggleTerm
map("n", "<leader>cf", ":ToggleTerm direction=float<CR>", { noremap = false, silent = false })
map("n", "<leader>cv", ":ToggleTerm size=40 direction=vertical<CR>", { noremap = false, silent = false })
map("n", "<leader>ch", ":ToggleTerm direction=horizontal<CR>", { noremap = false, silent = false })
map("n", "<leader>ct", ":ToggleTerm direction=tab<CR>", { noremap = false, silent = false })

-- Dap
map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { noremap = false, silent = false })
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = false, silent = false })
map("n", "<leader>ds", ":lua require'dap'.step_over()<CR>", { noremap = false, silent = false })
map(
	"n",
	"<leader>dt",
	":lua require('dap').disconnect(); require('dap.repl').close(); require'dapui'.close()<CR>",
	{ noremap = false, silent = false }
)
map("n", "<leader>do", ":lua require'dapui'.toggle()<CR>", { noremap = false, silent = false })

-- Windows resizer
map("n", "<S-L>", ":exe 'vertical resize +1'<CR>", { noremap = true, silent = true })
map("n", "<S-H>", ":exe 'vertical resize -1'<CR>", { noremap = true, silent = true })
map("n", "<c-j>", ":exe 'resize -1'<CR>", { noremap = true, silent = true })
map("n", "<c-k>", ":exe 'resize +1'<CR>", { noremap = true, silent = true })
-- map("n", "<S-K>", ":exe 'resize -1'<CR>", { noremap = true, silent = true })
-- map("n", "<S-J>", ":exe 'resize +1'<CR>", { noremap = true, silent = true })

-- Bufferline
map("n", "<leader>b", ":BufferLineCycleNext<CR>", { noremap = false, silent = true })
map("n", "<leader>B", ":BufferLineCyclePrev<CR>", { noremap = false, silent = true })

-- Utils
map("n", "<leader>9", ":exec 'source '.bufname('%')<CR>", { silent = false }) -- source current file
map("n", "<leader>w", "<C-w>", { noremap = false, silent = false })
map("t", "<ESC>", [[<C-\><C-n>]], { silent = true })
map("n", "<leader><leader>", ":noh<CR>", { noremap = false, silent = true })

-- Lspsaga
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { noremap = false, silent = false })
map("n", "<leader>rn", ":Lspsaga rename<CR>", { noremap = false, silent = false })
map("n", "<leader>gf", ":Lspsaga lsp_finder<CR>", { noremap = false, silent = false })
map("n", "<tab>", ":Lspsaga hover_doc<CR>", { noremap = false, silent = false })

-- Trouble
map("n", "<leader>gt", ":TroubleToggle document_diagnostics<CR>", { noremap = false, silent = false })

-- Ohters
map("n", "<leader>sl", ":SessionManager load_last_session<CR>", { noremap = false, silent = false })
map("n", "<leader>p", ":TagbarToggle<CR>", { noremap = false, silent = false })
map("n", "<leader>tr", ":TroubleToggle<CR>", { noremap = false, silent = false })
map("n", "<leader>a", ":SidebarNvimToggle<CR>", { noremap = false, silent = false })
map("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = false })
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { noremap = false, silent = false })
map("n", "<leader>f", ":Neoformat<CR>", { noremap = true, silent = false })
map("n", "<leader>0", "", {
	callback = function()
		ok, _ = pcall(vim.cmd, [[:lua require('nabla').popup({ border = 'rounded' })]])
		if not ok then
			vim.error("Put cursor inside latex expression")
		end
	end,
	noremap = true,
	silent = true,
})
map("n", "<leader><tab>", "", {
	callback = function()
		pcall(vim.cmd, [[:lua require('nvim-window').pick()]])
	end,
	noremap = false,
	silent = true,
})

-- map("n", "<leader>ca", ":CodeActionMenu<CR>", { noremap = false, silent = false })
-- map("n", "<leader>0", ":lua require('nabla').popup({ border = 'single' })<CR>", { noremap = true, silent = false })
-- map("n", "<leader>l", ":Limelight!!<CR>", { noremap = false, silent = false })
-- map("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
-- map("x", "ga", "<Plug>(EasyAlign)", {})
-- map("n", "<leader><tab>", ":lua require('nvim-window').pick()<CR>", { noremap = false, silent = true })
-- map("x", "<leader>l", ":Limelight!!<CR>", { noremap = false, silent = false })
-- map("n", "<leader>t", "gt<CR>", { noremap = false, silent = false })
-- map("n", "<leader>ca", ":call CocActionAsync('codeAction','cursor')<CR>", { noremap = false, silent = false })
-- cmd([[inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<down>"]])
-- cmd([[inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<up>"]])
-- cmd([[nnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<down>"]])
-- cmd([[nnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>"]])
-- map('n','<leader>p','\|', { noremap = false, silent = false })
-- tnoremap <silent> <C-[><C-[> <C-\><C-n>
-- map("n", "<S-K>", ":call animate#window_delta_height(5)<CR>", { noremap = true })
-- map("n", "<S-J>", ":call animate#window_delta_height(-5)<CR>", { noremap = true })
-- map("n", "<S-H>", ":call animate#window_delta_width(-5)<CR>", { noremap = true })
-- map("n", "<S-L>", ":call animate#window_delta_width(5)<CR>", { noremap = true })
-- map("n", "<TAB>", ":call Show_documentation()<CR>", { noremap = ture, silent = false })
-- map("n", "<leader>f", ":call SwitchFormatter()<CR>", { noremap = true, silent = false })
-- map("n", "<leader><tab>", "", {
-- 	callback = function()
-- 		local ok, err = pcall(vim.cmd, t([[:lua require('nvim-window').pick()]]))
-- 		if not ok then
-- 			vim.cmd([[:lua require('nvim-window').pick()]])
-- 		else
-- 			vim.api.nvim_err_writeln("nvim-window has not been loaded!")
-- 		end
-- 	end,
-- 	noremap = false,
-- 	silent = true,
-- })
