return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,

        -- For blink.cmp's completion
        -- source
        -- dependencies = {
        --     "saghen/blink.cmp"
        -- },
        config = function()
            -- local mv = require("markview")
            local toggle = "Markview Toggle"
            vim.cmd(toggle)
            vim.keymap.set("n", "<leader>md", function() vim.cmd(toggle) end,
                { desc = "Toggle Markdown preview" })
        end
    },
    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    }
}
