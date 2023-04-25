return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
				delay = 50,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "<C-ç>", gs.next_hunk, "Jump to next git change")
				map("n", "<leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", "[G]it [B]lame")
				map("n", "<leader>gd", gs.diffthis, "[G]it [D]iff")
			end,
		}
	}, {
		'sindrets/diffview.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('diffview').setup {}
		end,
		keys = {
			{ '<Leader>dv', "<CMD>DiffviewOpen<CR>", desc = 'Open [D]iff [V]iew' },
		}
	}
}
