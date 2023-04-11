-- nvm apt PPA: sudo add-apt-repository ppa:neovim-ppa/unstable

vim.cmd([[
augroup NetrwCustomizations
   autocmd!
   autocmd FileType netrw setlocal number relativenumber
augroup END
]])

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- greatest remaps ever (void register remaps)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move things up and down in visual mode and smart indents
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- some prime remaps that i don't fully understand
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.cmd('set nohlsearch')
vim.o.runtimepath = vim.o.runtimepath .. ',' .. '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
require('packer').init()

vim.cmd('packadd packer.nvim')
return require('packer').startup(function(use)
-- Packer can manage itself
use 'wbthomason/packer.nvim'
use {
     'nvim-telescope/telescope.nvim', tag = '0.1.1',
     requires = { {'nvim-lua/plenary.nvim'} }
}
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
     builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
require'nvim-treesitter.configs'.setup {
     -- A list of parser names, or "all" (the five listed parsers should always be installed)
     ensure_installed = {"python", "javascript", "typescript", "c", "lua", "vim", "query", "go"},

     -- Install parsers synchronously (only applied to `ensure_installed`)
     sync_install = false,

     -- Automatically install missing parsers when entering buffer
     -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
     auto_install = true,

     -- List of parsers to ignore installing (for "all")
     ignore_install = {},

     ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
     -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

     highlight = {
         enable = true,

         -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
         -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
         -- the name of the parser)
         -- list of language that will be disabled
         disable = { "c" },
         -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
     },
}
use({
     'rose-pine/neovim',
     as = 'rose-pine',
     config = function()
         vim.cmd('colorscheme rose-pine')
     end
})
end)
