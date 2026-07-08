vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({
				"cmake",
				"-S.",
				"-Bbuild",
				"-DCMAKE_BUILD_TYPE=Release",
			}, { cwd = ev.data.path }):wait()
			vim.system({
				"cmake",
				"--build",
				"build",
				"--config",
				"Release",
				"--target",
				"install",
			}, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

require("telescope").setup({})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Colorscheme" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fF", builtin.filetypes, { desc = "Filetypes" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fH", builtin.highlights, { desc = "Highlights" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Man Pages" })

require("which-key").add({ "<leader>f", group = "Telescope" })
