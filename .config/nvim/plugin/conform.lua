vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = { "stylelint" },
		go = { "gofmt" },
		lua = { "stylua" },
		qml = { "qmlformat" },
		rust = { "rustfmt" },
	},
})

vim.keymap.set("n", "<C-f>", function()
	require("conform").format()
end, { desc = "Format file", silent = true })
