return function(_, _)
	local lspconfig = require 'lspconfig'
	local servers = { "lua_ls", "clangd", "jdtls" }
	for _, server in pairs(servers) do
		lspconfig[server].setup {
			single_file_support = true,
			on_attach = function(client, bufnr) end,
		}
	end

	local signs = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " "
	} 
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
	end
end
