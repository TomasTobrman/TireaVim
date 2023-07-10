return {
	{
		"olimorris/onedarkpro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				globalstatus = true,
				component_separators = '',
				section_separators = {   left = ' ', right = ' ' },
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch'},
				lualine_c = {'filename'},
				lualine_x = {'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {}
			},
		},
		config = require "plugins.configs.lualine",
	},
}
