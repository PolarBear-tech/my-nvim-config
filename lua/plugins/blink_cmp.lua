return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        -- border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
        max_height = 20,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local icon = ctx.kind_icon
                if icon then
                  -- Do nothing
                elseif vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if hl then
                  -- Do nothing
                elseif vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
          },
        },
      },
      ghost_text = {
        enabled = false,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          min_width = 1,
          max_width = 100,
          max_height = 20,
          -- border = "rounded",
          winblend = 0,
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          scrollbar = true,
          direction_priority = {
            menu_north = { "e", "w", "n", "s" },
            menu_south = { "e", "w", "s", "n" },
          },
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        min_width = 1,
        max_width = 100,
        max_height = 20,
        -- border = "rounded", -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
        winblend = 0,
        winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
        -- Which directions to show the window,
        -- falling back to the next direction when there's not enough space,
        -- or another window is in the way
        direction_priority = { "n" },
        -- Disable if you run into performance issues
        treesitter_highlighting = true,
        show_documentation = true,
      },
    },
    keymap = {
      preset = "none",
      ["<A-j>"] = {
        function(cmp)
          return cmp.select_next({ auto_insert = false })
        end,
        "fallback",
      },
      ["<A-k>"] = {
        function(cmp)
          return cmp.select_prev({ auto_insert = false })
        end,
        "fallback",
      },
      ["<A-l>"] = {
        function(cmp)
          return cmp.accept()
        end,
        "fallback",
      },
    },
  },
}
