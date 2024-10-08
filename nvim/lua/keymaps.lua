vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set("n", '<leader>E', ":Vex<CR>")
keymap.set("n", '<leader>e', ":Ex<CR>")

keymap.set('n', 'K', ':vim.lsp.buf.definition()')

keymap.set('n', '<leader>zm', ':ZenMode<CR>')

keymap.set('n', '!', '$')

keymap.set('n', '<S-w>', ':tabnew<CR>')

keymap.set('n', '<S-Tab>', ':tabnext<CR>')

keymap.set('n', '<S-e>', ':tabclose<CR>')
