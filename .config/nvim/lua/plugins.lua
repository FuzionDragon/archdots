local lualine = require("config.lualine")
local fzf = require("config.fzf")
--local colorizer = require('config.colorizer')

local gh = function(x)
  return "https://github.com/" .. x
end
local cb = function(x)
  return "https://codeberg.org/" .. x
end

return {
  gh("EdenEast/nightfox.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
  gh("rafamadriz/friendly-snippets"),
  gh("nmac427/guess-indent.nvim"),
  gh("theprimeagen/harpoon"),
  gh("L3MON4D3/LuaSnip"),
  gh("folke/flash.nvim"),
  {
    src = gh("nvim-lua/plenary.nvim"),
    ft = "lua",
  },
  {
    src = gh("nvim-treesitter/nvim-treesitter"),
    version = "main",
    build = ":TSUpdate",
  },
  {
    src = gh("m4xshen/autoclose.nvim"),
    opts = {
      options = {
        close = true,
        escape = true,
      },
    },
  },
  {
    src = gh("karb94/neoscroll.nvim"),
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = true, -- Function to run before the scrolling animation starts
    post_hook = true, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  },
  {
    src = gh("stevearc/oil.nvim"),
    dependencies = {
      {
        "echasnovski/mini.icons",
        opts = {},
      },
    },
  },
  {
    src = gh("lukas-reineke/indent-blankline.nvim"),
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    src = gh("MeanderingProgrammer/render-markdown.nvim"),
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = "markdown",
  },
  {
    src = gh("kylechui/nvim-surround"),
    event = "VeryLazy",
  },
  {
    src = gh("lervag/vimtex"),
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
  },
  {
    src = gh("3rd/image.nvim"),
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = "magick_cli",
    },
  },
  {
    src = gh("rachartier/tiny-inline-diagnostic.nvim"),
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },
  {
    src = gh("michaelrommel/nvim-silicon"),
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
      output = "~/Pictures/Screenshots/code.png",
      no_window_controls = true,
      tab_width = 4,
      pad_horiz = 10,
      pad_vert = 10,
    },
  },
  { src = gh("j-hui/fidget.nvim"), tag = "legacy", opts = {} },
  gh("numToStr/FTerm.nvim"),
  lualine,
  fzf,
}
