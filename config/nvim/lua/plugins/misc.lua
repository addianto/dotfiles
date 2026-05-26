return {
    -- Better buffer closing actions. Available via the buffers helpers.
    {
        "kazhala/close-buffers.nvim",
        opts = {
            preserve_window_layout = { "this", "nameless" },
        },
    },
    "tpope/vim-sensible", -- Sensible default configuration for Vim/Neovim
    "tpope/vim-sleuth",   -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround", -- Surround stuff with the ys-, cs-, and ds- commands
}
