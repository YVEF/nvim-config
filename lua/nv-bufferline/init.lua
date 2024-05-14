require("bufferline").setup{
	options = {
		mode = "buffers",
		numbers = "ordinal",
        indicator = {
            style = "underline"
        },
		offsets = {
            {
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true
			}
		},
        diagnostics = "nvim_lsp",
        separator_style = "slant"
	},
    highlights = {
        buffer_selected = {
            fg = "#fdfdfd",
            bold = true,
            italic = true,
        }
    }
}

