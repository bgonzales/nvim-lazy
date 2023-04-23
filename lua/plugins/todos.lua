return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
	keys = {
		{ "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,NOTE<cr>", desc = "[F]ind [T]o do" },
	},
}
