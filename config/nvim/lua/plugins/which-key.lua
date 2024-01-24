-- Key shortcuts documentation
return {
   {
       "folke/which-key.nvim",
       config = function()
           local wk = require("which-key")
           local config = {
               ["<leader>"] = {
                   f = { name = "File" },
                   d = { name = "Delete/Close" },
                   q = { name = "Quit" },
                   s = { name = "Search" },
                   l = { name = "LSP" },
                   u = { name = "UI" },
                   b = { name = "Debugging" },
                   g = { name = "Git" },
               }
           }
           wk.setup()
           wk.register(config)
       end
   }
}
