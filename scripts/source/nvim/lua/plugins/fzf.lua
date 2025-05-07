return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	config = function()
		vim.keymap.set("n", "<leader><leader>", "<Cmd>FzfLua files<CR>")
		vim.keymap.set("n", "<leader>/", function()
			require("fzf-lua").live_grep_native()
		end)
	end,
}
