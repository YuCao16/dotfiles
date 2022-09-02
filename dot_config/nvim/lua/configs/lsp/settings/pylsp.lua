return {
	settings = {
		pylsp = {
			plugins = {
				rope_completion = {
					enabled = true,
				},
				pyflakes = {
					enabled = false,
				},
				jedi_signature_help = {
					enabled = true,
				},
				jedi_definition = {
					enabled = true,
				},
				jedi_hover = {
					enabled = true,
				},
				pycodestyle = {
					enabled = true,
				},
				-- jedi = {
				-- 	environment = "/usr/bin/python3",
				-- 	extra_paths = "usr/bin/python3"
				-- },
			},
		},
	},
}
