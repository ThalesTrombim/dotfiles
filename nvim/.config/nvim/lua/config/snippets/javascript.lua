local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
  s("cl", { -- Atalho: "cl"
    t("console.log("),
    i(1, '"message"'), -- Posição para digitação
    t(");"),
  }),
})

ls.add_snippets("typescript", {
  s("cl", {
    t("console.log("),
    i(1, '"message"'),
    t(");"),
  }),
})
