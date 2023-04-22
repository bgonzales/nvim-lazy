return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true, disable = { 'python' } },
		context_commentstring = { enable = true, enable_autocmd = false },
		ensure_installed = { 'c', 'cpp', 'css', 'swift', 'lua', 'python', 'javascript', 'html', 'typescript', 'markdown', 'markdown_inline', 'json', 'kotlin', 'latex', 'vim', 'yaml', 'tsx' },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = "<nop>",
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
