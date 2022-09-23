local org_bullet_ok, org_bullet = pcall(require, "org-bullets")
if not org_bullet_ok then
    vim.notify("org-bullets failed", "error", { render = "minimal" })
    return
end

org_bullet.setup({
    concealcursor = true,
    symbols = {
        headlines = { "◉", "○", "✸", "✿" },
        checkboxes = {
            cancelled = { "", "OrgCancelled" },
            todo = { "-", "OrgTODO" },
            done = { "✓", "OrgDone" },
        },
    },
})
