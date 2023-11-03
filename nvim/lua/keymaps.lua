vim.api.nvim_set_keymap('n','<Return><Return>','<c-w><c-w>',{ noremap = true})

-- telescope
vim.api.nvim_set_keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',{ noremap = true})
vim.api.nvim_set_keymap('n','<leader>fg','<cmd>Telescope live_grep<cr>',{ noremap = true})
vim.api.nvim_set_keymap('n','<leader>fb','<cmd>Telescope buffers<cr>',{ noremap = true})
vim.api.nvim_set_keymap('n','<leader>fh','<cmd>Telescope help_tags<cr>',{ noremap = true})

-- Fern
vim.api.nvim_set_keymap('n', '<C-p>', ':Fern . <CR>',{ noremap = true})
