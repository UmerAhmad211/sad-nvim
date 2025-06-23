vim.keymap.set('n', '<leader>ff', require("fzf-lua").files, { desc = 'Fzf-lua find files' })
vim.keymap.set('n', '<leader>fg', require("fzf-lua").live_grep, { desc = 'Fzf-lua live grep' })
