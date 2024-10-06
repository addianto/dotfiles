-- See `:help clipboard'` for more information about each option
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
    -- Enable mouse mode
    mouse = 'a',
    -- Don't show the mode, since it's already present in the status line
    showmode = false,
    -- Enable break indent
    breakindent = true,
    -- Save undo history
    undofile = true,
    -- Case-insensitive searching unless \C or one or more capital letters in the search term
    ignorecase = true,
    smartcase = true,
    -- Keep signcolumn on by default
    signcolumn = 'yes',
    -- Configure swap file and how frequent it is written
    swapfile = on,
    updatetime = 500,
    -- Decrease mapped sequence wait time
    -- Displays which-key popup sooner
    timeoutlen = 300,
    -- Configure how new splits should be opened
    splitright = true,
    splitbelow = true,
    -- Preview substitutions live
    inccommand = 'split',
    -- Show which line the cursor is on
    cursorline = true,
    -- Minimal number of screen lines to keep above & below the cursor
    scrolloff = 10,
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
