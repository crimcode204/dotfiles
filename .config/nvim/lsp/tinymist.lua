return {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<leader>Tp", function()
			client:exec_cmd({

				title = "pin",

				command = "tinymist.pinMain",

				arguments = { vim.api.nvim_buf_get_name(0) },
			}, { bufnr = bufnr })
		end, { desc = "[T]inymist [P]in", noremap = true })

		vim.keymap.set("n", "<leader>Tu", function()
			client:exec_cmd({

				title = "unpin",

				command = "tinymist.pinMain",

				arguments = { vim.v.null },
			}, { bufnr = bufnr })
		end, { desc = "[T]inymist [U]npin", noremap = true })
	end,

	settings = {
		formatterMode = "typstyle",
		formatterProseWrap = true,
		formatterPrintWidth = 100,
		formatterIndentSize = 2,
	},
}
