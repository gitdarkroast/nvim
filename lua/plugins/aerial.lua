local M = { "stevearc/aerial.nvim" }

function M.config()
  require("aerial")

  require('aerial').setup({
    backends = {
      ['_'] = { "lsp", "treesitter" },
      python = { "treesitter" }
    }
  })
end

return M
