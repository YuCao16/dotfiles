--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
--            ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗		  --
--            ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║		  --
--            ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║		  --
--            ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║		  --
--            ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║		  --
--            ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝		  --
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end

local oks = {

    -- core
    ["options"] = pcall(require, "core.options"),
    ["plugins"] = pcall(require, "core.plugins"),
    ["colorscheme"] = pcall(require, "core.colorscheme"),
    ["highlight"] = pcall(require, "core.highlight"),
    ["mappings"] = pcall(require, "core.mappings"),
    ["autocmd"] = pcall(require, "core.autocmd"),
    ["functions"] = pcall(require, "core.functions"),

    -- configs
    ["vimplugin_setting"] = pcall(require, "configs.vimplugin_configs"),
    ["dashboard"] = pcall(require, "configs.dashboard"),
    -- ["nvimtree"] = pcall(require, "configs.nvimtree"),
    ["neotree"] = pcall(require, "configs.neotree"),
    ["lualine"] = pcall(require, "configs.lualine"),
    ["bufferline"] = pcall(require, "configs.bufferline"),
    ["treesitter"] = pcall(require, "configs.treesitter"),
    ["telescope"] = pcall(require, "configs.telescope"),
}

notify_ok, vim.notify = pcall(require, "notify")
if not notify_ok then
    require("notify").setup({
        on_open = function(win)
            -- set vim.notify() not focusable
            -- vim.api.nvim_win_set_config(win, { focusable = false })
        end,
    })
end

for name, item in pairs(oks) do
    ---@diagnostic disable-next-line: unbalanced-assignments
    local ok, _ = item
    if not ok and notif_ok then
        vim.notify(
            name .. " failed",
            "error",
            { title = name .. ".lua", render = "minimal" }
        )
    end
end
