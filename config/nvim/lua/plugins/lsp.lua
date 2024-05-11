return {
    {
        "neovim/nvim-lspconfig",
        cond = not vim.g.vscode,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "v1.2.0",
                event = "LspAttach",
            },
            "folke/neodev.nvim",
            "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- List of language servers
                -- See: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
                ensure_installed = {
                    "ansiblels",
                    "bashls",
                    "cssls",
                    "dockerls",
                    "html",
                    "htmx",
                    "jsonls",
                    "rust_analyzer",
                    "taplo",
                    "texlab",
                    "yamlls",
                },
                automatic_installation = true,
            })

            -- Quick access via keymap
            require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

            -- Neodev setup before LSP config
            require("neodev").setup()

            -- Turn on LSP status information
            require("fidget").setup()

            -- Set up cool signs for diagnostics
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

            -- Diagnostic config
            local config = {
                virtual_text = false,
                signs = {
                    active = signs,
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                }
            }
            vim.diagnostic.config(config)

            -- This function gets run when an LSP connects to a particular buffer
            local on_attach = function(client, bufnr)
                local lsp_map = require("helpers.keys").lsp_map

                lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
                lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
                lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
                lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

                lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
                lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
				lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
				lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })

				lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")

				-- Attach and configure vim-illuminate
				require("illuminate").on_attach(client)
            end

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Ansible
            require("lspconfig").ansiblels.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Bash
            require("lspconfig").bashls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- CSS
            require("lspconfig").cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Docker
            require("lspconfig").dockerls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "Dockerfile", "Containerfile", "dockerfile", "containerfile" },
            })

            -- HTML
            require("lspconfig").html.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- JSON
            require("lspconfig").jsonls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Python
            -- require("lspconfig").pylsp.setup({
            --     on_attach = on_attach,
            --     capabilities = capabilities,
            --     settings = {
            --         pylsp = {
            --             plugins = {
            --                 flake8 = {
            --                     enabled = true,
            --                     maxLineLength = 88, -- Black's line length
            --                 },
            --                 -- Disable plugins overlapping with flake8
            --                 pycodestyle = {
            --                     enabled = false,
            --                 },
            --                 mccabe = {
            --                     enabled = false,
            --                 },
            --                 pyflakes = {
            --                     enabled = false,
            --                 },
            --                 -- Use Black as formatter
            --                 autopep8 = {
            --                     enabled = false,
            --                 },
            --             },
            --         }
            --     }
            -- })

            -- Rust
            require("lspconfig").rust_analyzer.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- TOML
            require("lspconfig").taplo.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- LaTeX
            require("lspconfig").texlab.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- YAML
            require("lspconfig").yamlls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end,
    },
}
