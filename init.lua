require("jayreddy")

vim.cmd [[
  augroup NetrwCustomizations
    autocmd!
    autocmd FileType netrw setlocal number relativenumber
  augroup END
]]

vim.opt.relativenumber = true
vim.o.runtimepath = vim.o.runtimepath .. ',' .. '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
require('packer').init()
