return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	opts = {
		ensure_installed = {
			"lua",
			"rust",
			"typescript",
			"javascript",
			"python",
			"go",
			"bash",
			"json",
			"yaml",
			"markdown",
		},

		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},
	},
}
