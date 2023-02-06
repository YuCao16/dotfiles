local scroll_bar_ok, scroll_bar = pcall(require, "scrollbar")
if not scroll_bar_ok then
    vim.notify("scrollbar failed", "error", { render = "minimal" })
    return
end

scroll_bar.setup({
    exclude_func = function(winid, bufnr)
        if not vim.api.nvim_win_is_valid(winid) then
            return true
        end

        local is_floating = vim.api.nvim_win_get_config(winid).relative ~= ""

        local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
        local exclude_filetype = {
            TelescopePrompt = true,
            lspsagafinder = true,
            [""] = true,
        }

        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        local exclude_buftype = {
            terminal = true,
            prompt = true,
        }

        return is_floating
            or exclude_buftype[buftype]
            or exclude_filetype[filetype]
    end,
})
require("scrollbar.handlers.gitsigns").setup()
