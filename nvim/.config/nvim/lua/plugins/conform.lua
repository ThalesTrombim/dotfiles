return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.format_on_save = false
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Usar ESLint para JavaScript/TypeScript
      opts.formatters_by_ft.javascript = opts.formatters_by_ft.javascript or {}
      opts.formatters_by_ft.javascriptreact = opts.formatters_by_ft.javascriptreact or {}
      opts.formatters_by_ft.typescript = opts.formatters_by_ft.typescript or {}
      opts.formatters_by_ft.typescriptreact = opts.formatters_by_ft.typescriptreact or {}

      -- Configura o eslint
      opts.formatters = opts.formatters or {}
      opts.formatters.eslint = {
        require_cwd = true, -- Certifique-se de que o eslint seja executado no diretório correto
        args = { "--fix", "--quiet" }, -- --quiet evita mensagens excessivas
      }

      -- Configuração similar para outros tipos de arquivos, como TypeScript
      opts.formatters.eslint = opts.formatters.eslint or {}
    end,
  },
}
