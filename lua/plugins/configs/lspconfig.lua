return function(_, _)
	local lspconfig = require 'lspconfig'
	local servers = { "lua_ls", "clangd", "jdtls" }
	for _, server in pairs(servers) do
		lspconfig[server].setup {
			single_file_support = true,
			on_attach = function(client, bufnr) end,
		}
	end
end
