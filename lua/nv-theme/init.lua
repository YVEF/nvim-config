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
    color_overrides = {
        mocha = {
            base = "#131413",
            mantle = "#1f2120",
            overlay2 = "#ededed",
			-- overlay0 = "#85c46c",
			green = "#5eeeaf",
            kwd = "#6c95eb",
            -- ident = "#e9f6f6",
            ident = "#f1f8f8",
            fld = "#bae0e3",
            -- fld = "#f0f5f5",
        }
    },
    custom_highlights = function(colors)
        return {
            Comment = { fg = "#85c46c", style = { "italic" } },
            Function = { fg = colors.green },
            String = { fg = colors.yellow },
            -- Character = { fg = colors.yellow },
            Character = { fg = "#f0f5f5" },
            Keyword = { fg = colors.kwd },
            Label = { fg = colors.kwd },
            Exception = { fg = colors.kwd },
            Type = { fg = "#85f3f3" },
            StorageClass = { fg = "#85f3f3" },
            Structure = { fg = "#85f3f3" },
            Identifier = { fg = colors.ident },
            Conditional = { fg = colors.kwd, style = {} },
            Repeat = { fg = colors.kwd },
            -- Parameter = { fg = colors.kwd },
            -- Statement = { fg = "#daf5f5" },
            -- Character = { fg = "#daf5f5" },
            -- Variable = { fg = colors.kwd },
            ["@variable.builtin"] = { fg = colors.kwd },
            ["@variable"] = { fg = "#d9e2e2" },
            ["@function.builtin"] = { fg = colors.green },
            ["@number"] = { fg = colors.ident },
            ["@type.builtin"] = { fg = colors.kwd },
            ["@type.definition"] = { fg = colors.kwd },
            -- ["@parameter"] = { fg = colors.kwd },
            ["@field"] = { fg = colors.fld },
            ["@property"] = { fg = colors.fld },
            ["@type"] = { fg = "#85f3f3" },
            -- ["@type.builtin"] = { fg = "#85f3f3" },
            ["@module"] = { fg = colors.ident },
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




