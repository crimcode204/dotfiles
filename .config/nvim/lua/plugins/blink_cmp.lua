-- Autocompletion
return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			config = function()
				local ls = require("luasnip")
				vim.keymap.set({ "i" }, "<C-K>", function()
					ls.expand()
				end, { silent = true })
				vim.keymap.set({ "i", "s" }, "<C-L>", function()
					ls.jump(1)
				end, { silent = true })
				vim.keymap.set({ "i", "s" }, "<C-H>", function()
					ls.jump(-1)
				end, { silent = true })

				vim.keymap.set({ "i", "s" }, "<C-E>", function()
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end, { silent = true })
			end,
		},
		"erooke/blink-cmp-latex",
	},
	opts = function()
		return {
			snippets = { preset = "luasnip" },
			keymap = {
				preset = "enter",
				["<C-e>"] = { "hide", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-s>"] = { "show_documentation", "fallback" },
				-- Manually invoke minuet completion
				["<A-y>"] = require("minuet").make_blink_map(),
			},
			appearance = { nerd_font_variant = "mono" },
			cmdline = { enabled = false },
			completion = {
				documentation = {
					auto_show = false,
					window = { border = "single" },
				},
				ghost_text = { enabled = true },
				keyword = {
					range = "full",
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				menu = {
					border = "single",
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "source_name" },
						},
					},
				},
				trigger = {
					prefetch_on_insert = false,
				},
			},
			signature = {
				enabled = false,
				window = { border = "single" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "latex", "minuet" },
				providers = {
					latex = {
						name = "Latex",
						module = "blink-cmp-latex",
						opts = { insert_command = false },
					},
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						async = true,
						timeout_ms = 3000,
						score_offset = 50,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		}
	end,
	opts_extend = { "sources.default" },
}
