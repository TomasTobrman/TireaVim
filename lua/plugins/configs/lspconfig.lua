return function(_, _)
	local lspconfig = require 'lspconfig'
	local servers = { "lua_ls", "clangd", "jdtls" }
	for _, server in pairs(servers) do
		lspconfig[server].setup {
			single_file_support = true,
			on_attach = function(client, bufnr) end,
		}
	end

	local icons = require("tireavim.icons").diagnostics
	local signs = {
		{ name = "DiagnosticSignError", text = icons.Error,			texthl = "DiagnosticSignError" },
		{ name = "DiagnosticSignWarn",	text = icons.Warning,		texthl = "DiagnosticSignWarn" },
		{ name = "DiagnosticSignHint",	text = icons.Hint,			texthl = "DiagnosticSignHint" },
		{ name = "DiagnosticSignInfo",	text = icons.Information,	texthl = "DiagnosticSignInfo" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, sign)
	end
end
