return {
	"stevearc/conform.nvim",

	opts = {
		format_on_save = {
			timeout_ms = 500,
		},

		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			cs = {},
		}, -- TODO: add formatters for C/C++, C#, and vue.js
	},
}
