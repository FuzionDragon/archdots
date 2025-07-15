vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.undotree = os.getenv("HOME") .. "/.vim/undodir"
vim.undofile = true

vim.opt.conceallevel = 1
vim.opt.guicursor = ""

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 4

vim.diagnostic.config({
  float = {
    header = "",
    focusable = false,
    border = "rounded",
    close_events = {
      "BufLeave",
      "CursorMoved",
      "InsertEnter",
      "FocusLost",
    },
    prefix = "",
    suffix = "",
    format = function(diagnostic)
      if diagnostic.source == 'rustc'
        and diagnostic.user_data.lsp.data ~= nil
      then
        return diagnostic.user_data.lsp.data.rendered
      else
        return diagnostic.message
      end
    end,
},
  virtual_text = false,
  update_in_insert = true,
})
