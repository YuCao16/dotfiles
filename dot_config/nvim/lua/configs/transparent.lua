local transparent_ok, transparent = pcall(require, "transparent")
if not transparent_ok then
    vim.notify("nvim-transparent failed", "error", { render = "minimal" })
    return
end

transparent.setup({
    enable = false, -- boolean: enable transparent
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
