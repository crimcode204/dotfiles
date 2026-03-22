local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window movement
map({ "n", "t" }, "<C-h>", "<cmd>wincmd h<CR>", { desc = "Go to left window" })
map({ "n", "t" }, "<C-j>", "<cmd>wincmd j<CR>", { desc = "Go to lower window" })
map({ "n", "t" }, "<C-k>", "<cmd>wincmd k<CR>", { desc = "Go to upper window" })
map({ "n", "t" }, "<C-l>", "<cmd>wincmd l<CR>", { desc = "Go to right window" })

-- Window resize
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window vertical size" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window vertical size" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Increase window horizontal size" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Decrease window horizontal size" })

-- Move selected lines
map("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Move lines downwards" })
map("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Move lines upwards" })

-- Indent lines
map("v", ">", ">gv", { desc = "Indent tab left", silent = true })
map("v", "<", "<gv", { desc = "Indent tab right", silent = true })

-- Select all
map("n", "<C-A>", "ggVG", { desc = "Select all" })

-- Clear search highlight
map({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and Clear hlsearch", silent = true })
