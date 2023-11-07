return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer (NeoTree)" },
        },
        config = function()
            require("neo-tree").setup()
        end,
    },
    "tpope/vim-sensible",
    "tpope/vim-sleuth",
    "tpope/vim-surround",
}
