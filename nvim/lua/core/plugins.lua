local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {'phaazon/hop.nvim'},
    -- для работы с деревом файловой системы
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
            -- мб ещё что-то надо
            -- "3rd/image.nvim",
        }
    },
    -- пакет, нужный для более корректного парсинга синтаксического дерева языка программирования
    -- используется для auto-complete и подсветки синтаксиса
    {'nvim-treesitter/nvim-treesitter'}, 

    -- LSP
    -- по идее это универсальный конфигуратор для LSP серверов, 
    -- но так ли это на самом деле я фз
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim"
                },
                -- opts = { lsp = { auto_attach = true } }
            }
        },
    },

    -- Theme
    {'navarasu/onedark.nvim'},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- какая-то фигня для работы автокомплита
    -- snippet engeen для работы автодополнения
    {'hrsh7th/vim-vsnip'}, {'hrsh7th/vim-vsnip-integ'}, -- CMP (auto complete)
    --- { 'neovim/nvim-lspconfig' }, - уже есть
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, -- Mason
    -- пакетный менеджер LSP и другого барахла для рефакторинга кода в live-time
    {'williamboman/mason.nvim'}, -- , build = ":MasonUpdate"}, -- Telescope
    -- утилита для поиска по файловой системе + благодаря telescope может показывать куски содержимого файлов
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, -- Null-ls
    {'jose-elias-alvarez/null-ls.nvim'}, 

    -- scopes auto pairing
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }, -- tabs inside one window
    -- буквально для работы со вкладками файлов
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'}
    },

    -- заставка при открытии
    {
        "startup-nvim/startup.nvim",
        dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    },

    -- для использования нескольких курсоров одновременно
    {
        "mg979/vim-visual-multi"
    },

    -- для просмотра изображений
    { 'edluffy/hologram.nvim' },
    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        opts = {
            rocks = { "magick" },
        },
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
    },

    -- terminal
    { 'voldikss/vim-floaterm' },

    {
        "neovim/nvim-lspconfig",        -- your lsp config or other stuff
    },

    -- for scrolling in window
    {'petertriho/nvim-scrollbar'},

     -- git
     {'lewis6991/gitsigns.nvim'}
})
