return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local custom_codedark = require("lualine.themes.codedark")

		-- Change the background of lualine_c section for normal mode
		local bgColor = "#282C34"
		custom_codedark.normal.c.bg = bgColor
		custom_codedark.insert.c.bg = bgColor

		lualine.setup({
			options = {
				theme = custom_codedark,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		})
	end,
}
