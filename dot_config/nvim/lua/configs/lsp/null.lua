local null_ls = require("null-ls")
local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")

local is_executable = function(cmd_name, cond)
    local u = require("null-ls.utils")
    return function()
        local ie = u.is_executable(cmd_name)
        if cond == false then
            ie = not ie
        end
        return ie
    end
end

local function ruff_fix()
    return helpers.make_builtin({
        name = "ruff",
        meta = {
            url = "https://github.com/charliermarsh/ruff/",
            description = "An extremely fast Python linter, written in Rust.",
        },
        method = methods.internal.FORMATTING,
        filetypes = { "python" },
        generator_opts = {
            command = "ruff",
            args = {
                "--fix",
                "-e",
                "-n",
                "--stdin-filename",
                "$FILENAME",
                "--unfixable F401",
                -- "--unfixable I001",
                "-",
            },
            to_stdin = true,
        },
        factory = helpers.formatter_factory,
    })
end

null_ls.setup({
    border = "rounded",
    sources = {
        -- Markdown
        null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--disable=line_length" },
            condition = is_executable("markdownlint"),
        }),

        -- Python
        null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length=80" },
            condition = is_executable("black"),
        }),

        ruff_fix(),
        null_ls.builtins.diagnostics.ruff.with({
            extra_args = {
                "--ignore=E501",
                "--ignore=E402",
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
            condition = is_executable("ruff"),
        }),
        -- null_ls.builtins.formatting.isort.with({
        --     extra_args = { "--profile=black" },
        --     condition = is_executable("isort"),
        -- }),
        -- null_ls.builtins.diagnostics.mypy.with({
        --     extra_args = {
        --         "--ignore-missing-imports",
        --         "--cache-dir=/Users/caoyu/mypycache/",
        --         "--disallow-untyped-defs",
        --         "--disallow-incomplete-defs",
        --         "--check-untyped-defs",
        --         "--strict",
        --     },
        --     condition = is_executable("mypy"),
        -- }),
        -- null_ls.builtins.diagnostics.pylama,
        -- null_ls.builtins.diagnostics.flake8.with({
        --     extra_args = { "--ignore=E501" },
        --     condition = is_executable("flake8"),
        -- }),
        -- null_ls.builtins.diagnostics.pylint.with({
        --     extra_args = { "--disable=missing-docstring", "--errors-only" },
        --     condition = is_executable("pylint"),
        -- }),

        -- Cpp & CMake
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.alex,
        -- null_ls.builtins.diagnostics.cspell,

        -- Cpp & CMake
        -- null_ls.builtins.diagnostics.cpplint,
        -- null_ls.builtins.formatting.cmakelang,
        -- null_ls.builtins.formatting.clang_format,
    },
})
