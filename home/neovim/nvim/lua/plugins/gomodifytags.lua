return {
  {
    "simondrake/gomodifytags",
    dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    init = function()
      vim.api.nvim_create_user_command("GoAddTags", function(opts)
        require("gomodifytags").GoAddTags(opts.fargs[1])
      end, { nargs = "+" })
      vim.api.nvim_create_user_command("GoRemoveTags", function(opts)
        require("gomodifytags").GoRemoveTags(opts.fargs[1])
      end, { nargs = "+" })
    end,
    opts = {
      transformation = "snakecase",
      skip_unexported = true,
      override = true,
    },
    keys = {
      { "<leader>gta", ":GoAddTags ", desc = "Go add tags" },
      { "<leader>gtr", ":GoRemoveTags ", desc = "Go remove tags" },
    },
  },
}
