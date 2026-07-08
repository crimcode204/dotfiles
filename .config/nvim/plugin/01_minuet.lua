vim.pack.add({ "https://github.com/milanglacier/minuet-ai.nvim" })

require("minuet").setup({
	provider = "openai_fim_compatible",
	n_completions = 1, -- for local model, change if going back to codestral
	context_window = 512, -- same as above
	provider_options = {
		codestral = {
			optional = {
				max_tokens = 256,
				stop = { "\n\n" },
			},
		},
		openai_fim_compatible = {
			api_key = "TERM",
			name = "Ollama",
			end_point = "http://localhost:11434/v1/completions",
			model = "qwen2.5-coder:3b",
			optional = {
				max_tokens = 64,
			},
		},
	},
})
