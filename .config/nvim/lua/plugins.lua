local lspconfig = require('config.lspconfig')
local lualine = require('config.lualine')
local fzf = require('config.fzf')
--local colorizer = require('config.colorizer')

return {
  'EdenEast/nightfox.nvim',
  { 'williamboman/mason.nvim', version = "^1.0.0" },
  'nmac427/guess-indent.nvim',
  'theprimeagen/harpoon',
  'L3MON4D3/LuaSnip',
  {
    'nvim-lua/plenary.nvim',
    ft = "lua",
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'mbbill/undotree',
    lazy = true,
  },
  {
    'm4xshen/autoclose.nvim',
    opts = {
      options = {
        close = true,
        escape = true,
      }
    }
  },
  {
    'karb94/neoscroll.nvim',
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
      '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = true,             -- Function to run before the scrolling animation starts
    post_hook = true,            -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  },
  {
    'stevearc/oil.nvim',
    dependencies = {
      {
        'echasnovski/mini.icons',
        opts = {},
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = "markdown",
  },
  {
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
  },
  -- using lazy.nvim
  {
    "S1M0N38/love2d.nvim",
    event = "VeryLazy",
    version = "2.*",
    opts = {},
    keys = {
      { "<leader>v",  ft = "lua",          desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>",  ft = "lua",   desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua",   desc = "Stop LÖVE" },
    },
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_forward_search_on_start = false
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "/home/davidl/Documents/texfiles/",
        out_dir = "/home/davidl/Documents/texfiles/",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-bibtex",
        }
      }
    end
  },
  'norcalli/nvim-colorizer.lua',
  'numToStr/FTerm.nvim',
  lualine,
  fzf,
  lspconfig,
  --  colorizer,
}
