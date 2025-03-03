return {
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            user_default_options = {
                tailwind = true,
            },
            filetypes = { "*" },
            buftypes = {},
            mode = "foreground",
            tailwind_opts = {
                update_names = "both",
            },
            virtualtext_inline = true,
            always_update = true,
            user_commands = {
                "ColorizerToggle",
                "ColorizerReloadAllBuffers",
                "ColorizerAttachToBuffer",
            },
        }
    },

    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup {
                color_square_width = 2,
            }
        end,
        -- config = true
    }
}
