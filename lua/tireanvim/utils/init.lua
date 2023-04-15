local M = {}

function M.is_available(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

function M.set_mappings(map_table, base)
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
				else
					vim.keymap.set(mode, keymap, cmd, keymap_opts)
				end
			end
		end
	end
end

return M
