--=====================================================
-- Bufferline settings
--=====================================================

local close_func = function(bufnum)
    local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
    if bufdelete_avail then
        bufdelete.bufdelete(bufnum, true)
    else
        vim.cmd.bdelete({ args = { bufnum }, bang = true })
    end
end

require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        close_command = close_func,
        right_mouse_command = close_func,
        -- close_command = function(bufnum)
        --     require("bufdelete").bufdelete(bufnum, true)
        -- end,
        -- right_mouse_command = function(bufnum)
        --     require("bufdelete").bufdelete(bufnum, true)
        -- end,
        -- left_mouse_command = function(bufnum)
        --     require("bufdelete").bufdelete(bufnum, true)
        -- end,
    },
})
