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
map("n", "<leader><leader>", ":noh<CR>", { noremap = false, silent = true })
map("n", "<leader>p", ":TagbarToggle<CR>", { noremap = false, silent = false })
map("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = false, silent = false })
map("n", "<leader>ss", ":Telescope find_files<CR>", { noremap = false, silent = false })
map("n", "<leader>sg", ":Telescope live_grep<CR>", { noremap = false, silent = false })
map("n", "<leader>sb", ":Telescope buffers<CR>", { noremap = false, silent = false })
map("n", "<leader>sh", ":Telescope help_tags<CR>", { noremap = false, silent = false })
map("n", "<leader>so", ":Telescope oldfiles<CR>", { noremap = false, silent = false })
map("n", "<leader>sl", ":SessionManager load_last_session<CR>", { noremap = false, silent = false })
map("n", "<leader>q", ":lua Handle_nvimtree()<CR>", { noremap = false, silent = false })
map("n", "<leader>Q", ":NvimTreeClose<CR>", { noremap = false, silent = false })
map("n", "<leader>a", ":SidebarNvimToggle<CR>", { noremap = false, silent = false })
map("n", "<TAB>", ":call Show_documentation()<CR>", { noremap = ture, silent = false })
map("n", "<leader>g", ":ZenMode<CR>", { noremap = true, silent = false })
map("n", "<leader>l", ":Limelight!!<CR>", { noremap = false, silent = false })
map("n", "<leader>t", "gt<CR>", { noremap = false, silent = false })
map("n", "<leader>b", ":BufferLineCycleNext<CR>", { noremap = false, silent = false })
map("n", "<leader>B", ":BufferLineCyclePrev<CR>", { noremap = false, silent = false })
map("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", { noremap = false, silent = false })
map("n", "<leader>w", "<C-w>", { noremap = false, silent = false })
map("n", "<leader>f", ":call SwitchFormatter()<CR>", { noremap = true, silent = false })
map("n", "<leader>cf", ":ToggleTerm direction=float<CR>", { noremap = false, silent = false })
map("n", "<leader>cv", ":ToggleTerm size=40 direction=vertical<CR>", { noremap = false, silent = false })
map("n", "<leader>ch", ":ToggleTerm direction=horizontal<CR>", { noremap = false, silent = false })
map("n", "<leader>ct", ":ToggleTerm direction=tab<CR>", { noremap = false, silent = false })
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
map("n", "<leader><tab>", ":lua require('nvim-window').pick()<CR>", { noremap = false, silent = false })
map("n", "<leader>0", ":lua require('nabla').popup({ border = 'single' })<CR>", { noremap = true, silent = false })
map("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
map("n", "<S-K>", ":call animate#window_delta_height(5)<CR>", { noremap = true })
map("n", "<S-J>", ":call animate#window_delta_height(-5)<CR>", { noremap = true })
map("n", "<S-H>", ":call animate#window_delta_width(-5)<CR>", { noremap = true })
map("n", "<S-L>", ":call animate#window_delta_width(5)<CR>", { noremap = true })
map("x", "<leader>l", ":Limelight!!<CR>", { noremap = false, silent = false })
map("x", "ga", "<Plug>(EasyAlign)", {})
map("i", "<C-y>", "<Plug>(coc-snippets-expand)", {})
cmd([[inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<down>"]])
cmd([[inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<up>"]])
cmd([[nnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<down>"]])
cmd([[nnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>"]])
-- map('n','<leader>p','\|', { noremap = false, silent = false })
-- tnoremap <silent> <C-[><C-[> <C-\><C-n>
