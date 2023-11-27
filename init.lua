-- Ensure packer is installed
local install_path = '/home/iaroslav/.config/nvim/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    vim.cmd 'packadd packer.nvim'
    vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
end

require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
    use "neovim/nvim-lspconfig"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground' 
    use "lukas-reineke/indent-blankline.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "tpope/vim-fugitive"
    use "numToStr/Comment.nvim"
    use "williamboman/mason.nvim"
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "ThePrimeagen/harpoon"
    use 'mbbill/undotree'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use "hrsh7th/cmp-buffer"  
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use {
        "folke/todo-comments.nvim",
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "Pocco81/auto-save.nvim"
    use "dcampos/nvim-snippy"
    use "dcampos/cmp-snippy"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use { "folke/flash.nvim", tag = "v1.18.2" }
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use { 
        "mfussenegger/nvim-dap-python",
        requires = { { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" } }
    }
    use "jay-babu/mason-nvim-dap.nvim"
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use {
        "Civitasv/cmake-tools.nvim",
        commit = "5d8d0f7"
    }
    use {
        "Badhi/nvim-treesitter-cpp-tools",
        requires = { "nvim-treesitter/nvim-treesitter" },
    }
    use "windwp/nvim-autopairs"
    use "folke/which-key.nvim"
    use "folke/trouble.nvim"
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        run = "make install_jsregexp"
    })
    use "rafamadriz/friendly-snippets"
    use "saadparwaiz1/cmp_luasnip"
    use "petertriho/nvim-scrollbar"
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-vim-test",
            "vim-test/vim-test"
        }
    }
    use {"nvim-telescope/telescope-ui-select.nvim" }
    use "mg979/vim-visual-multi" -- multicursore plugin
    use "stevearc/oil.nvim"
end)

vim.o.number = true       -- Show line numbers
vim.o.showmatch = true    -- Highlight matching parenthesis
vim.o.ignorecase = true   -- Case insensitive search
vim.o.smartcase = true    -- Case-sensitive if expression has a capital letter
vim.o.incsearch = true    -- Incremental search
vim.o.hlsearch = true     -- Highlight search results
vim.o.autoread = true
vim.o.shortmess = vim.o.shortmess .. 'IFT'

vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.incsearch = true
vim.opt.ruler = true
vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.ignorecase = false
vim.opt.hlsearch = false
vim.opt.smartindent = true
vim.opt.autoread = true
-- vim.opt.hidden = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.background = 'dark'
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.hlsearch = true     -- Highlight search results


vim.opt.termguicolors = true
vim.opt.inccommand = "split"
vim.opt.laststatus = 0
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.listchars = "tab:→ ,eol:¬,space:·,trail:•,extends:⟩,precedes:⟨"
vim.g.loaded_gtags_cscope = 1

-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd([[
filetype plugin on
filetype indent on
]])

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



vim.api.nvim_set_keymap('n', '<C-x>', ':lua CtrlXPressed()<CR>', { noremap = true, silent = true })
function CtrlXPressed()
    vim.api.nvim_set_keymap('n', '<C-c>', ':qa<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-S-c>', ':qa!<CR>', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap("n", "<C-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap("i", "<C-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("i", "<C-v>", '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<C-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })


-- GENERAL AUTOCMD --
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.proto",
    command = "set filetype=text"
})
-- !GENERAL AUTOCMD --

require "nv-treesitter"
require "nv-lspconfig"
require "nv-mason"
require "nv-harpoon"
require "nv-undotree"
require "nv-fugitive"
require "nv-ibl"
require "nv-theme"
require "nv-bufferline"
require "nv-nvimtree"
require "nv-flash"
require "nv-cmake-tools"
require "nv-nt-cpp-tools"
require "nv-autopairs"
require "nv-telescope"
require "nv-cmp"
require "nv-snippets"
require "nv-scrollbar"
require "nv-neotest"
require "nv-events"
require "nv-visual-multi"
require "nv-oil"
require "nv-comment"
require "nv-dap"

require "nv-which-key"

-- vim.o.hlsearch = true     -- Highlight search results
-- vim.opt.hlsearch = true     -- Highlight search results
