return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'f3fora/cmp-spell',
	},
	opts = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		return {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert {
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				['<Tab>'] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
					end, { 'i', 's' }
				),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
					end, { 'i', 's' }
				),
			},
			sources = cmp.config.sources (
				{
					{ name = "nvim_lua", max_item_count = 10 },
					{ name = 'nvim_lsp', max_item_count = 10 },
					{ name = 'luasnip' },
					{ name = 'buffer', max_item_count = 5},
				}, {
					{ name = 'path' },
					{ name = 'spell', max_item_count = 5 },
				}
			),
			formatting = {
				format = function(_, item)
					local icons = require("config.icons").icons.kinds
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					return item
				end,
			},
			experimental = { ghost_text = true },
		}
	end
}
