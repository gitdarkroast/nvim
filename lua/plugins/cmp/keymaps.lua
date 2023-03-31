local M = {}

function M.setup(cmp)
  return cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping.confirm({
      behaviour = cmp.ConfirmBehavior.Insert,
      select = true
    }),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  })
end

return M
