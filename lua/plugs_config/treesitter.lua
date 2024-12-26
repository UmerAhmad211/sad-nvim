require'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "vim", "vimdoc", "c", "rust", "ada", "gleam", "cpp","make", "nasm", "zig","bash" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
