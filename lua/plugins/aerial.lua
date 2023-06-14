local M = { "stevearc/aerial.nvim" }

function M.config()
  require("aerial")

  require('aerial').setup({
    -- A list of all symbols to display. Set to false to display all symbols.
    -- This can be a filetype map (see :help aerial-filetype-map)
    -- To see all available values, see :help SymbolKind
    filer_kind = false,
    -- filter_kind = {
    --   "Class",
    --   "Constructor",
    --   "Enum",
    --   "Function",
    --   "Interface",
    --   "Module",
    --   "Method",
    --   "Struct",
    -- },
    vim.keymap.set("n", "<Leader>a", "<Cmd>AerialToggle<CR>", { desc = "Aerial (toggle)" }),
    vim.keymap.set("n", "<Leader>A", "<Cmd>AerialNavToggle<CR>", { desc = "Aerial Navigation (toggle)" })
  })
end

return M
