local utils = require "tireavim.utils"
local is_available = utils.is_available

local maps = { n = {}, i = {}, v = {}, t = {} }

local sections = {
	p = { desc = "Packages" },
	f = { desc = "Find" },
	t = { desc = "File Tree" },
}

-- Normal --
-- Standard Operations
maps.n[";"] = { ":", desc = "Enter Command" }
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

-- Plugin Manager
maps.n["<leader>p"] = sections.p
maps.n["<leader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").home() end, desc = "Plugins Status" }
maps.n["<leader>pS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
maps.n["<leader>pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
maps.n["<leader>pU"] = { function() require("lazy").update() end, desc = "Plugins Update" }

-- Splits
maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }

-- Telescope
if is_available "telescope.nvim" then
	maps.n["<leader>f"] = sections.f
	maps.n["<leader>ff"] = { function() require('telescope.builtin').find_files() end, desc = "Files" }
	maps.n["<leader>fb"] = { function() require('telescope.builtin').buffers() end, desc = "Buffers" }
	maps.n["<leader>fg"] = { function() require('telescope.builtin').git_commits() end, desc = "Git Commits" }
end

-- Nvim Tree
if is_available "nvim-tree.lua" then
	maps.n["<leader>t"] = sections.t
	maps.n["<leader>tt"] = { function() require('nvim-tree.api').tree.toggle() end, desc = "Toggle" }
	maps.n["<leader>tf"] = { function() require('nvim-tree.api').tree.focus() end, desc = "Focus" }
end

-- Comment
if is_available "Comment.nvim" then
	maps.n["<leader>/"] = {
		function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
		desc = "Comment line",
	}
	maps.v["<leader>/"] = {
		"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
		desc = "Toggle comment line"
	}
end

utils.set_mappings(maps)
