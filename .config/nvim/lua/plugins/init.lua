-- NAMING CONVENTION:

-- CATEGORY:
-- noun: singular
-- verb: simple present tense; plural

-- PLUGIN:
-- 1) Convert to lowercase
-- 2) Remove "[n]vim"
-- 3. Remove ".lua"
-- 4) Strip leading non-alphabetical characters
-- 5) Strip trailing non-alphabetical characters
-- 6) Replace non-alphabetical segments with "-"


return {
    -- AUTOCOMPLETION
    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        module = "cmp",
        config = function()
            require "plugins.conf.cmp"
        end,
    },
    ["rafamadriz/friendly-snippets"] = {
        event = { "InsertEnter", "CmdlineEnter" },
    },
    ["hrsh7th/cmp-nvim-lsp"] = {
        after = "nvim-cmp",
    },
    ["L3MON4D3/LuaSnip"] = {
        wants = "friendly-snippets",
        after = "cmp-nvim-lsp",
        config = function()
            require "plugins.conf.luasnip"
        end,
    },
    ["saadparwaiz1/cmp_luasnip"] = {
        after = "LuaSnip",
    },
    ["hrsh7th/cmp-buffer"] = {
        after = "cmp_luasnip",
    },
    ["hrsh7th/cmp-path"] = {
        after = "cmp-buffer",
    },
    ["rcarriga/cmp-dap"] = {
        ft = "dap-repl",
    },
    ["hrsh7th/cmp-nvim-lua"] = {
        after = "cmp_luasnip",
    },
    ["hrsh7th/cmp-nvim-lsp-signature-help"] = {
        after = "cmp-nvim-lsp",
    },
    ["petertriho/cmp-git"] = {
        ft = "gitcommit",
    },
    ["hrsh7th/cmp-cmdline"] = {
        after = "cmp-buffer",
    },
    ["kristijanhusak/vim-dadbod-completion"] = {
        ft = "sql",
        after = "vim-dadbod",
    },

    -- BUFFERS
    ["akinsho/bufferline.nvim"] = {
        tag = "v2.*",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.conf.bufferline"
        end,
    },

    -- COMMENTS
    ["numToStr/Comment.nvim"] = {
        module = "Comment",
        setup = function()
            require("core.lazy_load").on_file_open "Comment.nvim"
        end,
        config = function()
            require "plugins.conf.comment"
        end,
    },
    ["folke/todo-comments.nvim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "todo-comments.nvim"
        end,
        config = function()
            require "plugins.conf.todo-comments"
        end,
    },

    -- DAP
    ["mfussenegger/nvim-dap"] = {
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        config = function()
            require "plugins.conf.dap"
        end,
    },
    ["rcarriga/nvim-dap-ui"] = {
        after = "nvim-dap",
        config = function()
            require "plugins.conf.dap-ui"
        end,
    },
    ["nvim-telescope/telescope-dap.nvim"] = {
        after = "nvim-dap",
    },
    ["theHamsta/nvim-dap-virtual-text"] = {
        after = "nvim-dap",
        config = function()
            require "plugins.conf.dap-virtual-text"
        end,
    },

    -- EDITING
    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        setup = function()
            require("core.lazy_load").on_file_open "nvim-treesitter"
        end,
        cmd = {
            "TSInstall",
            "TSBufEnable",
            "TSBufDisable",
            "TSEnable",
            "TSDisable",
            "TSModuleInhfo",
        },
        run = ":TSUpdate",
        config = function()
            require "plugins.conf.treesitter"
        end,
    },
    ["nacro90/numb.nvim"] = {
        event = "CmdlineEnter",
        config = function()
            require "plugins.conf.numb"
        end,
    },
    ["wellle/targets.vim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "targets.vim"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-textobjects"] = {
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf.treesitter-textobjects"
        end,
    },
    ["mg979/vim-visual-multi"] = {
        keys = { "<M-n>", "<C-Up>", "<C-Down>", "\\\\\\", "\\\\A", "\\\\/" },
        setup = function()
            require "plugins.conf.visual-multi"
        end,
        config = function()
            -- require "plugins.conf.visual-multi"
            require("core.utils").load_highlight "visual-multi"
        end,
    },
    ["fedepujol/move.nvim"] = {
        cmd = { "MoveLine", "MoveBlock" },
    },
    ["ZhiyuanLck/smart-pairs"] = {
        -- branch = "dev",
        event = "InsertEnter",
        config = function()
            require "plugins.conf.smart-pairs"
        end,
    },
    ["SmiteshP/nvim-gps"] = {
        module = "nvim-gps",
        config = function()
            require "plugins.conf.gps"
        end,
    },
    ["SmiteshP/nvim-navic"] = {
        module = "nvim-navic",
        config = function()
            require "plugins.conf.navic"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-context"] = {
        -- after = "nvim-treesitter",
        module = "treesitter-context",
        cond = function()
            return vim.g.context_provider == "treesitter-context"
        end,
        config = function()
            require "plugins.conf.treesitter-context"
        end,
    },
    ["chentoast/marks.nvim"] = {
	cmd = "MarksToggle",
        config = function()
            require "plugins.conf.marks"
        end,
    },
    ["David-Kunz/treesitter-unit"] = {
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf.treesitter-unit"
        end,
    },
    ["ThePrimeagen/harpoon"] = {
    },

    -- EXPLORER
    ["kyazdani42/nvim-tree.lua"] = {
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.conf.tree"
        end,
    },
    ["nvim-telescope/telescope-file-browser.nvim"] = {
        after = "telescope.nvim",
        config = function()
            require "plugins.conf.telescope-file-browser"
        end,
    },

    -- FINDER
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        module = "telescope",
        config = function()
            require "plugins.conf.telescope"
        end,
    },

    -- GIT
    ["lewis6991/gitsigns.nvim"] = {
        -- cond = function()
        --     vim.cmd [[silent!git rev-parse --is-inside-work-tree]]
        --     return (vim.v.shell_error == 0)
        -- end,
        setup = function()
            require("core.lazy_load").on_file_open "gitsigns.nvim"
        end,
        config = function()
            require "plugins.conf.gitsigns"
        end,
    },
    ["rhysd/git-messenger.vim"] = {
        after = "gitsigns.nvim",
        config = function()
            require "plugins.conf.git-messenger"
        end,
    },
    ["TimUntersberger/neogit"] = {
        cmd = "Neogit",
        config = function()
            require "plugins.conf.neogit"
        end,
    },

    -- KEYMAP
    ["folke/which-key.nvim"] = {
        after = "legendary.nvim",
        config = function()
            require "plugins.conf.which-key"
        end,
    },

    -- LSP
    ["williamboman/mason-lspconfig.nvim"] = {
        after = "mason-tool-installer.nvim",
        config = function ()
            require "plugins.conf.mason-lspconfig" 
        end,
    },
    ["neovim/nvim-lspconfig"] = {
        after = "mason-lspconfig.nvim",
        config = function()
            require "plugins.conf.lspconfig"
        end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        setup = function()
            require "plugins.conf.null-ls"
        end,
    },


    -- OUTLINE
    ["simrat39/symbols-outline.nvim"] = {
        cmd = "SymbolsOutline",
        module = "symbols-outline",
    },
    ["stevearc/aerial.nvim"] = {
        cmd = "AerialToggle",
        config = function()
            require "plugins.conf.aerial"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-refactor"] = {
        module = "refactor",
        config = function()
            require "plugins.conf.treesitter-refactor"
        end,
    },
    ["ThePrimeagen/refactoring.nvim"] = {
        disable = true,
        module = "refactoring",
        setup = function()
            require "plugins.conf.refactoring"
        end
    },

    -- MISCELLANEOUS
    ["jbyuki/instant.nvim"] = {
        opt = true,
        config = function()
            require "plugins.conf.instant"
        end,
    },

    -- NOTES
    ["nvim-neorg/neorg"] = {
        ft = "norg",
        cmd = "NeorgStart",
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf.neorg"
        end,
    },

    -- PLUGIN/PACKAGE
    ["wbthomason/packer.nvim"] = { },
    ["williamboman/mason.nvim"] = {
        config = function ()
            require "plugins.conf.mason" 
        end,
    },
    ["WhoIsSethDaniel/mason-tool-installer.nvim"] = {
        after = "mason.nvim",
        config = function ()
            require "plugins.conf.mason-tool-installer"
        end,
    },

    -- SESSION
    ["olimorris/persisted.nvim"] = {
        cmd = { "SessionSave", "SessionLoad" },
        config = function()
            require "plugins.conf.persisted"
        end,
    },

    -- SPECIAL
    --   NOTE: CSV
    ["mechatroner/rainbow_csv"] = {
        ft = "csv",
    },

    --   NOTE: DOCKER
    ["jamestthompson3/nvim-remote-containers"] = {
        disable = true,
        config = function()
            require "plugins.conf.remote-containers"
        end,
    },

    --   NOTE: PYTHON
    ["jmcantrell/vim-virtualenv"] = {
        ft = "python",
        cmd = "VirtualEnvList",
    },

    --   NOTE: SQL
    ["tpope/vim-dadbod"] = {
        ft = "sql",
        cmd = { "DB", "DBUI" },
        config = function()
            require "plugins.conf.dadbod"
        end,
    },
    ["kristijanhusak/vim-dadbod-ui"] = {
        after = "vim-dadbod",
        ft = "sql",
        config = function()
            require "plugins.conf.dadbod-ui"
        end,
    },

    -- STATUS LINE
    ["feline-nvim/feline.nvim"] = {
        after = "nvim-web-devicons",
        config = function()
            require "plugins.conf.feline"
        end,
    },

    -- TERMINAL
    ["akinsho/toggleterm.nvim"] = {
        cmd = "ToggleTerm",
        tag = "v2.*",
        -- keys = "<leader>t",
        config = function()
            require "plugins.conf.toggleterm"
        end,
    },

    -- TESTS
    ["nvim-neotest/neotest"] = {
        module = "neotest",
        config = function()
            require "plugins.conf.neotest"
        end,
    },

    -- UI
    ["kyazdani42/nvim-web-devicons"] = {
        event = { "UIEnter", },
        config = function()
            require "plugins.conf.web-devicons"
        end,
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require "plugins.conf.indent-blankline"
        end,
    },
    ["norcalli/nvim-colorizer.lua"] = {
        setup = function()
            require("core.lazy_load").colorizer()
        end,
        config = function()
            require "plugins.conf.colorizer"
        end,
    },
    ["stevearc/dressing.nvim"] = {
        module = "dressing",
        fn = { "vim.ui.input", "vim.ui.select" },
        config = function()
            require "plugins.conf.dressing"
        end,
    },
    ["rcarriga/nvim-notify"] = {
        module = "notify",
        fn = "vim.notify",
        config = function()
            require "plugins.conf.notify"
        end,
    },
    ["p00f/nvim-ts-rainbow"] = {
        -- module = "nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf.treesitter-rainbow"
        end,
    },

    -- UTILITIES
    ["nvim-lua/plenary.nvim"] = {
        module = "plenary"
    },
    ["nvim-lua/popup.nvim"] = {
        module = "popup",
    },
    ["lewis6991/impatient.nvim"] = {
    },

    ["antoinemadec/FixCursorHold.nvim"] = {
    },

    ["nvim-telescope/telescope-fzf-native.nvim"] = {
        run = "make",
        after = "telescope.nvim",
        config = function()
            require "plugins.conf.telescope-fzf-native"
        end,
    },
    ["mrjones2014/legendary.nvim"] = {},
    ["Weissle/persistent-breakpoints.nvim"] = {
    },
    ["dstein64/vim-startuptime"] = {
        cmd = "StartupTime",
    },
    ["tpope/vim-abolish"] = {
        cmd = { "Abolish", "Subvert" },
    },
    ["protex/better-digraphs.nvim"] = {
        module = "better-digraphs",
        config = function()
            require "plugins.conf.better-digraphs"
        end,
    },
    ["lewis6991/spellsitter.nvim"] = {
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf.spellsitter"
        end,
    },
    ["folke/twilight.nvim"] = {
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        after = "zen-mode.nvim",
        config = function()
            require "plugins.conf.twilight"
        end,
    },
    ["folke/zen-mode.nvim"] = {
        after = "neorg",
        cmd = "ZenMode",
        config = function()
            require "plugins.conf.zen-mode"
        end,
    },
    ["nvim-treesitter/playground"] = {
        cmd = "TSPlaygroundToggle",
        config = function()
            require "plugins.conf.playground"
        end,
    },
    ["karb94/neoscroll.nvim"] = {
        keys = { "<C-b>", "<C-f>", "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        config = function()
            require "plugins.conf.neoscroll"
        end,
    },
    ["ziontee113/color-picker.nvim"] = {
        cmd = { "PickColor", "PickColorInsert" },
        config = function()
            require "plugins.conf.color-picker"
        end,
    },
    ["kylechui/nvim-surround"] = {
        setup = function()
            require("core.lazy_load").on_file_open "nvim-surround"
        end,
        config = function()
            require "plugins.conf.surround"
        end,
    },
    ["AckslD/nvim-trevJ.lua"] = {
        module = "trevj",
        config = function()
            require "plugins.conf.trevJ"
        end,
    },
    ["mbbill/undotree"] = {
        cmd = "UndotreeToggle",
    },
    ["danymat/neogen"] = {
        cmd = "Neogen",
    },
    ["lewis6991/satellite.nvim"] = {
        config = function()
            require "plugins.conf.satellite"
        end,
    },
    ["folke/trouble.nvim"] = {
        ft = "qf",
        cmd = "Trouble",
        module = "trouble",
        config = function()
            require "plugins.conf.trouble"
        end
    },
    ["lewis6991/hover.nvim"] = {
        module = "hover",
        config = function()
            require "plugins.conf.hover"
        end
    },
    ["tpope/vim-dotenv"] = {
        cmd = "Dotenv",
    },
}
