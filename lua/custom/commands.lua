-- 自动运行`uv run manim -pql %:p Scene_name`
local function start_preview(_)
  -- TODO 这里需要加上判断
  local scene_name = vim.fn.expand("<cword>")

  local curr_path = vim.fn.expand("%:p")

  local cmd = "uv run manim -pql " .. curr_path .. " " .. scene_name

  local Terminal = require("toggleterm.terminal").Terminal

  Terminal:new({
    cmd = cmd,
    direction = "vertical",
  }):toggle()
end

local function run_xmake(_)
  local terms = require("toggleterm.terminal")
  local term = terms.get_or_create_term(1)
  term:send("xmake r", true)
end

vim.api.nvim_create_user_command("PreviewManimAnimation", start_preview, { nargs = 0 })
