-- Use a protected call so we don't error out on first use
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

-- Configure Eclipse JDT Language Server (Java)
lspconfig.jdtls.setup {
    cmd = { "jdtls" },
    filetypes = { "java" },
}
