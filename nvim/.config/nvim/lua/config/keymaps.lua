-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<leader>rn", ":IncRename ")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Adicionar aspas na palavra sob o cursor
vim.keymap.set("n", '<leader>q"', 'ciw"<C-r>""<Esc>', { desc = "Envolver palavra com aspas duplas" })
vim.keymap.set("n", "<leader>q'", "ciw'<C-r>\"'<Esc>", { desc = "Envolver palavra com aspas simples" })

-- Adicionar colchetes na palavra sob o cursor
vim.keymap.set("n", "<leader>q[", 'ciw[<C-r>"]<Esc>', { desc = "Envolver palavra com colchetes []" })
vim.keymap.set("n", "<leader>q{", 'ciw{<C-r>"}<Esc>', { desc = "Envolver palavra com chaves {}" })
