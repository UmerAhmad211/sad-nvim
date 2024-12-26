vim .g.mapleader = ' '
vim.keymap.set("n","<leader>n",vim.cmd.Explore)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

--line numbering
vim.opt.relativenumber = true
vim.opt.number = true

--tabs = 2 spaces
vim.opt.tabstop = 2       
vim.opt.shiftwidth = 2    
vim.opt.expandtab = false  
