require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		sh = { "shfmt" },
		clangf = { "clang_format" },
		ocaml = { "ocamlformat" },
	},
	formatters = {
		ocamlformat = {
			command = "ocamlformat",
			prepend_args = {
				"--if-then-else",
				"vertical",
				"--break-cases",
				"fit-or-vertical",
				"--type-decl",
				"sparse",
			},
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
