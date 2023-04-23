return {
	"f-person/auto-dark-mode.nvim",
	lazy = false,
	priority = 1000,
	dependencies = {
		"catppuccin/nvim",
		"folke/tokyonight.nvim",
		"ellisonleao/gruvbox.nvim"
	},
	config = function()
		if vim.loop.os_uname().sysname == "Darwin" then
			require('auto-dark-mode').setup {
				set_dark_mode = function()
					vim.api.nvim_set_option('background', 'dark')
					vim.cmd([[colorscheme tokyonight]])
				end,
				set_light_mode = function()
					vim.api.nvim_set_option('background', 'light')
					vim.cmd([[colorscheme xcodelight]])
				end,
			}
			require("auto-dark-mode").init()
		elseif vim.loop.os_uname().sysname == "Linux" then
			vim.api.nvim_set_option('background', 'dark')
			vim.cmd([[colorscheme catppuccin]])
		else
			vim.api.nvim_set_option('background', 'light')
			vim.cmd([[colorscheme gruvbox]])
		end
	end
}

