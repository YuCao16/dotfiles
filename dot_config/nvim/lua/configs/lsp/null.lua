local null_ls = require("null-ls")

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

null_ls.setup({
    sources = {
        -- it says buildins, but you still need to use Mason to install
        null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--disable=line_length" },
            condition = is_executable("mypy"),
        }),
        -- null_ls.builtins.diagnostics.cpplint,
        -- null_ls.builtins.diagnostics.mypy.with({
        -- 	extra_args = { "--ignore-missing-imports" },
        -- 	condition = is_executable("mypy"),
        -- }),
        -- null_ls.builtins.formatting.eslint,
        -- null_ls.builtins.formatting.cmakelang,
        -- null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.diagnostics.pylint.with({
        -- 	extra_args = { "--disable=missing-docstring", "--errors-only" },
        -- 	condition = is_executable('pylint')
        -- }),
        -- null_ls.builtins.diagnostics.pylama,
        -- null_ls.builtins.diagnostics.vulture.with({
        -- 	method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        -- 	condition = is_executable('pylint')
        -- }),
        -- formatting.isort,
        -- diag.write_good,
        -- formatting.black.with({
        --     extra_args = { "--fast" },
        -- }),
    },
})
