local M = {}

M.is_available = function(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

function M.which_key_register()
	if M.which_key_queue then
		local wk_avail, wk = pcall(require, "which-key")
		if wk_avail then
			for mode, registration in pairs(M.which_key_queue) do
				wk.register(registration, { mode = mode })
			end
			M.which_key_queue = nil
		end
	end
end

M.set_mappings = function(map_table, base)
	base = base or {}
	for mode, maps in pairs(map_table) do
		for keymap, options in pairs(maps) do
			if options then
				local cmd = options
				local keymap_opts = base
				if type(options) == "table" then
					cmd = options[1]
					keymap_opts = vim.tbl_deep_extend("force", keymap_opts, options)
					keymap_opts[1] = nil
				end
				if not cmd or keymap_opts.name then
					if not keymap_opts.name then keymap_opts.name = keymap_opts.desc end
					if not M.which_key_queue then M.which_key_queue = {} end
					if not M.which_key_queue[mode] then M.which_key_queue[mode] = {} end
					M.which_key_queue[mode][keymap] = keymap_opts
				else
					vim.keymap.set(mode, keymap, cmd, keymap_opts)
				end
			end
		end
	end
end

return M
