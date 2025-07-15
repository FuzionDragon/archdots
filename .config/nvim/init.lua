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

require("lazy").setup("plugins", opts)
require("oil").setup(require("config.oil"))
require("keymaps")
require("colorscheme")
require("config.treesitter")
require("config.render-markdown")
require("ibl").setup()
require('guess-indent').setup {}
require("colorizer").setup {
  'css',
  'javascript',
  'typescript',
  html = {
    mode = 'foreground',
  }
}
