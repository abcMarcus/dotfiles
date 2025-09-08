require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "kk", "<ESC>")
map("i", "kj", "<ESC>")

map("n", "<leader>mr", ":%!xxd<CR> :set filetype=xxd<CR>")
map("n", "<leader>mw", ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>")
