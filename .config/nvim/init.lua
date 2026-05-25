require("set")
vim.g.mapleader = " "
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local filetype = vim.bo.filetype
    if vim.bo.modified == true and mode == "n" and filetype ~= "oil" then
      vim.cmd("lua vim.lsp.buf.format()")
    else
    end
  end,
})

-- Filetypes to enable spellcheck
local spell_types = { "text", "plaintex", "typst", "gitcommit", "markdown", "latex", "tex" }

-- Set global spell option to false initially to disable it for all file types
vim.opt.spell = false

-- Create an augroup for spellcheck to group related autocommands
vim.api.nvim_create_augroup("Spellcheck", { clear = true })

-- Create an autocommand to enable spellcheck for specified file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck", -- Grouping the command for easier management
  pattern = spell_types, -- Only apply to these file types
  callback = function()
    vim.opt_local.spell = true -- Enable spellcheck for these file types
  end,
})

vim.pack.add(require("plugins"))
require("oil").setup(require("config.oil"))
require("keymaps")
require("colorscheme")
require("config.treesitter")
require("config.render-markdown")
require("config.lspconfig")
require("ibl").setup()
require("lualine").setup()
require("guess-indent").setup({})
require("autoclose").setup()
