-- LLM-based assistant
return {
    {
        -- https://github.com/gsuuon/model.nvim
        "gsuuon/model.nvim",
        branch = "main",
        commit = "334c26b2d52dd7305acb391c491bc2914ecce93c",
        init = function()
            vim.filetype.add({
                extension = {
                    mchat = "mchat",
                }
            })
        end,
        ft = "mchat",
        lazy = true,
        -- Activate the plugin manually by using "Model" or "M" command
        cmd = {
            "M",
            "Model",
        },
        cond = not vim.g.vscode,
        config = function()
            local map = require("helpers.keys").map
            map("n", "<leader>aa", "<cmd>M<cr>", "Run a completion prompt")
            map("n", "<leader>ac", "<cmd>Mchat<cr>", "Run a chat buffer")
            map("n", "<leader>aA", "<cmd>MCadd<cr>", "Add the current file into context")
            map("n", "<leader>aR", "<cmd>MCremove<cr>", "Remove the current file from context")
            map("n", "<leader>aC", "<cmd>MCclear<cr>", "Clear context")

            local openai = require("model.providers.openai")
            local starter_prompts = require("model.prompts.starters")
            local mode = require("model").mode

            openai.initialize({
                model = "gpt-4"
            })

            require("model").setup({
                prompts = vim.tbl_extend("force", starter_prompts, {
                    ["proofread_en"] = {
                        provider = openai,
                        params = {
                            temperature = 0.2,
                        },
                        mode = mode.APPEND,
                        builder = function(input)
                            return {
                                messages = {
                                    {
                                        role = "system",
                                        content = "Your task is to proofread and revise English text written by a non-native English speaker to ensure it adheres to correct grammatical rules and sounds idiomatic. This includes checking for proper punctuation, sentence structure, word choice, and phrasing.",
                                    },
                                    {
                                        role = "user",
                                        content = input,
                                    }
                                }
                            }
                        end
                    },
                })
            })
        end,
    }
}
