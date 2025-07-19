return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, {
      buffer_selected = {
        fg = "#E5B25D",      -- cor do texto
        bold = true,         -- deixa em negrito
        italic = false,      -- sem itálico (opcional)
      },
    })
  end,
}
