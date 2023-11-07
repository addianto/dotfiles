return {
    {
        "jackmort/ChatGPT.nvim",
        branch = "main",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        lazy = true,
        event = "VeryLazy",
        cond = not vim.g.vscode,
        config = function()
            local config_dir = vim.fn.expand("$XDG_CONFIG_HOME")
            require("chatgpt").setup({
                api_key_cmd = "gpg --decrypt " .. config_dir .. "/nvim/secrets/openai.gpg",
            })
        end,
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
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local keys = require("helpers.keys")
            local builtin = require("telescope.builtin")

            keys.map("n", "<leader>ff", builtin.find_files)
            keys.map("n", "<leader>fg", builtin.live_grep)
            keys.map("n", "<leader>fb", builtin.buffers)
            keys.map("n", "<leader>fh", builtin.help_tags)
        end,
    },
    "tpope/vim-fugitive",
    "tpope/vim-sensible",
    "tpope/vim-sleuth",
    "tpope/vim-surround",
}
