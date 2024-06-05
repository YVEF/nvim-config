
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	sources = {
    	{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'nvim_lua'},
		{name = 'luasnip'},
		-- {name = 'vsnip'},
  	},
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function (entry, vim_item)
              return vim_item
            end
        })

    },
    -- experimental = {
    --     ghost_text = true,
    -- },
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-j>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete()
	},
	snippet = {
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body)
		luasnip.lsp_expand(args.body)
      end,
    },
	completion = {
    	keyword_length = 1
  	},
  	performance = {
    	debounce = 150,
  	}
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})



