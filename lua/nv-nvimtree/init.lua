require("nvim-tree").setup({
	-- open_on_setup = true,
  	sort_by = "case_sensitive",
  	view = {
    	width = 30,
		side = "right",
		preserve_window_proportions = true
  	},
  	renderer = {
    	group_empty = true,
  	},
  	filters = {
    	dotfiles = false,
  	},
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-S-n>', ':NvimTreeFocus<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-A-n>', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})

vim.g.nvim_tree_show_icons = {
  	git = 1,
  	folders = 1,
  	files = 1,
  	folder_arrows = 1,
}


