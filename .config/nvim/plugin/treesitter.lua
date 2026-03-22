vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local languages = {
	"bash",
	"c",
	"cmake",
	"cpp",
	"css",
	"html",
	"hyprlang",
	"java",
	"javascript",
	"json",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"rust",
	"toml",
	"vim",
	"vimdoc",
}

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
	pattern = languages,
	callback = function()
		vim.treesitter.start()
    -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    -- vim.wo.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
