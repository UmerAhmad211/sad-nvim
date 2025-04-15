require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "zls@0.14.0", "bashls" },
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			procMacro = {
				enable = true,
			},
			inlayHints = {
				enable = true,
			},
		},
	},
})

require("lspconfig").clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").zls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "zig", "zon" },
})

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").gleam.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").ada_ls.setup({
	cmd = { "/home/umerahmadkhan/.local/bin/ada_language_server" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		ada = {
			projectFile = "*.gpr",
			enableDiagnostics = true,
			defaultCharset = "utf-8",
			enableIndexing = true,
		},
	},
})

require("lspconfig").gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").ocamllsp.setup({
	cmd = { "ocamllsp" },
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
