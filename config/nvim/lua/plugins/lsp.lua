return {
    "neovim/nvim-lspconfig",
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        ft = "dart",
        cond = not vim.g.vscode,
        config = function()
            require("flutter-tools").setup({
                lsp = {
                    color = {
                        enabled = true,
                    },
                },
            })
        end,
    }
}
