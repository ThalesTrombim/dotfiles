return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { 
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-cmdline", -- Nova dependência para autocomplete na linha de comando
      "hrsh7th/cmp-path",    -- Já deve estar instalado, mas declarando explicitamente
      "hrsh7th/cmp-buffer",  -- Já deve estar instalado, mas declarando explicitamente
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      -- Configuração principal do cmp
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
      
      -- NOVAS CONFIGURAÇÕES: Autocompletamento para linha de comando
      
      -- Configuração para busca (/ e ?)
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      
      -- Configuração para comandos (:)
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline({
          ['<Tab>'] = {
            c = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end,
          },
          ['<S-Tab>'] = {
            c = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end,
          },
        }),
        sources = cmp.config.sources(
          { { name = 'path' } },
          { { 
              name = 'cmdline',
              option = { ignore_cmds = { 'Man', '!' } }
            } 
          }
        ),
        -- Isso permite que o completamento funcione mesmo quando digitamos apenas parte do comando
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
}
