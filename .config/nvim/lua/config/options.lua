local function load_options()
	local options_list = {
		number = true, -- Line numbers
		relativenumber = true, -- Relative line numbers
		cursorline = false, -- Don't highlight current line
		wrap = false, -- Don't wrap lines
		scrolloff = 8, -- Keep 8 lines above/below cursor
		sidescrolloff = 8, -- Keep 8 lines left/right of cursor

		-- Indentation
		tabstop = 2, -- Tab width
		shiftwidth = 2, -- Indent width
		softtabstop = 2, -- Soft tab stop
		expandtab = true, -- Spaces instead of tabs (as it should be)
		autoindent = true, -- Copy current indent on newline
		smartindent = true, -- Smart indent (extra indent after '{', etc.)

		-- Search
		ignorecase = true, -- Case insensitive search
		smartcase = true, -- Case sensitive if uppercase in search
		incsearch = true, -- Show matches while typing
		inccommand = "split", -- Preview window for substitutions outside the screen

		-- Visual
		termguicolors = true, -- 24-bit colors
		fillchars = "eob: ", -- Set character for empty lines at end of buffer to ' '
		signcolumn = "yes", -- Always show sign column
		showmatch = false, -- Don't jump to matching bracket
		showmode = false, -- Don't show mode in command line
		confirm = true, -- Confirm to save changes when exiting
		ruler = false, -- Don't show ruler (cursor position in file)

		-- File handling
		backup = false, -- Don't create backup files
		swapfile = false, -- Don't create swap files
		undofile = true, -- Create undo file
		autoread = true, -- Reload on external changes

		-- Behavior
		errorbells = false, -- No error sound
		mouse = "", -- Disable mouse support
		clipboard = "unnamedplus", -- Sync with system clipboard

		-- Split
		splitbelow = true, -- Horizontal splits go bellow
		splitright = true, -- Vertical splits go right
	}

	for name, value in pairs(options_list) do
		vim.api.nvim_set_option_value(name, value, {})
	end
end

load_options()
