local set = vim.keymap.set
local n = "n"

vim.g.mapleader = " "
vim.keymap.set(n, "<leader>n", vim.cmd.Explore)
vim.keymap.set(n, "<leader>h", ":nohlsearch<CR>")

local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local opts = { buffer = args.buf, silent = true }
		set(n, "gd", vim.lsp.buf.definition, opts)
		set(n, "K", vim.lsp.buf.hover, opts)
		set(n, "gr", vim.lsp.buf.references, opts)
		set(n, "<Leader>rn", vim.lsp.buf.rename, opts)
		set(n, "<Leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

--line numbering
vim.opt.relativenumber = true
vim.opt.number = true

--yank to sys clipboard
set({ n, "v" }, "y", '"+y', { noremap = true, silent = true })
set(n, "Y", '"+Y', { noremap = true, silent = true })
