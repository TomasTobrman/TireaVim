return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
	build = ":TSUpdate",
	event = "BufRead",
	cmd = {
		"TSBufDisable",
		"TSBufEnable",
		"TSBufToggle",
		"TSDisable",
		"TSEnable",
		"TSToggle",
		"TSInstall",
		"TSInstallInfo",
		"TSInstallSync",
		"TSModuleInfo",
		"TSUninstall",
		"TSUpdate",
		"TSUpdateSync",
	},
	config = function()
		require "nvim-treesitter.configs".setup {
			ensure_installed = { "lua", "java", "c", "cpp", "fish", "dot" },
			highlight = { enable = true, },
			incremental_selection = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
		}
	end,
}
