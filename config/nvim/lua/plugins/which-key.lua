-- Key shortcuts documentation
return {
   {
       "folke/which-key.nvim",
       event = "VeryLazy",
       config = function()
           local wk = require("which-key")
           wk.setup()
           wk.add({
               { "<leader>f", name = "File" },
               { "<leader>d", name = "Delete/Close" },
               { "<leader>q", name = "Quit" },
               { "<leader>s", name = "Search" },
               { "<leader>l", name = "LSP" },
               { "<leader>u", name = "UI" },
               { "<leader>b", name = "Debug" },
               { "<leader>g", name = "Git" },
               { "<leader>a", name = "Assistant" },
           })
       end
   }
}
