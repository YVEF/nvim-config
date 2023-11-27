require("cmake-tools").setup{
	-- cmake_command = "cmake",
  	cmake_regenerate_on_save = false,
	cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
	cmake_build_directory = "cmake-build-${variant:buildType}",
    cmake_build_options = {"-j10"},
	cmake_executor = {
	   	-- name = "quickfix",
	   	name = "terminal",
	    default_opts = {
	    	quickfix = {
	    	    show = "always", -- "always", "only_on_error"
	    	    size = 20,
	    	}
		},
	},
	cmake_terminal = {
		name = "terminal",
		opts = {
			name = "cmake terminal",
			prefix_name = "[CMakeTools]: ",
			split_size = 20,
			split_direction = "horizontal", -- "horizontal", "vertical"
	    	show = "always", -- "always", "only_on_error"
		}
	}
}



