require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer" ,
											"clangd" ,"zls" }
})

require("lspconfig").rust_analyzer.setup{}
require("lspconfig").clangd.setup{}
require("lspconfig").zls.setup{}
require("lspconfig").lua_ls.setup{}
