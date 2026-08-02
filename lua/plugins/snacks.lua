function cwd()
	local arg = vim.fn.argv(0)

	if arg:match("^oil://") then
		return arg:gsub("^oil://", ""):gsub("^/([A-Za-z])/", "%1:/")
	end

	if arg ~= "" and vim.fn.isdirectory(arg) then
		return vim.fn.fnamemodify(arg, ":p")
	else
		return vim.fn.getcwd()
	end
end

return {
	"folke/snacks.nvim",

	priority = 900,
	lazy = false,

	opts = {
		picker = { enabled = true },
		explorer = { enabled = true },
		notifier = { enabled = true },
		terminal = {
			enabled = true,
			win = {
				keys = {
					term_normal = {
						"<C-x>",
						"<C-\\><C-n>",
						mode = "t",
					},
				},
			},
		},
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1 },
				{ section = "startup" },
			},
		},
		styles = {
			dashboard = {
				border = "none",
				wo = {
					winhighlight = "Normal:Normal",
				},
			},
		},
	},

	keys = {
		{
			"<leader>tg",
			function()
				Snacks.terminal("lazygit", {
					cwd = cwd(),
					win = {
						position = "float",
						width = 0.9,
						height = 0.9,
						border = "rounded",
					},
				})
			end,
			desc = "Lazygit",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal("pwsh", { -- TODO: make globally configurable
					cwd = cwd(),
					win = {
						position = "float",
						width = 0.9,
						height = 0.9,
						border = "rounded",
					},
				})
			end,
			desc = "Terminal",
		},
		{
			"<leader>tvt",
			function()
				Snacks.terminal("pwsh", { -- TODO: make globally configurable
					cwd = cwd(),
					win = {
						position = "right",
						width = 0.35,
					},
				})
			end,
			desc = "Terminal (vertical split)",
		},
	},
}
