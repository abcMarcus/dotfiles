require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
    dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
    require("core.bootstrap").gen_chadrc_template()
    require("core.bootstrap").lazy(lazypath)
end

vim.filetype.add {
  extension = {
    jinja = 'html',
    jinja2 = 'html',
    j2 = 'jinja',
  },
}

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"


-- my vim settings
vim.keymap.set("i", "jj","<Esc>")
vim.keymap.set("i", "jk","<Esc>")
vim.keymap.set("i", "kj","<Esc>")
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4


local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

map('n', '<leader>hr', ':%!xxd<CR> :set filetype=xxd<CR>')
map('n', '<leader>hw', ':%!xxd -r<CR> :set binary<CR> :set filetype=<CR>')
