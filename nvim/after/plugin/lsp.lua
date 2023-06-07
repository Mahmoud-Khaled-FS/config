local lsp = require("lsp-zero")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
	'gopls',
})

lsp.preset("recommended")
lsp.setup()
