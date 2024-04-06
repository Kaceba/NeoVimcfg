local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	if client.supports_method('textDocument/formatting') then
		require('lsp-format').on_attach(client)
	end

	vim.keymap.set({ 'n', 'x' }, '<leader>kd', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	mapping = {
		['<C-y>'] = cmp.mapping.confirm({ select = false }),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-k>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
		['<C-j>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
		['<Tab>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.confirm({ select = true })
			end
		end),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { 'tsserver', 'rust_analyzer', 'angularls', 'bashls', 'clangd', 'omnisharp', 'cmake', 'cssls',
		'dockerls', 'glsl_analyzer', 'gopls', 'graphql', 'html',
		'lua_ls', 'pyright', 'sqlls', 'lemminx', 'zls' },

	handlers = {
		lsp_zero.default_setup,
	}
})
