-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 为Termimal添加退出快捷键
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  group = vim.api.nvim_create_augroup("terminal_keymap", { clear = true }),
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  end,
})

-- 为c文件添加<F12>快捷键运行xmake r
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  group = vim.api.nvim_create_augroup("run_c", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set({ "i", "n" }, "<f12>", function()
      local terms = require("toggleterm.terminal")
      local term = terms.get_or_create_term(1)
      if not term:is_open() then
        term:open(vim.o.columns * 0.3, "vertical")
      end
      term:send("xmake r", true)
    end, {
      buf = bufnr,
      noremap = true,
      silent = true,
      desc = "fast xmake run",
    })
  end,
})

-- 为python文件天加<F12>快速润型uv run %
vim.api.nvim_create_autocmd("FileType", {
  pattern = "py",
  group = vim.api.nvim_create_augroup("run_py", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local file = args.file
    local full_path = vim.fn.fnamemodify(file, ":p")
    local cmd = "uv run " .. full_path
    vim.keymap.set({ "i", "n" }, "<f12>", function()
      local terms = require("toggleterm.terminal")
      local term = terms.get_or_create_term(1)
      if not term:is_open() then
        term:open(vim.o.columns * 0.3, "vertical")
      end
      term:send(cmd, true)
    end, {
      buf = bufnr,
      noremap = true,
      silent = true,
      desc = "Fast: uv run",
    })
  end,
})
