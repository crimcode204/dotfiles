vim.pack.add({"https://github.com/RRethy/base16-nvim"})

function Source_colors()
  local path = os.getenv("HOME") .. "/.config/nvim/lua/generated.lua"

  local file, err = io.open(path, "r")

  if err ~= nil then
    vim.cmd("colorscheme habamax")
  else
    dofile(path)
    io.close(file)
  end
end

Source_colors()

vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = function()
		Source_colors()
	end,
})
