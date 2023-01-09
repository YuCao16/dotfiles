--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

-- handle nvimtree, if nvimtree open then focus, if no nvimtree then toggle nvimtree
function Handle_nvimtree()
    if require("nvim-tree.view").is_visible() then
        if vim.bo.filetype == "NvimTree" then
            require("nvim-tree").toggle()
        else
            require("nvim-tree").focus()
        end
    else
        require("nvim-tree").open()
    end
end

-- handle neotree, if neotree open then focus, if no neotree then toggle neotree
function Handle_neotree()
    if vim.bo.filetype == "neo-tree" then
        vim.cmd("NeoTreeClose")
    else
        vim.cmd("NeoTreeFocus")
    end
end

-- if dashboard is the only buffer, then press q to quit nvim
function Handle_dashboard()
    local num_of_buffer =
        vim.api.nvim_command_output("echo len(getbufinfo({'buflisted':1}))")
    if num_of_buffer == "0" then
        vim.cmd(":q")
    else
        vim.cmd(":bd")
    end
end

local function is_vista_open()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if
            vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "ft")
            == "vista"
        then
            return true
        end
    end
    return false
end

function Handle_vista()
    if is_vista_open() then
        vim.cmd(":Vista!!")
    else
        vim.cmd(":Vista")
    end
end

-- function set_nvimtree_when_open_term(terminal)
--   local nvimtree = require "nvim-tree"
--   local nvimtree_view = require "nvim-tree.view"
--   if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
--     local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
--     nvimtree.toggle()
--     nvimtree_view.View.width = nvimtree_width
--     nvimtree.toggle(false, true)
--   end
-- end

function find_lspsagafinder()
    local buffers = vim.fn.getbufinfo()
    for _, data in pairs(buffers) do
        if vim.bo[data.bufnr].filetype == "lspsagafinder" then
            vim.notify("there is lspsagafinder")
        end
    end
end

function set_nvimtree_when_open_term()
    local nvimtree_view = require("nvim-tree.view")
    if nvimtree_view.is_visible() then
        vim.cmd("NvimTreeToggle")
        vim.cmd("ToggleTerm")
        require("nvim-tree").toggle(false, true)
    else
        vim.cmd("ToggleTerm")
    end
end

function set_neotree_when_open_term()
    if vim.fn.bufname("neo-tree") ~= "" then
        vim.cmd("NeoTreeClose")
        vim.cmd("TagbarClose")
        vim.cmd("ToggleTerm")
        vim.cmd("NeoTreeShow")
    else
        vim.cmd("ToggleTerm")
    end
end

vim.cmd([[
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
]])
-- vim.cmd([[
-- function TagbarIsOpen()
--     let windows = []
--     windo call add(windows, bufname('%'))
--
--     for item in windows
--         if stridx(item, "Tagbar") != -1
--             return 1
--         endif
--     endfor
--
--     return 0
-- endfunction
-- ]])
