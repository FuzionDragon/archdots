require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "stylua",
    "rust_analyzer",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.config("pyright", {
  filetypes = { "python" },
})
vim.lsp.config("harper_ls", {
  filetypes = { "markdown", "tex" },
  settings = {
    ["harper-ls"] = {
      userDictPath = "~/.config/nvim/spell/en.utf-8.add",
    },
  },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("gdscript")
vim.lsp.enable("textlab")
vim.lsp.enable("ltex-ls")
vim.lsp.enable("harper-ls")
vim.lsp.enable("jsonls")
vim.lsp.enable("html-ls")
vim.lsp.enable("bash-language-server")
vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
      })
    end
  end,
})
