-- Next Buffer
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = "Next buffer" })

-- Previous Buffer
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = "Previous buffer" })

-- New Buffer
vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = 'Nuevo buffer' })


-- Delete Current Buffer
vim.keymap.set('n', '<leader>bx', ':bdelete<CR>', { desc = 'Cerrar buffer actual' })



