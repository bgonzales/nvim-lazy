return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	config = function ()
		require("toggleterm").setup()
	end,
	keys = {
		{ '<Leader>y', "<CMD>ToggleTerm direction=horizontal<CR>", desc = 'Toggle terminal' },
	}
}

