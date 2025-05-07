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
				adapter = "ds_openrouter",
			},
			inline = {
				adapter = "ds_openrouter",
			},
		},
		adapters = {
			dscode_ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "dscode_ollama",
					schema = {
						model = {
							default = "deepseek-coder-v2:16b",
						},
					},
				})
			end,
			ds_openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "ds_openrouter",
					env = {
						api_key = "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",
						url = "https://openrouter.ai/api",
					},
					features = {
						vision = true,
					},
					schema = {
						model = {
							default = "deepseek/deepseek-prover-v2:free",
						},
					},
				})
			end,
		},
	},
}
