return {
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},
	"eandrju/cellular-automaton.nvim",
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	"numToStr/Comment.nvim",
	"sbdchd/neoformat",
	"ThePrimeagen/vim-be-good",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
