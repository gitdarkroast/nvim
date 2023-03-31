local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
}

function M.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")


  require("lspkind").init {
    symbol_map = {
      Copilot = " ",
    }
  }
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = require("plugins.cmp.keymaps").setup(cmp),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer",  keyword_length = 5 },
      { name = "path" },
    }),
    formatting = {
      -- Youtube: How to set up nice formatting for your sources.
      format = require("lspkind").cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
          gh_issues = "[issues]",
          tn = "[TabNine]",
        },

        experimental = {
          native_menu = false,
          ghost_text = true,
        }
      },
    },
  })

  -- Add vim-dadbod-completion in sql files
end

return M
