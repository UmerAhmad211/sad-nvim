require ("key_maps")
require ("plugins")
require ("plugs_config")

--to fix input delay when ada_language_server is active
vim.api.nvim_create_autocmd("FileType", {
    pattern = "ada",
    callback = function()
        vim.api.nvim_buf_del_keymap(0, "i", "<leader>aj")
        vim.api.nvim_buf_del_keymap(0, "i", "<leader>al")
    end,
})

vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.termguicolors = true
