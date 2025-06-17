require("key_maps")
require("plugins")
require("plugs_config")

--to fix input delay when ada_language_server is active
vim.api.nvim_create_autocmd("FileType", {
	pattern = "ada",
	callback = function()
		vim.api.nvim_buf_del_keymap(0, "i", "<leader>aj")
		vim.api.nvim_buf_del_keymap(0, "i", "<leader>al")
	end,
})

vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25"
vim.opt.termguicolors = true

-- def 4 spaces tab
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

-- c family langs, use 8 spaces tab
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.d" },
	callback = function()
		vim.opt.expandtab = false
		vim.opt.tabstop = 8
		vim.opt.shiftwidth = 8
		vim.opt.softtabstop = 0
	end,
})

vim.diagnostic.config({ virtual_text = true })
