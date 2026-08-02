function cwd()
	local cwd = vim.fn.getcwd()
	local arg = vim.fn.argv(0)

	if arg:match("^oil://") then
		return arg:gsub("^oil://", ""):gsub("^/([A-Za-z])/", "%1:/")
	end

	if vim.fn.isdirectory(cwd) then
		return cwd
	end

	if arg ~= "" then
		local path = vim.fn.fnamemodify(arg, ":p")
		if vim.fn.isdirectory(path) then
			return path
		end
	end

	return cwd
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
		scratch = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1 },
				{ section = "startup" },
			},
		},
		lazygit = {
			configure = true,
			config = {
				os = { editPreset = "nvim-remote" },
				gui = {
					nerdFontsVersion = "3",
				},
			},
			theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
			theme = {
				[241] = { fg = "Special" },
				activeBorderColor = { fg = "MatchParen", bold = true },
				cherryPickedCommitBgColor = { fg = "Identifier" },
				cherryPickedCommitFgColor = { fg = "Function" },
				defaultFgColor = { fg = "Normal" },
				inactiveBorderColor = { fg = "FloatBorder" },
				optionsTextColor = { fg = "Function" },
				searchingActiveBorderColor = { fg = "MatchParen", bold = true },
				selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
				unstagedChangesColor = { fg = "DiagnosticError" },
			},
			win = {
				style = "lazygit",
				border = "rounded",
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
		-- picker
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
		},

		-- scratch
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>ss",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},

		-- lazygit
		{
			"<leader>tg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},

		-- terminal
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
			desc = "Terminal (Vertical Split)",
		},
	},
}
