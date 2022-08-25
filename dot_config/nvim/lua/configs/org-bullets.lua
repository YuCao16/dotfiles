require("org-bullets").setup({
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
