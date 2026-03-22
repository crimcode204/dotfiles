vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

require("toggleterm").setup({
	size = 20,
})

vim.keymap.set(
	"n",
	"<C-q>",
	"<Cmd>ToggleTerm1 direction=horizontal name=horizontal<CR>",
	{ desc = "Terminal horizontal" }
)
vim.keymap.set(
	"t",
	"<C-q>",
	"<Cmd>ToggleTerm1 direction=horizontal name=horizontal<CR>",
	{ desc = "Terminal horizontal" }
)
vim.keymap.set("n", "<C-t>", "<Cmd>ToggleTerm2 direction=float name=float<CR>", { desc = "Terminal float" })
vim.keymap.set("t", "<C-t>", "<Cmd>ToggleTerm2 direction=float name=float<CR>", { desc = "Terminal float" })
