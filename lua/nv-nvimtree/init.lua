
local nvimtree = require("nvim-tree")
nvimtree.setup({
  	sort_by = "case_sensitive",
  	view = {
    	width = 38,
		side = "right",
		preserve_window_proportions = false
  	},
  	renderer = {
    	group_empty = true,
  	},
  	filters = {
    	dotfiles = false,
  	},
})


vim.g.nvim_tree_show_icons = {
  	git = 1,
  	folders = 1,
  	files = 1,
  	folder_arrows = 1,
}


