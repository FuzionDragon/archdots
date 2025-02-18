local fzf = require('fzf-lua')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- Neovim Maps
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader><leader>", ":so<CR>")

-- Moving Visual Select  
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- Jumping to previous search item
vim.keymap.set("n", "<C-/>", "/<CR>")
vim.keymap.set("n", "<C-.>", "?<CR>")

-- Jumping Visual Select
vim.keymap.set("v", "<C-/>", "/'<',><CR>")
vim.keymap.set("v", "<C-.>", "?'<',><CR>")

-- Moves below line to current
vim.keymap.set("n", "J", "mzJ`z")

-- Half Page Jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank Visual Select to Clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete Visual Select to Clipboard
vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")

-- Paste over a text while keeping copied text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Edit all instances of selected word
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Lazy nvim bind
vim.keymap.set("n", "<leader>L", ":Lazy<CR>")

-- Fzf-lua
vim.keymap.set('n', '<leader>sf', fzf.files)
vim.keymap.set('n', '<leader>sg', fzf.git_files)
vim.keymap.set('n', '<leader>sh', fzf.live_grep)
vim.keymap.set('n', '<leader>sq', fzf.quickfix)

-- Harpoon
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>e', mark.rm_file)

vim.keymap.set('n', '<C-h>', function() ui.nav_prev() end)
vim.keymap.set('n', '<C-l>', function() ui.nav_next() end)

-- Fterm
vim.keymap.set('n', '<C-o>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-o>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Vim Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- Guess Indent
vim.keymap.set('n', '<leader>gi', ':GuessIndent<CR>')

-- Go to Definition or Declaration
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
