return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'EdenEast/nightfox.nvim',
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
	'folke/tokyonight.nvim',
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
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
                'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
                'folke/neodev.nvim',
            },
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
        options = {
            icons_enabled = false,
            theme = 'terafox',
            component_separators = '|',
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
    'stevearc/oil.nvim',
    'windwp/nvim-ts-autotag',
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
}
