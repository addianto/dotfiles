return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.code_actions.gitrebase,
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.diagnostics.ansiblelint,
                    null_ls.builtins.diagnostics.hadolint,
                    null_ls.builtins.formatting.black,
                }
            })
        end,
    }
}
