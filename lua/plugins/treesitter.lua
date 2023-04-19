return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	cmd = { "TSInstall", "TSInstallInfo", "TSUpdate" },
	event = { "BufRead" },
	config = function()
		require "nvim-treesitter.configs".setup {
			ensure_installed = { "lua", "java", "c", "cpp", "fish", "dot" },
			highlight = { enable = true, },
		}
	end,
}
