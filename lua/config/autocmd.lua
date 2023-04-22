-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
	pattern = '*',
})


-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup('ResizeSplits', { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Disables highlight for group SpellBad. Run :filter Spell highlight
--
-- BufNewFile   When starting to edit a file that doesn't exist.
-- BufReadPost	When starting to edit a new buffer, after reading the file into the buffer.
vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {
	callback = function()
		vim.cmd("hi clear SpellBad")
	end,
})
