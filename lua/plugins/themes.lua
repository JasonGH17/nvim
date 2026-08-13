return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "storm",
		styles = {
			sidebars = "normal",
			floats = "normal",
		},
		lualine_bold = true,
	},
	config = function()
		vim.cmd.colorscheme("tokyonight-storm")
	end,
}
