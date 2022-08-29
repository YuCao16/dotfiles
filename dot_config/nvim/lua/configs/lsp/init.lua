local oks = {
	["cmp"] = pcall(require, "configs.lsp.cmp"),
	["lsp handlers"] = pcall(require, "configs.lsp.handlers"),
}

for name, item in pairs(oks) do
	local ok, _ = item
	if not ok then
		vim.notify(name .. " failed", "error", { title = name .. ".lua", render = "minimal" })
	end
end
