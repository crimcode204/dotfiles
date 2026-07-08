vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup({
	win = {
		size = 0.3,
	},
	modes = {
		symbols = {
			win = {
				size = 0.3,
				position = "left",
			},
			preview = {
				type = "split",
				relative = "win",
				position = "bottom",
				size = 0.4,
			},
		},
	},
	preview = {
		type = "split",
		relative = "win",
		position = "right",
		size = 0.3,
	},
})

vim.keymap.set(
	"n",
	"<leader>td",
	"<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Buffer Diagnostics" }
)
vim.keymap.set("n", "<leader>tD", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>ts", "<Cmd>Trouble symbols toggle<CR>", { desc = "Symbols" })
vim.keymap.set("n", "<leader>tS", "<Cmd>Trouble lsp toggle<CR>", { desc = "Lsp Symbols" })
vim.keymap.set("n", "<leader>tl", "<Cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
vim.keymap.set("n", "<leader>tq", "<Cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })

require("which-key").add({ "<leader>t", group = "Trouble" })
