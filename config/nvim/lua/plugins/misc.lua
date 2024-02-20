return {
    {
        "jackmort/ChatGPT.nvim",
        branch = "main",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
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
    -- Move stuff with <M-j> and <M-k> in both normal and visual mode
    {
        "echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
    },
    -- Better buffer closing actions. Available via the buffers helpers.
    {
        "kazhala/close-buffers.nvim",
        opts = {
            preserve_window_layout = { "this", "nameless" },
        },
    },
    "tpope/vim-sensible", -- Sensible default configuration for Vim/Neovim
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround", -- Surround stuff with the ys-, cs-, and ds- commands
}
