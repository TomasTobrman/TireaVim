return function(_, opts)
	require("which-key").setup(opts)
	require("tireavim.utils").which_key_register()
end
