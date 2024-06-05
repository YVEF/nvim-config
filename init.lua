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
        'nvim-treesitter/nvim-treesitter', tag="v0.9.2",
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
    use "lukas-reineke/indent-blankline.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use "tpope/vim-fugitive"
    use "numToStr/Comment.nvim"
    use "williamboman/mason.nvim"
    use "nvim-lua/plenary.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
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
        requires = "nvim-lua/plenary.nvim"
    }
    use "Pocco81/auto-save.nvim"
    use "dcampos/nvim-snippy"
    use "dcampos/cmp-snippy"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    -- use { "folke/flash.nvim", tag = "v1.18.2" }
    use "folke/flash.nvim"
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use {
        "mfussenegger/nvim-dap-python",
        requires = { { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" } }
    }
    use "jay-babu/mason-nvim-dap.nvim"
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use {
       "Civitasv/cmake-tools.nvim",
        commit = "8aee57d"
    }
    use {
        "Badhi/nvim-treesitter-cpp-tools",
        requires = "nvim-treesitter/nvim-treesitter",
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
    use "nvim-neotest/nvim-nio"
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim"
        }
    }
    use "nvim-telescope/telescope-ui-select.nvim"
    use "mg979/vim-visual-multi" -- multicursore plugin
    use "sindrets/diffview.nvim"
    use {
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua"
        }
    }
    use "f-person/git-blame.nvim"
    use "nvimdev/lspsaga.nvim"
    use "rmagatti/auto-session"
    use "torch/paths"
    use "maggflor/neotest-boost-test"
    use "alfaix/neotest-gtest"
    use "onsails/lspkind-nvim"
    use { 
            "LintaoAmons/bookmarks.nvim" ,
            requires = {
                "stevearc/dressing.nvim"
            }
        }
    --    use "gennaro-tedesco/nvim-possession" -- complex session handling
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
-- vim.o.ttyfast = true
-- vim.o.lazyredraw = true

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
-- require "nv-fugitive"
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
require "nv-comment"
require "nv-dap"
require "nv-neogit"
require "nv-gitblame"
require "nv-lspsaga"
require "nv-auto-session"
require "nv-trouble"
require "nv-diffview"
require "nv-which-key"


-- The command chain at the of the startup
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         vim.defer_fn(function()
--             vim.cmd("NvimTreeOpen")
--         end, 500)  -- 500 ms delay
--     end,
-- })


-- NEOVIDE SETTINGS
vim.o.guifont = "JetBrainsMonoNL Nerd Font:h10:w-0.3:#h-none:#e-subpixelantialias"
-- vim.o.guifont = "InputMono Nerd Font:h11"
-- vim.o.guifont = "JetBrainsMonoNL Nerd Font:h10:w-0.3:#e-subpixelantialias"
vim.opt.linespace = 0
-- vim.g.neovide_scale_factor = 1.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0.2
vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_fullscreen = true
-- vim.g.neovide_text_gamma = 0.999
-- vim.g.neovide_text_contrast = 0.1


