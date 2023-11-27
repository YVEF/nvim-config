local nvim_lsp = require 'lspconfig'
local telescope_builtin = require("telescope.builtin")

local on_attach = function(_, bufnr)
  	local function buf_set_option(...)
    	vim.api.nvim_buf_set_option(bufnr, ...)
  	end

  	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  	-- Mappings.
  	local opts = { buffer = bufnr, noremap = true, silent = true }
	local function get_opts_with_desc(description)
		return { buffer = bufnr, noremap = true, silent = true, desc = description }
	end

  	vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
  	-- vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
  	vim.keymap.set('n', '<leader>ld', telescope_builtin.lsp_definitions, get_opts_with_desc("Definitions"))
  	vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
  	-- vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
  	vim.keymap.set('n', '<leader>li', telescope_builtin.lsp_implementations, get_opts_with_desc("Implementations"))
  	vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
  	vim.keymap.set('n', '<leader>lk', vim.lsp.buf.signature_help, opts)
  	vim.keymap.set('n', '<space>lwa', vim.lsp.buf.add_workspace_folder, opts)
  	vim.keymap.set('n', '<space>lwr', vim.lsp.buf.remove_workspace_folder, opts)
  	vim.keymap.set('n', '<space>lwl', function()
    	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  	end, opts)
  	vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
  	vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, opts)
  	vim.keymap.set('n', '<leader>lf', vim.lsp.buf.references, opts)
  	vim.keymap.set('n', '<leader>lr', telescope_builtin.lsp_references, get_opts_with_desc("References"))
  	vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  	vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.clangd.setup{
	cmd = {
    	"clangd",
    	"--background-index",
    	"--clang-tidy",
		"--all-scopes-completion",
    	"--completion-style=bundled",
    	"--cross-file-rename",
    	"--header-insertion-decorators",
    	"--header-insertion=iwyu",
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
		buildDirectory = "cmake-build-Debug" -- fixme
	},
    settings = {}
}

nvim_lsp.lua_ls.setup{
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
