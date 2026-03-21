-- Theme
require("catppuccin")
vim.cmd.colorscheme "catppuccin-macchiato"

-- Basic config
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false 
vim.opt.tabstop = 4
vim.opt.swapfile = false 
 
vim.cmd [[
    augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END
]]
 
