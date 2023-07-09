local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"olimorris/onedarkpro.nvim",
		-- "shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onedark]])
			-- vim.cmd([[colorscheme nord]])
		end,
	},
}

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	install = { colorscheme = { "onedark" }, },
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
	lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
})

