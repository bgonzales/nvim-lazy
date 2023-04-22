local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		opts = {
			show_trailing_blankline_indent = false,
		}
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	require("plugins.status_line"),
	require("plugins.gitsigns"),
	require("plugins.telescope"),  -- File browser and fuzzy search
	require("plugins.treesitter"), -- Language parser
	require("plugins.autocomplete"), -- nvim-cmp
	require("plugins.language_servers"), -- nvim-lspconfig
	require("plugins.comments"),
})

