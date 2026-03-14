return {
	cmd = { "neocmakelsp", "stdio" },
	filetypes = { "cmake" },
	single_file_support = true,
	settings = {
		lint = {
			enable = true,
		},
		scan_cmake_in_package = true,
	},
}
