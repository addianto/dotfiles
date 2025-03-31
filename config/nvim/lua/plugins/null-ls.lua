return {
    {
        "nvimtools/none-ls.nvim",
        commit = "a117163db44c256d53c3be8717f3e1a2a28e6299",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.code_actions.gitrebase,
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.completion.spell,
                    null_ls.builtins.diagnostics.ansiblelint,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.hover.dictionary,
                }
            })
        end,
    }
}
