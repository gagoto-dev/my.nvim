function ColorMyPencils(color)
	color = color or "onedark"
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
		config = function()
			ColorMyPencils()
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
}
