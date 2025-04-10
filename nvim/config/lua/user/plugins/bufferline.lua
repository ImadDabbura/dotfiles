return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
    event = "VeryLazy",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
            show_close_icon = false,
            show_buffer_close_icons = false,
		},
	},
}
