vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "base16",
		globalstatus = vim.o.laststatus == 3,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			-- "dapui_scopes",
			-- "dapui_watches",
			-- "toggleterm",
		},
		ignore_focus = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { { "filename", file_status = false, path = 4 } },
		lualine_b = {
			{ "filetype" },
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				update_in_insert = true,
				always_visible = false,
			},
		},
		lualine_c = {
			"branch",
			"diff",
		},
		lualine_x = {
			-- 		{
			-- 			-- NOTE: add vim.pack plugins status?
			--
			-- 			-- require("lazy.status").updates,
			-- 			-- cond = require("lazy.status").has_updates,
			-- 			-- color = function()
			-- 			-- 	return { fg = Snacks.util.color("Special") }
			-- 			-- end,
			-- 		},
			{
				require("minuet.lualine"),
			},
		},
		lualine_y = { "encoding", "fileformat" },
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", file_status = false } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-dap-ui", "toggleterm" },
})
