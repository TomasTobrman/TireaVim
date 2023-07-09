local options = {
	opt = {
		clipboard = "unnamedplus",
		cursorline = true,
		expandtab = false,
		fileencoding = "utf-8",
		fillchars = { eob = " " },
		history = 100,
		mouse = "a",
		number = true,
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
}

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end
