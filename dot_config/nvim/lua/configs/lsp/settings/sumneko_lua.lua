-- Setup your lua path
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
    settings = {
        Lua = {
            hint = {
                enable = true,
                setType = true,
            },
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                -- path = { "lua/?.lua", "lua/?/init.lua" },
                version = "LuaJIT",
                -- path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                -- globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
                globals = { "vim", "opt" },
                disable = {
                    "lowercase-global",
                    "undefined-global",
                    "unused-local",
                    "unused-vararg",
                    "trailing-space",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.nvim_get_runtime_file("", true),
                -- library = {
                -- 	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
                -- 	[vim.fn.stdpath("config") .. "/lua"] = true,
                -- },
                library = {
                    vim.fn.expand("~")
                        .. "/.local/share/nvim/site/pack/packer/start/lua-dev.nvim/types",
                    "/usr/share/nvim/runtime",
                },
                maxPreload = 2000,
                preloadFileSize = 50000,
            },
            -- completion = { callSnippet = "Both" },
            completion = { callSnippet = "Replace" },
            telemetry = { enable = false },
        },
    },
}
