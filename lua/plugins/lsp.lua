-- fix for broken npm path (weird windows+nvm interactions)
vim.env.PATH = "D:\\NewProjects\\tools;" .. vim.env.PATH

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},

	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"stylua",
				"clangd",
				"rust_analyzer",
				"ts_ls",
				"roslyn_ls",
				"tailwindcss",
				"vue_ls",
				"postgres_lsp",
				"docker_language_server",
				"pyright",
			},
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("stylua")
		vim.lsp.enable("clangd")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("roslyn_ls")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("vue_ls")
		vim.lsp.enable("postgres_lsp")
		vim.lsp.enable("docker_language_server")
		vim.lsp.enable("pyright")
	end,
}
