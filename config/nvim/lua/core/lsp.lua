-- Based on https://github.com/neovim/nvim-lspconfig
local lspconfig = require("lspconfig")

-- Enable language servers
lspconfig.ansiblels.setup {}
lspconfig.docker_compose_language_service.setup {
    root_dir = lspconfig.util.root_pattern("docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml")
}
lspconfig.dockerls.setup {}
lspconfig.yamlls.setup {}

-- Configure LSP
local keys = require("helpers.keys")

-- TODO: Refactor to use `lsp_map` helper function?
keys.map("n", "<space>e", vim.diagnostic.open_float)
keys.map("n", "[d", vim.diagnostic.goto_prev)
keys.map("n", "]d", vim.diagnostic.goto_next)
keys.map("n", "<space>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings
        local opts = { buffer = ev.buf }

        -- TODO: Refactor to use `lsp_map` helper function?
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
