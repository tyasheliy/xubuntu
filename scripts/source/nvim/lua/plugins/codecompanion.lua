return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "dscode",
			},
			inline = {
				adapter = "dscode",
			},
		},
		adapters = {
			dscode = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "dscode",
					schema = {
						model = {
							default = "deepseek-coder-v2:16b",
						},
					},
				})
			end,
		},
	},
}
