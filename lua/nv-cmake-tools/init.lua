require("cmake-tools").setup{
	-- cmake_command = "cmake",
  	cmake_regenerate_on_save = false,
	cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
	cmake_build_directory = "cmake-build-${variant:buildType}",
}



