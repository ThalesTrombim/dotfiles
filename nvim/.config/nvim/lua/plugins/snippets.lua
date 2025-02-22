return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/nvim-cmp",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- Configuração básica do LuaSnip
      luasnip.setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged,InsertLeave",
      })

      -- Carrega os snippets do friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Estende os filetypes
      luasnip.filetype_extend("javascriptreact", { "html", "javascript" })
      luasnip.filetype_extend("typescriptreact", { "html", "typescript" })

      -- Configuração do cmp
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "luasnip", priority = 1000 },
          { name = "nvim_lsp", priority = 900 },
          { name = "buffer", priority = 800 },
          { name = "path", priority = 700 },
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      -- Configuração específica para arquivos React
      cmp.setup.filetype({ "javascriptreact", "typescriptreact" }, {
        sources = {
          { name = "luasnip", priority = 1000 },
          { name = "nvim_lsp", priority = 900 },
          { name = "buffer", priority = 800 },
          { name = "path", priority = 700 },
        },
      })
    end,
  },
}
