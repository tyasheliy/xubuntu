return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  keys = function()
    return {
      { "<leader>gat", ":GoAddTag", desc = "Go add struct tags" },
      { "<leader>grt", "<cmd>GoRmTag<cr>", desc = "Go remove struct tags" },
      { "<leader>gfs", "<cmd>GoFillStruct<cr>", desc = "Go fill struct" },
    }
  end,
}
