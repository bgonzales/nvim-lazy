local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		opts = {
			show_trailing_blankline_indent = false,
		}
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	require("plugins.theme"),
	require("plugins.status_line"),
	require("plugins.git"),
	require("plugins.telescope"),  -- File browser and fuzzy search
	require("plugins.treesitter"), -- Language parser
	require("plugins.autocomplete"), -- nvim-cmp
	require("plugins.language_servers"), -- nvim-lspconfig
	require("plugins.comments"),
	require("plugins.terminal"),
	require("plugins.starter"),
	require("plugins.todos"),
}

local options = {
	install = {
		colorscheme = { "xcodelighthc" }
	}
}

require("lazy").setup(plugins, options)

