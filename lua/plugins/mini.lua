return {
	"nvim-mini/mini.nvim",
	version = "*",

	config = function()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.pairs").setup()
		require("mini.ai").setup({
			n_lines = 500,
		})
		require("mini.sessions").setup({
			directory = vim.fn.stdpath("data") .. "/sessions",
			autoread = false,
			autowrite = true,
			file = "session.vim",
		})
		require("mini.move").setup()
		require("mini.splitjoin").setup()
		require("mini.indentscope").setup({
			symbol = "│",
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
				predicate = function()
					local ft = vim.bo.filetype

					local disabled = {
						snacks_dashboard = true,
						dashboard = true,
						lazy = true,
						mason = true,
					}

					return not disabled[ft]
				end,
			},
			options = {
				try_as_border = true,
			},
		})
	end,
}
