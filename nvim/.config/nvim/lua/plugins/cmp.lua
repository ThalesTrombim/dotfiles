return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
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
          { name = "luasnip", priority = 1000 }, -- 🔹 Garante que snippets tenham prioridade
          { name = "nvim_lsp", priority = 900 },
          { name = "buffer", priority = 800 },
          { name = "path", priority = 700 },
        }),
      })

      -- 🔹 Configuração específica para arquivos React (.tsx, .jsx)
      cmp.setup.filetype({ "javascriptreact", "typescriptreact" }, {
        sources = {
          { name = "luasnip", priority = 1000 }, -- 🔹 Força snippets no TSX
          { name = "nvim_lsp", priority = 900 },
          { name = "buffer", priority = 800 },
          { name = "path", priority = 700 },
        },
      })
    end,
  },
}
