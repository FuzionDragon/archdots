local servers = {
	lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        disable = { "lowercase-global" }
      }
    },
  },
	eslint = {},
	rust_analyzer = {},
	ts_ls= {},
	pyright = {},
	html = { filetypes = { 'html', 'twig', 'hbs' } },
	gopls = {},
  clangd = {

  },
  marksman = {},
  jdtls = {},
  jsonls = {},
}

return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          servers = servers,
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { 'williamboman/mason.nvim', config = true },
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('lspconfig').lua_ls.setup { capabilities = capabilities }
      require('lspconfig').rust_analyzer.setup {
        capabilities = capabilities,
        filetypes = { 'rust' },
        settings = {
          ['rust_analyzer'] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      }
      require('lspconfig').ts_ls.setup { capabilities = capabilities }
      require('lspconfig').pyright.setup { capabilities = capabilities }
      require('lspconfig').marksman.setup { capabilities = capabilities }
      require('lspconfig').jsonls.setup { capabilities = capabilities }
      require('lspconfig').jdtls.setup { capabilities = capabilities }
    end,
  },
}
