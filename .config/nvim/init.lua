require("set")
vim.g.mapleader = " "
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local filetype = vim.bo.filetype
    if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
      vim.cmd('lua vim.lsp.buf.format()')
    else
    end
  end
})

-- Lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Filetypes to enable spellcheck
local spell_types = { "text", "plaintex", "typst", "gitcommit", "markdown", "latex", "tex" }

-- Set global spell option to false initially to disable it for all file types
vim.opt.spell = false

-- Create an augroup for spellcheck to group related autocommands
vim.api.nvim_create_augroup("Spellcheck", { clear = true })

-- Create an autocommand to enable spellcheck for specified file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck",        -- Grouping the command for easier management
  pattern = spell_types,       -- Only apply to these file types
  callback = function()
    vim.opt_local.spell = true -- Enable spellcheck for these file types
  end,
})

require("lazy").setup("plugins", opts)
require("oil").setup(require("config.oil"))
require("keymaps")
require("colorscheme")
require("config.treesitter")
require("config.render-markdown")
require("ibl").setup()
require('guess-indent').setup {}
