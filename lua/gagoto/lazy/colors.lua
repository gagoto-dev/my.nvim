function ColorMyPencils(color)
    color = color or "tokyonight-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 999,
        -- config = function()
        --     ColorMyPencils()
        -- end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,     -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
                on_highlights = function(hl, colors)
                    hl.LineNrAbove = {
                        fg = "#666666",
                        bold = true
                    }

                    hl.LineNrBelow = {
                        fg = "#777777",
                        bold = true
                    }

                    hl.CursorLineNr = {
                        fg = colors.orange,
                        bold = true
                    }

                    hl.LineNr = {
                        fg = colors.orange,
                        bold = true
                    }
                end,
            })
            ColorMyPencils("tokyonight-moon")
        end,
    }
}
