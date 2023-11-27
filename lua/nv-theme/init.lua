require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
		--     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		--         comments = { "italic" }, -- Change the style of comments
		--         conditionals = { },
		--         loops = {},
		--         functions = {},
		--         keywords = {},
		--         strings = {},
		--         variables = {},
		--         numbers = {},
		--         booleans = {},
		--         properties = {},
		--         types = {},
		--         operators = {},
		-- identifiers = {}
		--     },
    color_overrides = {
        mocha = {
            base = "#151615",
            mantle = "#1f2120",
            overlay2 = "#ededed",
			overlay0 = "#85c46c",
			green = "#5eeeaf",
        }
    },
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.overlay0, style = { "italic" } },
            Function = { fg = colors.green },
            String = { fg = colors.yellow },
            Character = { fg = colors.yellow },
            Keyword = { fg = "#6c95eb" },
            Label = { fg = "#6c95eb" },
            Exception = { fg = "#6c95eb" },
            Type = { fg = "#85f3f3" },
            StorageClass = { fg = "#85f3f3" },
            Structure = { fg = "#85f3f3" },
            Identifier = { fg = "#daf5f5" },
            -- Statement = { fg = "#daf5f5" },
            -- Character = { fg = "#daf5f5" },

            -- Variables = { fg = "#111111" },
            -- Variable = { fg = "#d7d7d7" },
        }
    end,
    integrations = {
        -- cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})


-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"




