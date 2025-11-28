-- Clear highlights after searching
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Remap leader to space
vim.g.mapleader = " "

-- Space + q to quit file in neovim
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

-- Return to Visual mode after inserting new line
vim.keymap.set("n", "<CR>", "o<leader><Esc>", { noremap = true, silent = true })

-- Indent all lines with space+s
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })

-- Disable arrow keys in normal mode and insert mode
vim.keymap.set({ "n", "i"}, "<Up>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i"}, "<Down>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i"}, "<Left>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i"}, "<Right>", "<NOP>", { noremap = true, silent = true })

-- Remap half down and up to J and K
vim.keymap.set({ "n", "v"}, "J", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set({ "n", "v"}, "K", "<C-u>zz", { noremap = true, silent = true })

-- Swap : and ;
vim.keymap.set({'n', 'v'}, ';', ':', { noremap = true })
vim.keymap.set({'n', 'v'}, ':', ';', { noremap = true })

-- Prevent losing clipboard when pasting
vim.keymap.set("x", "<leader>p", "\"_dP", { noremap = true, silent = true })

vim.keymap.set('n', 'gh', function()
  require('vscode-neovim').action('editor.action.showDefinitionPreviewHover')
end, { noremap = true, silent = true })
