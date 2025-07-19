-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<leader>rn", ":IncRename ")

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")

vim.keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  end
end, { noremap = true, silent = true })

-- Enter + Shift --
vim.api.nvim_set_keymap("i", "<S-CR>", "<Esc>o", { noremap = true, silent = true })

local function smart_inc_dec(to)
  local word = vim.fn.expand("<cword>")
  if word == "true" or word == "false" then
    vim.cmd("normal! ciw" .. tostring(to == "true"))
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes(to == "true" and "<C-a>" or "<C-x>", true, false, true),
      "n",
      false
    )
  end
end

vim.keymap.set("n", "+", function()
  smart_inc_dec("true")
end, { desc = "true if boolean, otherwise increment number" })

vim.keymap.set("n", "-", function()
  smart_inc_dec("false")
end, { desc = "false if boolean, otherwise decrement number" })
