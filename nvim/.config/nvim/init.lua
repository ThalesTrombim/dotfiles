-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
