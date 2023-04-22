return {
	'numToStr/Comment.nvim',
	opts = {
		toggler = {
			---Line-comment toggle keymap
			line = '<Leader>ci',
			---Block-comment toggle keymap
			block = '<Leader>co',
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = '<Leader>ci',
			---Block-comment keymap
			block = '<Leader>co',
		},
	}
}
