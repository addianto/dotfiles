-- File explorer
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        config = function(_, opts)
            require("neo-tree").setup(opts or {})
            require("helpers.keys").map(
                { "n", "v" },
                "<leader>e",
                "<cmd>Neotree toggle<cr>",
                "Toggle file explorer"
            )
        end,
    },
}
