local oks = {
    ["lsp handlers"] = pcall(require, "configs.lsp.handlers"),
    ["lspsaga"] = pcall(require, "configs.lsp.lsp_saga"),
    ["null-ls"] = pcall(require, "configs.lsp.null"),
    ["signature"] = pcall(require, "configs.lsp.signature"),
}

for name, item in pairs(oks) do
    ---@diagnostic disable-next-line: unbalanced-assignments
    local ok, _ = item
    if not ok then
        vim.notify(
            name .. " failed",
            "error",
            { title = name .. ".lua", render = "minimal" }
        )
    end
end
