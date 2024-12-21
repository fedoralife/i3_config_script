return {
  "folke/noice.nvim",
  opts = function(_, opts)
    -- Initialize opts.routes if it's nil
    opts.routes = opts.routes or {}

    -- Skip notification for "No information available"
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })

    -- Track focus state
    local focused = true
    vim.api.nvim_create_autocmd("FocusGained", {
      callback = function()
        focused = true
      end,
    })
    vim.api.nvim_create_autocmd("FocusLost", {
      callback = function()
        focused = false
      end,
    })

    -- Insert condition to stop notifications when focus is lost
    table.insert(opts.routes, 1, {
      filter = {
        cond = function()
          return not focused
        end,
      },
      view = "notify_send",
      opts = { stop = false },
    })

    -- Define commands
    opts.commands = {
      all = {
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    }

    -- Enable LSP documentation borders
    opts.presets.lsp_doc_border = true
  end,
}

