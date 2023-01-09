local status_ok, win_picker = pcall(require, "window-picker")
if not status_ok then
    vim.notify("window-picker failed", "error", { render = "minimal" })
    return
end

win_picker.setup({
    other_win_hl_color = "#4493c8",
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = {
                "NvimTree",
                "neo-tree",
                "notify",
                "tagbar",
                "vista",
                "vista_kind",
                "SidebarNvim",
                "VistaNvim",
                "Trouble",
            },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal" },
        },
        -- filter using window options
        wo = {},
        -- if the file path contains one of following names, the window
        -- will be ignored
        file_path_contains = {},
        -- if the file name contains one of following names, the window will be
        -- ignored
        file_name_contains = {},
    },
})
