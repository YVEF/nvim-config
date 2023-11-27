-- indent-blankline
local highlight = {
	"HighlightMainColor"
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "HighlightMainColor", { fg = "#707372" })
end)
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)


require("ibl").setup{
	indent = { highlight = highlight, char = "." },
	scope = { enabled = false }
}


-- require("indent_blankline").setup {
-- 	show_current_context = true,
-- 	show_current_context_start = true
-- }


