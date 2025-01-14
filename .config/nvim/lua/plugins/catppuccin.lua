return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        color_overrides = {
          mocha = {
            base = "#111111",
            mantle = "#111111",
            crust = "#111111"
          }
        }
      }
    end,
  }
}
