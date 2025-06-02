return {
    "folke/zen-mode.nvim",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local zm = require("zen-mode")
        vim.keymap.set("n", "<leader>zm", function()
            zm.toggle()
        end)
    end
}
