return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                dockerfile = { "hadolint", },
                markdown = { "vale", },
            }
            vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end
    },
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("flutter-tools").setup({
                lsp = {
                    color = {
                        enabled = true,
                    },
                },
            })
        end,
        lazy = true,
        ft = "dart",
    }
}
