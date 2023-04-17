vim.opt.viewoptions:remove "curdir"
vim.opt.shortmess:append { s = true, I = true }
vim.opt.backspace:append { "nostop" }
if vim.fn.has "nvim-0.9" == 1 then
	vim.opt.diffopt:append "linematch:60"
end

local options = {
	opt = {
		clipboard = "unnamedplus",
		cmdheight = 1,
		cursorline = true,
		expandtab = false,
		fileencoding = "utf-8",
		fillchars = { eob = " " },
		history = 100,
		mouse = "a",
		number = true,
		relativenumber = true,
		scrolloff = 8,
		sidescrolloff = 8,
		signcolumn = "yes",
		shiftwidth = 4,
		smartindent = true,
		softtabstop = 4,
		splitbelow = true,
		splitright = true,
		tabstop = 4,
		termguicolors = true,
		undofile = true,
		wrap = false,
		writebackup = false,
	},
	g = {
		mapleader = " ",
	},
	t = { bufs = vim.api.nvim_list_bufs() },
}

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end
