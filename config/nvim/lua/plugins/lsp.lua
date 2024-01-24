return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "j-hui/fidget.nvim",
                tag = "v1.2.0",
                event = "LspAttach",
            },
        },
        config = function()
            -- Turn on LSP status information
            require("fidget").setup()
        end,
    },
}
