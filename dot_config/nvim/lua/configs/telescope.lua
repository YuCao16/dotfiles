--=====================================================
-- Telescope settings
--=====================================================

require("telescope").setup({
    -- defaults = {
    -- 	layout_config = {
    -- 		prompt_position = "top",
    -- 	},
    -- 	prompt_prefix = "  ",
    -- 	sorting_strategy = "ascending",
    -- },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
            -- layout_config = {
            -- 	height = 0.70,
            -- },
        },
        buffers = {
            show_all_buffers = true,
        },
        -- live_grep = {
        -- 	previewer = false,
        -- 	theme = "dropdown",
        -- },
        git_status = {
            git_icons = {
                added = " ",
                changed = " ",
                copied = " ",
                deleted = " ",
                renamed = "➡",
                unmerged = " ",
                untracked = " ",
            },
            -- previewer = false,
            -- theme = "dropdown",
        },
    },
})
-- load extension
require("telescope").load_extension("recent_files")
-- telescope.load_extension("heading")
-- telescope.load_extension("dotfiles")
-- telescope.load_extension("gosource")
