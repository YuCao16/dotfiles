--=====================================================
-- Treesitter settings
--=====================================================
local function table_contains(tbl, x)
    found = false
    for _, v in pairs(tbl) do
        if v == x then
            found = true
        end
    end
    return found
end

require("nvim-treesitter.configs").setup({
    -- ensure_installed = "maintained",
    ensure_installed = { "org", "python", "norg" },
    sync_install = false,
    ignore_install = { "ruby" },
    highlight = {
        enable = true,
        disable = function(_, bufnr)
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local filetype = vim.bo.filetype
            local disable_type = { "org", "tex", "latex" }
            if table_contains(disable_type, filetype) then
                return true
            end
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
        additional_vim_regex_highlighting = false,
    },
    autopairs = {
        enable = true,
        disable = function(_, bufnr)
            local disable_type = { "org" }
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
    },
    textobjects = {
        enable = true,
        disable = function(_, bufnr)
            local disable_type = {}
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
    },
    endwise = {
        enable = true,
        disable = function(_, bufnr)
            local disable_type = {}
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
        -- disable = { "org", "tex", "latex" }, -- note connot remove org
        -- disable = { "ruby" },
    },
    autotag = {
        enable = true,
        disable = function(_, bufnr)
            local disable_type = {}
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
        -- disable = { "org", "tex", "latex" }, -- note connot remove org
    },
    rainbow = {
        enable = true,
        disable = function(_, bufnr)
            local disable_type = {}
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
        -- disable = { "org", "tex", "latex" }, -- note connot remove org
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
    playground = {
        enable = true,
        disable = function(_, bufnr)
            local disable_type = {}
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
        -- disable = { "org", "tex", "latex" }, -- note connot remove org
        -- disable = {},
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
        },
    },
    indent = {
        enable = false,
        disable = function(_, bufnr)
            local disable_type = {}
            if table_contains(disable_type, filetype) then
                return true
            end
            local buf_name = vim.api.nvim_buf_get_name(bufnr)
            local file_size =
                vim.api.nvim_call_function("getfsize", { buf_name })
            return file_size > 256 * 1024
        end,
        -- disable = { "html", "python", "cpp" },
    },
})

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

--=====================================================
-- Orgmode parsers
--=====================================================
-- parser_config.org = {
--     install_info = {
--         url = "https://github.com/milisims/tree-sitter-org",
--         revision = "main",
--         files = { "src/parser.c", "src/scanner.cc" },
--     },
--     filetype = "org",
-- }

--=====================================================
-- Neorg parsers
--=====================================================
-- parser_config.norg_meta = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
--         files = { "src/parser.c" },
--         branch = "main",
--     },
-- }
-- parser_config.norg = {
--     install_info = {
--         url = "https://github.com/vhyrro/tree-sitter-norg",
--         files = { "src/parser.c", "src/scanner.cc" },
--         branch = "main",
--     },
-- }
-- parser_config.norg_table = {
--     install_info = {
--         url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
--         files = { "src/parser.c" },
--         branch = "main",
--     },
-- }
