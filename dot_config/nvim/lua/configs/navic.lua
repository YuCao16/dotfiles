---@diagnostic disable: missing-parameter
local M = {}

local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
    vim.notify("nvim-navic failed", "error", { render = "minimal" })
    return
end
local exclude_filetype = {
    "help",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "qf",
}
local excludes = function()
    if
        vim.tbl_contains(exclude_filetype, vim.bo.filetype)
        or not (vim.b.navic_client_id ~= nil)
    then
        vim.opt_local.winbar = nil
        return true
    end
    return false
end
local clean_filepath = function(filepath)
    local file_path_clean = filepath:gsub(vim.fn.expand("~/"), " ~/")
    local file_name = vim.fn.expand("%:t")
    file_path_clean = file_path_clean:gsub("/" .. file_name, "")
    local max_width = math.floor((vim.fn.winwidth(0)) * 0.5)
    local path_width = file_path_clean:len()
    if path_width > max_width then
        file_path_clean = file_path_clean:sub(1, max_width) .. "..."
    else
        file_path_clean = file_path_clean:sub(1, path_width)
    end
    -- file_path_clean = filepath:gsub("/", " 〉")
    return file_path_clean
end
local get_icon = function()
    local file_extension = vim.fn.expand("%:e")
    local icons_ok, icons = pcall(require, "nvim-web-devicons")
    if not icons_ok or file_extension == "" then
        return "/"
    -- return ""
    else
        local icon_color_ok, icon_color =
            pcall(icons.get_icon_color, file_extension)
        -- if not icon_color_ok & icon_color == "nil" then
        if not icon_color_ok or icon_color == nil then
            -- return "/"
            return ""
        else
            -- return icon
            local icon, color =
                require("nvim-web-devicons").get_icon_color(file_extension)
            vim.api.nvim_set_hl(0, "WinbarIcon", { fg = color })
            return "%#WinBarIcon#" .. icon .. "%*"
        end
    end
end
local show_winbar = function()
    if excludes() then
        return
    end
    if status_ok then
        -- local filetype_icon = " 〉" .. get_icon() .. " "
        local filetype_icon = " " .. get_icon() .. " "
        local file_path_clean = clean_filepath(vim.fn.expand("%:p"))
        local file_name = vim.fn.expand("%:t")
        local separator = " 〉"
        local location = "%{%v:lua.require'nvim-navic'.get_location()%}"
        local value = string.format(
            "%s%s%s%s%s",
            file_path_clean,
            filetype_icon,
            file_name,
            separator,
            location
        )
        local set_ok, _ = pcall(
            vim.api.nvim_set_option_value,
            "winbar",
            value,
            { scope = "local" }
        )
        if not set_ok then
            return
        end
    end
end
M.attach = function(client, bufnr)
    if status_ok then
        navic.attach(client, bufnr)
    end
end
M.enable = function()
    navic.setup({
        icons = {
            File = " ",
            Module = " ",
            Namespace = " ",
            Package = " ",
            Class = " ",
            Method = " ",
            Property = " ",
            Field = " ",
            Constructor = " ",
            Enum = "練",
            Interface = "練",
            Function = " ",
            Variable = " ",
            Constant = " ",
            String = " ",
            Number = " ",
            Boolean = "◩ ",
            Array = " ",
            Object = " ",
            Key = " ",
            Null = "ﳠ ",
            EnumMember = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
        },
        highlight = true,
        separator = " 〉",
        depth_limit = 0,
        depth_limit_indicator = "..",
    })
    vim.api.nvim_create_autocmd({ "DirChanged", "BufWinEnter", "BufFilePost" }, {
        callback = function()
            show_winbar()
        end,
    })
end
M.show_winbar = show_winbar
return M
