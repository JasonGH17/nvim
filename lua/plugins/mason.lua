return {

	"mason-org/mason.nvim",
	opts = {
		PATH = "prepend",

		firewall = {
			enabled = true,
			auto_managed = true,
		},

		max_concurrent_installers = 4,

		ui = {
			check_outdated_packages_on_open = true,

			border = "rounded",
			width = 0.8,
			height = 0.8,
			icons = {
				package_installed = "󰄳",
				package_pending = "󰁔",
				package_uninstalled = "󰅙",
			},
		},
	},
}
