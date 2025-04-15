vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Explore)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

--line numbering
vim.opt.relativenumber = true
vim.opt.number = true

--yank to sys clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "Y", '"+Y', { noremap = true, silent = true })
