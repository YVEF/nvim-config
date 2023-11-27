local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.clangd.setup{
	cmd = {
    	"clangd",
    	"--background-index",
    	"--clang-tidy",
    	-- "--clang-tidy-checks=*",
		"--all-scopes-completion",
    	"--completion-style=bundled",
    	"--cross-file-rename",
    	"--header-insertion-decorators",
    	"--header-insertion=iwyu",
    	-- "--pch-storage=memory",
  	},
	on_attach = on_attach,
	capabilities = lsp_capabilities,
	on_new_config = function(new_config, new_cwd)
        local status, cmake = pcall(require, "cmake-tools")
        if status then
            cmake.clangd_on_new_config(new_config)
        end
    end,
}

nvim_lsp.pyright.setup{
	on_attach = on_attach,
	capabilities = lsp_capabilities
}

nvim_lsp.ruff_lsp.setup{}

nvim_lsp.cmake.setup{
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
	init_options = {
		buildDirectory = "cmake-build"
	},
    settings = {}
}


