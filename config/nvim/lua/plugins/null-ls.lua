return {
    {
        "nvimtools/none-ls.nvim",
        commit = "f5632db2491fbe02b54f1a321a98548a8ba2bd15",
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
