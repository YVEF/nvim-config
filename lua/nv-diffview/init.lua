require("diffview").setup{}

local actions = require("diffview.actions")


-- local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', '<leader>mo', actions.conflict_choose("ours"), { desc = "Choose the OURS version of a conflict", noremap = true })
vim.keymap.set('n', '<leader>mt', actions.conflict_choose("theirs"), { desc = "Choose the THEIRS version of a conflict", noremap = true })
vim.keymap.set('n', '<leader>mb', actions.conflict_choose("base"), { desc = "Choose the BASE version of a conflict", noremap = true })
vim.keymap.set('n', '<leader>ma', actions.conflict_choose("all"), { desc = "Choose the ALL version of a conflict", noremap = true })
vim.keymap.set('n', '<leader>mO', actions.conflict_choose_all("ours"), { desc = "Choose the OURS version of a conflict for the whole file", noremap = true })
vim.keymap.set('n', '<leader>mT', actions.conflict_choose_all("theirs"), { desc = "Choose the THEIRS version of a conflict for the whole file", noremap = true })
vim.keymap.set('n', '<leader>mB', actions.conflict_choose_all("base"), { desc = "Choose the BASE version of a conflict for the whole file", noremap = true })


