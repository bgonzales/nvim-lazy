return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				'williamboman/mason.nvim',
				config = function() require("mason").setup() end
			}, {
				"folke/neodev.nvim", -- Additional lua configuration for nvim
				config = function() require("neodev").setup() end
			},
			{
				"j-hui/fidget.nvim", -- Status updates at the bottom right corner
				config = function () require("fidget").setup() end
			},
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = true,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
			},

			servers = {
				tailwindcss = {},
				tsserver = {},
				jsonls = {},
				texlab = {},
				cssls = {},
				html = {},
				clangd = {},
				docker_compose_language_service = {},
				dockerls = {},
				intelephense = {},
				sqlls = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = { globals = {'vim'}, }
					},
				},
			},
		},

		config = function(_, opts)
			local on_attach = function (_, _)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0, desc='Hover Documentation'})
				vim.keymap.set('n', 'rn', vim.lsp.buf.rename, {buffer=0, desc='[R]ename'})
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0, desc='[G]o to [D]efinition'})
				vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {buffer=0, desc='[G]o to [R]eferences'})
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {buffer=0, desc='[C]ode [A]ction'})
				vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, {buffer=0, desc='[W]orkspace [S]ymbols'})
				vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, {buffer=0, desc='[D]ocument [S]ymbols'})
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			local servers = opts.servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local have_mason, mason_lspconfig = pcall(require, "mason-lspconfig")

			if have_mason then
				mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })
				mason_lspconfig.setup_handlers {
					function(server_name)
						require('lspconfig')[server_name].setup {
							capabilities = capabilities,
							on_attach = on_attach,
							settings = servers[server_name],
						}
					end
				}
			end

		end,
	},
}
