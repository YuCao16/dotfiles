return {
	init_options = {
		settings = {
			logLevel = "info",
			format = { args = { "--line-length", "80" } },
			lint = {
				args = {
					"--ignore=E501",
					"--ignore=E402",
					"--ignore=B905",
					"--ignore=N803",
					"--ignore=N802",
					"--ignore=N806",
					"--ignore=N816",
					"--select=I",
					"--select=A",
					"--select=ANN",
					"--select=B",
					-- "--select=D",
					"--select=N",
					-- "--select=PD",
					"--select=C90",
					"--ignore=ANN101",
					"--ignore=ANN401",
					"--ignore=N812",
					"--ignore=F405",
					"--ignore=F401",
					"--ignore=I001",
					-- "--extend-ignore=ANN",
				},
			},
		},
	},
}
