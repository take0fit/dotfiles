return {
  -- Disable markdownlint (use rumdl instead via CLI)
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          format = function(diagnostic)
            -- Add lsp server name to message
            return string.format("%s (%s)", diagnostic.message, diagnostic.source or "Unknown")
          end,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.go = { "goimports" }
      opts.format_on_save = opts.format_on_save or {}
      opts.format_on_save.timeout_ms = opts.format_on_save.timeout_ms or 3000
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      keymap = {
        -- preset = "none",
        ["<CR>"] = {}, -- Do not use enter to confirm completion
      },
      sources = {
        default = {
          cmdline = {}, -- Disable cmdline completions (conflicts with Snacks picker)
        },
      },
    },
  },
}
