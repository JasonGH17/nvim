-- formatter

vim.api.nvim_create_user_command("Format", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
	})
end, {})
