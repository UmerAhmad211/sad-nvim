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

--yank to sys clipboard
vim.keymap.set({'n', 'v'}, 'y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'Y', '"+Y', { noremap = true, silent = true })

--to fix input delay when ada_language_server is active
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ada",
    callback = function()
        vim.api.nvim_buf_del_keymap(0, "i", "<leader>aj")
        vim.api.nvim_buf_del_keymap(0, "i", "<leader>al")
    end,
})

