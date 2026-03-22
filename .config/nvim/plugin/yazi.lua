vim.pack.add({ "https://github.com/mikavilpas/yazi.nvim" })

vim.keymap.set("n", "<leader>e", function()
	require("yazi").yazi()
end, { desc = "File explorer" })
