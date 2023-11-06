return {
  opt = {
    relativenumber = false
  },

  colorscheme = "catppuccin-mocha",

  plugins = {
    {
      "catppuccin/nvim",
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
    },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require("astronvim.utils.status")
        opts.statusline = { -- statusline
          hl = { fg = "fg", bg = "bg" },
          status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
          status.component.git_branch(),
          status.component.file_info { filetype = {}, filename = false, file_modified = false },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
          -- remove the 2nd mode indicator on the right
        }

        -- return the final configuration table
        return opts
      end,
    },
  }
}
