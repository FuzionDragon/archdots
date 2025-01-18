local lspconfig = require('config.lspconfig')
local obsidian = require('config.obsidian')
local diagnostics = require('config.diagnostics')
local toggleterm = require('config.toggle-term')
--local colorizer = require('config.colorizer')

return {
	'EdenEast/nightfox.nvim',
  'williamboman/mason.nvim',
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'echasnovski/mini.icons',
        opts = {},
      },
    },
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
    options = {
      icons_enabled = true,
      theme = 'terafox',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      },
    },
  },
  {
    'karb94/neoscroll.nvim',
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = true,              -- Function to run before the scrolling animation starts
    post_hook = true,             -- Function to run after the scrolling animation ends
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
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = { },
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  },
  'thePrimeagen/vim-be-good',
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
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
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
  'norcalli/nvim-colorizer.lua',
  lspconfig,
--  diagnostics,
  toggleterm,
--  obsidian,
 -- colorizer,
}
