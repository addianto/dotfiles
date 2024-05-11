local opts = {
    number = true,
    termguicolors = true,
    encoding = "utf-8",
    autoindent = true,
    smartindent = true,
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    hlsearch = true,
    showcmd = true,
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

-- Configure Python provider
if os.getenv("PYENV_HOME") then
    if vim.fn.has("win32") then
        vim.g.python3_host_prog = "$PYENV_HOME/versions/pynvim/python3"
    else
        vim.g.python3_host_prog = "$PYENV_HOME/versions/pynvim/bin/python3"
    end
end

-- Disable other providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
