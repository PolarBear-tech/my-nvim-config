return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    transparent_background = true,
    float = {
      transparent = true, -- enable transparent floating windows
    },
    integrations = {
      barbar = true,
      blink_cmp = true,
      gitsigns = true,
      mason = true,
      noice = true,
      nvimtree = true,
      snacks = {
        enabled = true,
        indent_scope_color = "flamingo", -- catppuccin color (eg. `lavender`) Default: text
      },
      which_key = true,
      flash = true,
      lsp_trouble = true,
      lazygit = true,
      lualine_nvim = true,
      dap = true,
      dap_ui = true,
      leetcode = true,
    },
  },
}
