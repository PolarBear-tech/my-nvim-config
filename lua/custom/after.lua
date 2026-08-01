-- open round border
vim.o.winborder = "rounded"

-- switch colorscheme
vim.cmd.colorscheme("catppuccin-nvim")

-- add my snippets
require("custom.snippets")

-- add my commands
require("custom.commands")
