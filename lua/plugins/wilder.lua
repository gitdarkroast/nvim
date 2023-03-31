local M = { "gelguy/wilder.nvim" }

function M.config()
  local W = require("wilder")
  W.setup(
    {
      modes = { '/', ':', '?' },
      enable_cmdline = 1,
    }
  )
  W.set_option(
    {
      pipeline = {
        W.branch(
          W.cmdline_pipeline({
            language = 'python',
            fuzzy = 1,
          }),
          W.python_search_pipeline({
            pattern = W.python_fuzzy_pattern(),
            sorter = W.python_difflib_sorter(),
            engine = 're',
          })
        )
      },
      renderer = W.wildmenu_renderer({
        highlighter = W.basic_highlighter(),
        separator = ' . ',
        left = { ' ', W.wildmenu_spinner(), ' ' },
        right = { ' ', W.wildmenu_index() },
      })
    }
  )
end

return M
