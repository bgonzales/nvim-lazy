return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end
		}, {
			"nvim-telescope/telescope-file-browser.nvim",
			config = function()
				require("telescope").load_extension("file_browser")
			end
		}
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
				horizontal = {
					preview_width = 0.5,
				},
				vertical = {
					preview_height = 0.5,
				},
			},
			extensions = {
				file_browser = { },
			},
		},
	},
	keys = {
		{
			"<leader>o",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Plugin File",
		},
		{ "<leader>co", "<CMD>Telescope find_files cwd=%:p:h<CR>", desc = "Find in [C]urrent folder"},
		{ "<leader>sf", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzily [S]earch in current [F]ile" },
		{ "<leader>saf", "<CMD>Telescope live_grep<CR>", desc = "[S]earch in [A]ll [F]iles" },
		{ '<leader>gs', "<CMD>Telescope git_status<CR>", desc = '[G]it [S]tatus' },
		{ "<leader>fb", "<CMD>Telescope file_browser prompt_path=true<CR>", noremap = true, desc = "Open [F]ile [B]rowser" },
		{ "<leader>fc", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", noremap = true , desc = "Open [F]ile browser in [C]urrent directory"},
		{ "<leader>sd", "<CMD>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics"},
	},
}
