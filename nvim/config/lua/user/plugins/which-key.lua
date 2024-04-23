return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local key = require("which-key")

		key.setup({
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
			window = {
				border = "rounded",
				position = "bottom",
				padding = { 2, 2, 2, 2 },
			},
			ignore_missing = true,
			show_help = false,
			show_keys = false,
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
			opts = {
				mode = "n", -- NORMAL mode
				prefix = "<leader>",
			},
		})
	end,
}
