return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  opts = {
    lang = "python3",
    cn = { enabled = true },
  },
}
