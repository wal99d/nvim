return {
	"VonHeikemen/lsp-zero.nvim",
	config = function()
		-- LSP
		local lsp = require("lsp-zero")
		lsp.extend_lspconfig()
		lsp.preset("recommended")
		require('mason').setup({})
		require('mason-lspconfig').setup({
			-- Replace the language servers listed here
			-- with the ones you want to install
			ensure_installed = {'tsserver', 'rust_analyzer', 'gopls','eslint','clangd'},
			handlers = {
				lsp.default_setup,
			}
		})

		lsp.set_preferences({
			sign_icons = {}
		})

		lsp.on_attach(function(client, bufnr)
			-- local opts = {buffer = bufnr, remap = false}
			-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			lsp.default_keymaps({buffer = bufnr})
		end)
		lsp.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»'
		})

		lsp.setup()
		require('mason').setup({})
		require('mason-lspconfig').setup({
			handlers = {
				lsp.default_setup,
			}
		})
		-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		-- 	vim.lsp.diagnostic.on_publish_diagnostics, {
		-- 		signs = false,
		-- 		virtual_text = true,
		-- 		underline = false,
		-- 	}
		-- )
		--
		local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()

		-- cmp.setup({
		-- 	sources = {
		-- 		{name = 'nvim_lsp'},
		-- 	},
		-- 	completion = {
		-- 		autocomplete = false
		-- 	},
		-- 	mapping = {
		-- 		['<CR>'] = cmp.mapping.confirm({select = true}),
		-- 		['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		-- 		['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
		-- 		['<C-Space>'] = cmp.mapping.complete(),
		-- 	},
		-- 	snippet = {
		-- 		expand = function(args)
		-- 			require('luasnip').lsp_expand(args.body)
		-- 		end,
		-- 	},
		-- })
		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
			},
			mapping = cmp.mapping.preset.insert({
				['<Tab>'] = cmp_action.luasnip_supertab(),
				['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
				['<CR>'] = cmp.mapping.confirm({select = true}),
			}),

			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
		})
	end,
}
