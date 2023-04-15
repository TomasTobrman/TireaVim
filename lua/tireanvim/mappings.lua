local utils = require "tireanvim.utils"
local is_available = utils.is_available

local maps = { n = {}, i = {}, v = {}, t = {} }

local sections = {
  p = { desc = "Packages" },
}

-- Normal --
-- Standard Operations
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

utils.set_mappings(maps)
