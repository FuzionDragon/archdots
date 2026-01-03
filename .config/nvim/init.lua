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
local spell_types = { "text", "plaintex", "typst", "gitcommit", "markdown", "latex" }

-- Set global spell option to false initially to disable it for all file types
vim.opt.spell = false

-- Create an augroup for spellcheck to group related autocommands
vim.api.nvim_create_augroup("Spellcheck", { clear = true })

-- Create an autocommand to enable spellcheck for specified file types
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck",                             -- Grouping the command for easier management
  pattern = spell_types,                            -- Only apply to these file types
  callback = function()
    vim.opt_local.spell = true                      -- Enable spellcheck for these file types
  end,
  desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})

-- paths to check for project.godot file
local paths_to_check = { '/', '/../' }
local is_godot_project = false
local godot_project_path = ''
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for key, value in pairs(paths_to_check) do
  if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
    is_godot_project = true
    godot_project_path = cwd .. value
    break
  end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
-- start server, if not already running
if is_godot_project and not is_server_running then
  vim.fn.serverstart(godot_project_path .. '/server.pipe')
end

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
