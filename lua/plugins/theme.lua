return {
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('auto-dark-mode').setup {
				set_dark_mode = function()
					vim.api.nvim_set_option('background', 'dark')
					vim.cmd([[colorscheme xcodedarkhc]])
				end,
				set_light_mode = function()
					vim.api.nvim_set_option('background', 'light')
					vim.cmd([[colorscheme xcodelight]])
				end,
			}
			require("auto-dark-mode").init()
		end
	},
	{
		-- 	"folke/tokyonight.nvim",
		-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
		-- 	priority = 1000, -- make sure to load this before all the other start plugins
		-- 	config = function()
		-- 		vim.cmd([[colorscheme tokyonight]])
		-- 	end,
	}
}
