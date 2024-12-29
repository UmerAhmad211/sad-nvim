local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-e>'] = cmp.mapping.close(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	},   {
			{ name = "buffer" },
	}),
})
