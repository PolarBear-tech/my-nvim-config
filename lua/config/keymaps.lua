-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jk 快速退出insert模式
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- HJKL 控制上下左右
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left under insert mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right under insert mode" })

local dap = require("dap")

-- ========== F 功能键：最常用调试操作（手不用离开主键盘区） ==========
vim.keymap.set("n", "<F5>", function()
  dap.continue()
end, { desc = "DAP: Run/Continue" })
vim.keymap.set("n", "<F6>", function()
  dap.pause()
end, { desc = "DAP: Pause" })
vim.keymap.set("n", "<F7>", function()
  dap.step_into()
end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F8>", function()
  dap.step_over()
end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F9>", function()
  dap.step_out()
end, { desc = "DAP: Step Out" })
