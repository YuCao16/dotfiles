local sidebar_nvim_ok, sidebar_nvim = pcall(require, "sidebar-nvim")
if not sidebar_nvim_ok then
    vim.notify("sidebar-nvim failed", "error", { render = "minimal" })
    return
end
local demo = {
    title = "Section Title",
    icon = "->",
    setup = function(ctx)
        -- called only once and if the section is being used
    end,
    update = function(ctx)
        -- hook callback, called when an update was requested by either the user of external events (using autocommands)
    end,
    draw = function(ctx)
        return "> string here\n> multiline"
    end,
    -- highlights = {
    --     groups = { MyHighlightGroup = { gui="#C792EA", fg="#ff0000", bg="#00ff00" } },
    --     links = { MyHighlightGroupLink = "Keyword" }
    -- }
}

sidebar_nvim.setup({
    sections = {
        "datetime",
        -- "git",
        "symbols",
        "todos",
        "files",
        "buffers",
        demo,
    },
    symbols = {
        icon = "ƒ",
    },
    initial_width = 30,
})
