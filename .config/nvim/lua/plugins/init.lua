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
            require "plugins.cmp"
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
            require "plugins.luasnip"
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

    -- BUFFER
    ["akinsho/bufferline.nvim"] = {
        tag = "v2.*",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.bufferline"
        end,
    },

    -- COMMENT
    ["numToStr/Comment.nvim"] = {
        module = "Comment",
        setup = function()
            require("core.lazy_load").on_file_open "Comment.nvim"
        end,
        config = function()
            require "plugins.comment"
        end,
    },
    ["folke/todo-comments.nvim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "todo-comments.nvim"
        end,
        config = function()
            require "plugins.todo-comments"
        end,
    },

    -- CSV
    ["mechatroner/rainbow_csv"] = {
        ft = "csv",
    },

    -- DAP
    ["mfussenegger/nvim-dap"] = {
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        config = function()
            require "plugins.dap"
        end,
    },
    ["rcarriga/nvim-dap-ui"] = {
        after = "nvim-dap",
        config = function()
            require "plugins.dap-ui"
        end,
    },
    ["nvim-telescope/telescope-dap.nvim"] = {
        after = "nvim-dap",
        config = function()
            require "plugins.telescope-dap"
        end,
    },
    ["theHamsta/nvim-dap-virtual-text"] = {
        after = "nvim-dap",
        config = function()
            require "plugins.dap-virtual-text"
        end,
    },

    -- EDIT
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
            require "plugins.treesitter"
        end,
    },
    ["editorconfig/editorconfig-vim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "editorconfig-vim"
        end,
    },
    ["nacro90/numb.nvim"] = {
        event = "CmdlineEnter",
        config = function()
            require "plugins.numb"
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
            require "plugins.treesitter-textobjects"
        end,
    },
    ["mg979/vim-visual-multi"] = {
        keys = { "<M-n>", "<C-Up>", "<C-Down>", "\\\\\\", "\\\\A", "\\\\/" },
        setup = function()
            require "plugins.visual-multi"
        end,
        config = function()
            -- require "plugins.visual-multi"
            require("core.utils").load_highlight "visual-multi"
        end,
    },
    ["fedepujol/move.nvim"] = {
        cmd = { "MoveLine", "MoveBlock" },
    },
    ["ZhiyuanLck/smart-pairs"] = {
        event = "InsertEnter",
        config = function()
            require "plugins.smart-pairs"
        end,
    },
    ["SmiteshP/nvim-gps"] = {
        module = "nvim-gps",
        config = function()
            require "plugins.gps"
        end,
    },
    ["SmiteshP/nvim-navic"] = {
        module = "nvim-navic",
        config = function()
            require "plugins.navic"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-context"] = {
        module = "treesitter-context",
        config = function()
            require "plugins.treesitter-context"
        end,
    },
    ["chentoast/marks.nvim"] = {
        cmd = "MarksToggle",
        config = function()
            require "plugins.marks"
        end,
    },
    ["David-Kunz/treesitter-unit"] = {
        after = "nvim-treesitter",
        config = function()
            require "plugins.treesitter-unit"
        end,
    },
    ["ThePrimeagen/harpoon"] = {
    },

    -- EXPLORER
    ["kyazdani42/nvim-tree.lua"] = {
        cmd = {
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeFindFile",
        },
        config = function()
            require "plugins.tree"
        end,
    },
    ["nvim-telescope/telescope-file-browser.nvim"] = {
        after = "telescope.nvim",
        config = function()
            require "plugins.telescope-file-browser"
        end,
    },

    -- FINDER
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        module = "telescope",
        config = function()
            require "plugins.telescope"
        end,
    },
    -- FOLD
    ["kevinhwang91/nvim-ufo"] = {
        requires = "kevinhwang91/promise-async",
        config = function()
            require "plugins.ufo"
        end
    },

    -- GIT
    ["lewis6991/gitsigns.nvim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "gitsigns.nvim"
        end,
        config = function()
            require "plugins.gitsigns"
        end,
    },
    ["rhysd/git-messenger.vim"] = {
        after = "gitsigns.nvim",
        config = function()
            require "plugins.git-messenger"
        end,
    },
    ["TimUntersberger/neogit"] = {
        cmd = "Neogit",
        config = function()
            require "plugins.neogit"
        end,
    },

    -- JUMP
    ["rlane/pounce.nvim"] = {
        cmd = "Pounce",
        config = function()
            require "plugins.pounce"
        end,
    },

    -- KEYMAP
    ["folke/which-key.nvim"] = {
        after = "legendary.nvim",
        config = function()
            require "plugins.which-key"
        end,
    },

    -- LSP
    ["williamboman/mason-lspconfig.nvim"] = {
        event = "UIEnter",
        config = function()
            require "plugins.mason-lspconfig"
        end,
    },
    ["neovim/nvim-lspconfig"] = {
        after = "mason-lspconfig.nvim",
        config = function()
            require "plugins.lspconfig"
        end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
        setup = function()
            require "plugins.null-ls"
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
            require "plugins.aerial"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-refactor"] = {
        module = "refactor",
        config = function()
            require "plugins.treesitter-refactor"
        end,
    },
    ["ThePrimeagen/refactoring.nvim"] = {
        disable = true,
        module = "refactoring",
        setup = function()
            require "plugins.refactoring"
        end
    },

    -- MISCELLANEOUS
    ["jbyuki/instant.nvim"] = {
        opt = true,
        config = function()
            require "plugins.instant"
        end,
    },

    -- NOTES
    ["nvim-neorg/neorg"] = {
        ft = "norg",
        cmd = "NeorgStart",
        config = function()
            require "plugins.neorg"
        end,
    },

    -- PACKAGE
    ["williamboman/mason.nvim"] = {
        event = "UIEnter",
        config = function()
            require "plugins.mason"
        end,
    },
    ["WhoIsSethDaniel/mason-tool-installer.nvim"] = {
        after = "mason.nvim",
        config = function()
            require "plugins.mason-tool-installer"
        end,
    },

    -- PLUGIN
    ["wbthomason/packer.nvim"] = {},

    -- SESSION
    ["olimorris/persisted.nvim"] = {
        cmd = { "SessionSave", "SessionLoad" },
        config = function()
            require "plugins.persisted"
        end,
    },

    -- SPECIAL

    -- DOCKER
    ["jamestthompson3/nvim-remote-containers"] = {
        disable = true,
        config = function()
            require "plugins.remote-containers"
        end,
    },

    -- PYTHON
    ["jmcantrell/vim-virtualenv"] = {
        ft = "python",
        cmd = "VirtualEnvList",
    },

    -- SQL
    ["ethanolx/vim-dadbod"] = {
        ft = "sql",
        cmd = { "DB", "DBUI" },
        config = function()
            require "plugins.dadbod"
        end,
    },
    ["kristijanhusak/vim-dadbod-ui"] = {
        after = "vim-dadbod",
        ft = "sql",
        config = function()
            require "plugins.dadbod-ui"
        end,
    },

    -- STATUS LINE
    ["feline-nvim/feline.nvim"] = {
        after = "nvim-web-devicons",
        config = function()
            require "plugins.feline"
        end,
    },

    -- TERMINAL
    ["akinsho/toggleterm.nvim"] = {
        cmd = "ToggleTerm",
        tag = "v2.*",
        -- keys = "<leader>t",
        config = function()
            require "plugins.toggleterm"
        end,
    },

    -- TESTS
    ["nvim-neotest/neotest"] = {
        module = "neotest",
        config = function()
            require "plugins.neotest"
        end,
    },

    -- UI
    ["kyazdani42/nvim-web-devicons"] = {
        event = { "UIEnter", },
        config = function()
            require "plugins.web-devicons"
        end,
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require "plugins.indent-blankline"
        end,
    },
    ["norcalli/nvim-colorizer.lua"] = {
        setup = function()
            require("core.lazy_load").colorizer()
        end,
        config = function()
            require "plugins.colorizer"
        end,
    },
    ["stevearc/dressing.nvim"] = {
        config = function()
            require "plugins.dressing"
        end,
    },
    ["rcarriga/nvim-notify"] = {
        config = function()
            require "plugins.notify"
        end,
    },
    ["p00f/nvim-ts-rainbow"] = {
        -- module = "nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require "plugins.treesitter-rainbow"
        end,
    },

    -- UTILITIES
    ["nvim-telescope/telescope-fzf-native.nvim"] = {
        run = "make",
        after = "telescope.nvim",
        config = function()
            require "plugins.telescope-fzf-native"
        end,
    },
    ["mrjones2014/legendary.nvim"] = {
        -- config = function()
        --     require "plugins.legendary"
        -- end,
    },
    ["Weissle/persistent-breakpoints.nvim"] = {
    },
    ["dstein64/vim-startuptime"] = {
        cmd = "StartupTime",
    },
    ["rest-nvim/rest.nvim"] = {
        keys = "<space>xr",
        config = function ()
            require "plugins.rest"
        end,
    },
    ["tpope/vim-abolish"] = {
        cmd = { "Abolish", "Subvert" },
    },
    ["protex/better-digraphs.nvim"] = {
        module = "better-digraphs",
        config = function()
            require "plugins.better-digraphs"
        end,
    },
    ["lewis6991/spellsitter.nvim"] = {
        after = "nvim-treesitter",
        config = function()
            require "plugins.spellsitter"
        end,
    },
    ["folke/twilight.nvim"] = {
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        after = "zen-mode.nvim",
        config = function()
            require "plugins.twilight"
        end,
    },
    ["folke/zen-mode.nvim"] = {
        after = "neorg",
        cmd = "ZenMode",
        config = function()
            require "plugins.zen-mode"
        end,
    },
    ["nvim-treesitter/playground"] = {
        cmd = "TSPlaygroundToggle",
        config = function()
            require "plugins.playground"
        end,
    },
    ["karb94/neoscroll.nvim"] = {
        keys = { "<C-b>", "<C-f>", "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        config = function()
            require "plugins.neoscroll"
        end,
    },
    ["ziontee113/color-picker.nvim"] = {
        cmd = { "PickColor", "PickColorInsert" },
        config = function()
            require "plugins.color-picker"
        end,
    },
    ["kylechui/nvim-surround"] = {
        setup = function()
            require("core.lazy_load").on_file_open "nvim-surround"
        end,
        config = function()
            require "plugins.surround"
        end,
    },
    ["AckslD/nvim-trevJ.lua"] = {
        module = "trevj",
        config = function()
            require "plugins.trevJ"
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
            require "plugins.satellite"
        end,
    },
    ["folke/trouble.nvim"] = {
        ft = "qf",
        cmd = "Trouble",
        module = "trouble",
        config = function()
            require "plugins.trouble"
        end
    },
    ["lewis6991/hover.nvim"] = {
        module = "hover",
        config = function()
            require "plugins.hover"
        end
    },
    ["tpope/vim-dotenv"] = {
        cmd = "Dotenv",
    },

    -- VIM
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

    -- Yuck
    ["elkowar/yuck.vim"] = {
    },
}
