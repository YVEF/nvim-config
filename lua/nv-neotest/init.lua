local lib = require("neotest.lib")

local _test_extensions = {
  ["cpp"] = true,
  ["cppm"] = true,
  ["cc"] = true,
  ["cxx"] = true,
  ["c++"] = true,
}


local function is_test_file(file_path)
  local elems = vim.split(file_path, lib.files.sep, { plain = true })
  local filename = elems[#elems]
  if filename == "" then -- directory
    return false
  end
  local extsplit = vim.split(filename, ".", { plain = true })
  local extension = extsplit[#extsplit]
  local fname_last_part = extsplit[#extsplit - 1]
  local result = _test_extensions[extension]
      and (
        vim.startswith(filename, "test_") 
        or vim.startswith(filename, "t_") 
        or vim.endswith(fname_last_part, "_test")
        or vim.endswith(fname_last_part, "_t")
        )
    or false
  return result
end


require("neotest").setup({
  adapters = {
      -- require("neotest-boost-test")
      require("neotest-gtest").setup({
          dap_adapter = "gdb",
          is_test_file = is_test_file

      })
    -- require("neotest-python")({
    --   dap = { justMyCode = false },
    -- }),
    -- require("neotest-plenary"),
    -- require("neotest-vim-test") --({ ignore_file_types = { "python", "vim", "lua" } }),
	-- require("neotest-ctest")
  },
})





