local lspconfig = require('config.lspconfig')
local lualine = require('config.lualine')
local fzf = require('config.fzf')
--local colorizer = require('config.colorizer')

return {
  'EdenEast/nightfox.nvim',
  'williamboman/mason.nvim',
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
  'theprimeagen/harpoon',
  {
    'mbbill/undotree',
    lazy = true,
  },
  'L3MON4D3/LuaSnip',
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
  'nmac427/guess-indent.nvim',
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
  lspconfig,
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
  },
  'norcalli/nvim-colorizer.lua',
  'numToStr/FTerm.nvim',
  lualine,
  fzf,
  --  colorizer,
}
