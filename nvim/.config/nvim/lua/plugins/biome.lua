return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    local formatting = nls.builtins.formatting

    opts.sources = opts.sources or {}

    vim.list_extend(opts.sources, {
      -- Biome para JS/TS/JSON/etc
      formatting.biome.with({
        filetypes = { "javascript", "typescript", "json" },
      }),

      -- Prettier para Astro (usando plugin instalado)
      formatting.prettier.with({
        filetypes = { "astro" },
        extra_filetypes = {},
        prefer_local = "node_modules/.bin",
      }),
    })
  end,
}
