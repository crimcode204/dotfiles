vim.pack.add({
	{ src = "https://github.com/selimacerbas/markdown-preview.nvim" },
	{ src = "https://github.com/selimacerbas/live-server.nvim" },
})

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown: Start preview" } )
vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown: Stop preview" })
vim.keymap.set("n", "<leader>mr", "<cmd>MarkdownPreviewRefresh<cr>", { desc = "Markdown: Refresh preview" })

require("which-key").add({ "<leader>m", group = "Markdown" })
