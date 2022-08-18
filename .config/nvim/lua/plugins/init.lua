return {
    -- INFO: AUTOCOMPLETE
    ["hrsh7th/nvim-cmp"] = {
        after = "friendly-snippets",
        module = "cmp",
        config = function()
            require "plugins.conf._cmp"
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
            require "plugins.conf._luasnip"
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
        after = "nvim-dap",
        ft = "dap-repl",
    },
    ["hrsh7th/cmp-nvim-lua"] = {
        after = "cmp_luasnip",
    },
    ["hrsh7th/cmp-nvim-lsp-signature-help"] = {
        after = "cmp-nvim-lsp",
    },
    ["petertriho/cmp-git"] = {
        ft = { "gitcommit", },
    },
    ["hrsh7th/cmp-cmdline"] = {
        after = "cmp-buffer",
    },
    ["kristijanhusak/vim-dadbod-completion"] = {
        ft = { "sql", },
        after = "vim-dadbod",
    },

    -- INFO: BUFFERS
    ["akinsho/bufferline.nvim"] = {
        tag = "v2.*",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.conf._bufferline"
        end,
    },

    -- INFO: COMMENTS
    ["numToStr/Comment.nvim"] = {
        module = "Comment",
        setup = function ()
            require("core.lazy_load").on_file_open "Comment.nvim"
        end,
        config = function()
            require "plugins.conf._comment"
        end,
    },
    ["folke/todo-comments.nvim"] = {
        opt = true,
        event = "UIEnter", --FIX: clear
        setup = function()
            require("core.lazy_load").on_file_open "todo-comments.nvim"
        end,
        config = function()
            require "plugins.conf._todo-comments"
        end,
    },

    -- INFO: DAP
    ["mfussenegger/nvim-dap"] = {
        requires = "nvim-telescope/telescope.nvim",
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        config = function()
            require "plugins.conf._dap"
        end,
    },
    ["rcarriga/nvim-dap-ui"] = {
        requires = { "mfussenegger/nvim-dap" },
        after = "nvim-dap",
        config = function()
            require "plugins.conf._dap-ui"
        end,
    },
    ["nvim-telescope/telescope-dap.nvim"] = {
        requires = "nvim-telescope/telescope.nvim",
        after = "nvim-dap",
    },
    ["Pocco81/dap-buddy.nvim"] = {
        disable = true,
        -- opt = true,
        -- after = "nvim-dap",
        -- branch = "dev",
        config = function()
            require "plugins.conf._dap-buddy"
        end,
    },
    ["theHamsta/nvim-dap-virtual-text"] = {
        after = "nvim-dap",
        config = function()
            require "plugins.conf._dap-virtual-text"
        end,
    },

    -- INFO: EDITING
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
            require "plugins.conf._treesitter"
        end,
    },
    ["nacro90/numb.nvim"] = {
        event = "CmdlineEnter",
        config = function()
            require "plugins.conf._numb"
        end,
    },
    ["wellle/targets.vim"] = {
        setup = function()
            require("core.lazy_load").on_file_open "targets.vim"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-textobjects"] = {
        opt = true,
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf._treesitter-textobjects"
        end,
    },
    ["mg979/vim-visual-multi"] = {
        keys = { "<M-n>", "<C-Up>", "<C-Down>", "\\\\\\", "\\\\A", "\\\\/" },
        setup = function ()
            require "plugins.conf._visual-multi"
        end,
        config = function()
            -- require "plugins.conf._visual-multi"
            require("core.utils").load_highlight "visual-multi"
        end,
    },
    ["fedepujol/move.nvim"] = {
        opt = true,
        cmd = { "MoveLine", "MoveBlock" },
    },
    ["ZhiyuanLck/smart-pairs"] = {
        opt = true,
        -- branch = "dev",
        event = "InsertEnter",
        config = function()
            require "plugins.conf._smart-pairs"
        end,
    },
    ["SmiteshP/nvim-gps"] = {
        -- requires = "nvim-treesitter/nvim-treesitter",
        module = "nvim-gps",
        config = function()
            require "plugins.conf._gps"
        end,
    },
    ["SmiteshP/nvim-navic"] = {
        -- requires = "neovim/nvim-lspconfig",
        module = "nvim-navic",
        config = function()
            require "plugins.conf._navic"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-context"] = {
        requires = "nvim-treesitter/nvim-treesitter",
        -- after = "nvim-treesitter",
        module = "treesitter-context",
        cond = function()
            return vim.g.context_provider == "treesitter-context"
        end,
        config = function()
            require "plugins.conf._treesitter-context"
        end,
    },
    ["ziontee113/syntax-tree-surfer"] = {
        disable = true,
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require "plugins.conf._syntax-tree-surfer"
        end,
    },
    ["kevinhwang91/nvim-ufo"] = {
        opt = true,
        after = "nvim-treesitter",
        requires = "kevinhwang91/promise-async",
        config = function()
            require "plugins.conf._ufo"
        end,
    },
    ["mcauley-penney/tidy.nvim"] = {
        opt = true,
        event = "BufWritePre",
        config = function()
            require "plugins.conf._tidy"
        end,
    },
    ["chentoast/marks.nvim"] = {
        opt = true,
        keys = { "m", "`", "'" },
        config = function()
            require "plugins.conf._marks"
        end,
    },
    ["David-Kunz/treesitter-unit"] = {
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf._treesitter-unit"
        end,
    },
    ["ThePrimeagen/harpoon"] = {
        opt = true,
        requires = "nvim-lua/plenary.nvim",
    },

    -- INFO: EXPLORER
    ["kyazdani42/nvim-tree.lua"] = {
        opt = true,
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },

        config = function()
            require "plugins.conf._tree"
        end,
    },
    ["nvim-telescope/telescope-file-browser.nvim"] = {
        opt = true,
        requires = "nvim-telescope/telescope.nvim",
        after = "telescope.nvim",
        config = function()
            require "plugins.conf._telescope-file-browser"
        end,
    },

    -- INFO: FINDER
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        module = "telescope",
        config = function()
            require "plugins.conf._telescope"
        end,
    },

    -- INFO: GIT
    ["lewis6991/gitsigns.nvim"] = {
        opt = true,
        -- cond = function()
        --     vim.cmd [[silent!git rev-parse --is-inside-work-tree]]
        --     return (vim.v.shell_error == 0)
        -- end,
        setup = function()
            require("core.lazy_load").on_file_open "gitsigns.nvim"
        end,
        config = function()
            require "plugins.conf._gitsigns"
        end,
    },
    ["rhysd/git-messenger.vim"] = {
        opt = true,
        after = "gitsigns.nvim",
        config = function()
            require "plugins.conf._git-messenger"
        end,
    },
    ["TimUntersberger/neogit"] = {
        opt = true,
        cmd = "Neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "plugins.conf._neogit"
        end,
    },

    -- INFO: HELP
    ["folke/which-key.nvim"] = {
        config = function()
            require "plugins.conf._whichkey"
        end,
    },

    -- INFO: LSP
    ["neovim/nvim-lspconfig"] = {
        after = "nvim-lsp-installer",
        module = "lspconfig",
        config = function()
            require "plugins.conf._lsp_installer"
            require "plugins.conf._lspconfig"
        end,
    },
    ["williamboman/nvim-lsp-installer"] = {
        opt = true,
        cmd = require("core.lazy_load").lsp_cmds,
        setup = function()
            require("core.lazy_load").on_file_open "nvim-lsp-installer"
        end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        setup = function()
            require "plugins.conf._null-ls"
        end,
    },
    ["simrat39/symbols-outline.nvim"] = {
        cmd = "SymbolsOutline",
        module = "symbols-outline",
    },
    ["stevearc/aerial.nvim"] = {
        cmd = "AerialToggle",
        config = function()
            require "plugins.conf._aerial"
        end,
    },
    ["nvim-treesitter/nvim-treesitter-refactor"] = {
        opt = true,
        requires = "nvim-treesitter/nvim-treesitter",
        module = "refactor",
        config = function()
            require "plugins.conf._treesitter-refactor"
        end,
    },
    ["ThePrimeagen/refactoring.nvim"] = {
        disable = true,
        opt = true,
        requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", },
        module = "refactoring",
        setup = function()
            require "plugins.conf._refactoring"
        end
    },
    -- ["weilbith/nvim-code-action-menu"] = {

    --     opt = true,
    --     cmd = "CodeActionMenu",
    --     config = function()
    --         require "plugins.conf._code-action-menu"
    --     end,
    -- },

    -- INFO: MISCELLANEOUS
    ["jbyuki/instant.nvim"] = {
        opt = true,
        config = function()
            require "plugins.conf._instant"
        end,
    },

    -- INFO: NOTES
    ["nvim-neorg/neorg"] = {
        ft = "norg",
        cmd = "NeorgStart",
        after = "nvim-treesitter",
        requires = { "nvim-treesitter", "telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "plugins.conf._neorg"
        end,
    },

    -- INFO: SESSION
    ["olimorris/persisted.nvim"] = {
        opt = true,
        cmd = { "SessionSave", "SessionLoad" },
        config = function()
            require "plugins.conf._persisted"
        end,
    },

    -- INFO: SPECIAL
    --   NOTE: CSV
    ["mechatroner/rainbow_csv"] = {
        opt = true,
        ft = "csv",
    },

    --   NOTE: DOCKER
    ["jamestthompson3/nvim-remote-containers"] = {
        disable = true,
        config = function()
            require "plugins.conf._remote-containers"
        end,
    },

    --   NOTE: PYTHON
    ["jmcantrell/vim-virtualenv"] = {
        opt = true,
        ft = "python",
        cmd = "VirtualEnvList",
    },

    --   NOTE: SQL
    ["tpope/vim-dadbod"] = {
        opt = true,
        ft = "sql",
        cmd = { "DB", "DBUI" },
        config = function()
            require "plugins.conf._dadbod"
        end,
    },
    ["kristijanhusak/vim-dadbod-ui"] = {
        opt = true,
        after = "vim-dadbod",
        ft = "sql",
        config = function()
            require "plugins.conf._dadbod-ui"
        end,
    },

    -- INFO: STATUS LINE
    ["feline-nvim/feline.nvim"] = {
        after = "nvim-web-devicons",
        config = function()
            require "plugins.conf._feline"
        end,
    },

    -- INFO: TERMINAL
    ["akinsho/toggleterm.nvim"] = {
        cmd = "ToggleTerm",
        tag = "v2.*",
        -- keys = "<leader>t",
        config = function()
            require "plugins.conf._toggleterm"
        end,
    },

    -- INFO: TESTS
    ["nvim-neotest/neotest"] = {
        disable = true,
        opt = true,
        module = "neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        },
        after = "nvim-dap",
        config = function()
            require "plugins.conf._neotest"
        end,
    },

    -- INFO: UI
    ["kyazdani42/nvim-web-devicons"] = {
        event = { "UIEnter", },
        config = function()
            require "plugins.conf._web-devicons"
        end,
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require "plugins.conf._indent-blankline"
        end,
    },
    ["norcalli/nvim-colorizer.lua"] = {
        opt = true,
        setup = function()
            require("core.lazy_load").colorizer()
        end,
        config = function()
            require "plugins.conf._colorizer"
        end,
    },
    ["stevearc/dressing.nvim"] = {
        module = "dressing",
        fn = { "vim.ui.input", "vim.ui.select" },
        config = function()
            require "plugins.conf._dressing"
        end,
    },
    ["rcarriga/nvim-notify"] = {
        module = "notify",
        fn = "vim.notify",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require "plugins.conf._notify"
        end,
    },
    ["p00f/nvim-ts-rainbow"] = {
        opt = true,
        -- module = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf._treesitter-rainbow"
        end,
    },

    -- INFO: UTILITIES
    ["nvim-lua/plenary.nvim"] = {
        module = "plenary"
    },
    ["nvim-lua/popup.nvim"] = {
        module = "popup",
    },
    ["kevinhwang91/promise-async"] = {
        module = "promise",
    },
    ["lewis6991/impatient.nvim"] = {
    },
    ["wbthomason/packer.nvim"] = {
    },
    ["antoinemadec/FixCursorHold.nvim"] = {
    },
    -- ["MunifTanjim/nui.nvim"] = {},

    -- WARN: EXPERIMENTAL
    ["nvim-telescope/telescope-fzf-native.nvim"] = {
        opt = true,
        run = "make",
        after = "telescope.nvim",
        config = function()
            require "plugins.conf._telescope-fzf-native"
        end,
    },
    -- PERF: CHANGE TO legendary
    -- ["LinArcX/telescope-command-palette.nvim"] = {
    --     opt = true,
    --     config = function()
    --         require "plugins.conf._telescope-command-palette"
    --     end,
    -- },
    ["Weissle/persistent-breakpoints.nvim"] = {
        opt = true,
    },
    ["famiu/nvim-reload"] = {
        cmd = { "Reload", "Restart" },
    },
    ["dstein64/vim-startuptime"] = {
        cmd = "StartupTime",
    },
    ["tpope/vim-abolish"] = {
        cmd = { "Abolish", "Subvert" },
    },
    ["protex/better-digraphs.nvim"] = {
        requires = "nvim-telescope/telescope.nvim",
        module = "better-digraphs",
        config = function()
            require "plugins.conf._better-digraphs"
        end,
    },
    ["lewis6991/spellsitter.nvim"] = {
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require "plugins.conf._spellsitter"
        end,
    },
    ["smjonas/inc-rename.nvim"] = {
        opt = true,
        config = function()
            require "plugins.conf._inc-rename"
        end,
    },
    ["folke/twilight.nvim"] = {
        opt = true,
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        after = "zen-mode.nvim",
        config = function()
            require "plugins.conf._twilight"
        end,
    },
    ["folke/zen-mode.nvim"] = {
        opt = true,
        after = "neorg",
        cmd = "ZenMode",
        config = function()
            require "plugins.conf._zen-mode"
        end,
    },
    ["nvim-treesitter/playground"] = {
        opt = true,
        cmd = "TSPlaygroundToggle",
        config = function()
            require "plugins.conf._playground"
        end,
    },
    ["kevinhwang91/nvim-hlslens"] = {
        after = "nvim-scrollbar",
        config = function()
            require "plugins.conf._hlslens"
        end,
    },
    ["karb94/neoscroll.nvim"] = {
        keys = { "<C-b>", "<C-f>", "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        config = function()
            require "plugins.conf._neoscroll"
        end,
    },
    ["petertriho/nvim-scrollbar"] = {
        module = "scrollbar",
        -- setup = function()
        --     require("core.lazy_load").on_file_open "nvim-scrollbar"
        -- end,
        config = function()
            require "plugins.conf._scrollbar"
        end,
    },
    ["ziontee113/color-picker.nvim"] = {
        opt = true,
        cmd = { "PickColor", "PickColorInsert" },
        config = function()
            require "plugins.conf._color-picker"
        end,
    },
    ["kylechui/nvim-surround"] = {
        setup = function()
            require("core.lazy_load").on_file_open "nvim-surround"
        end,
        config = function()
            require "plugins.conf._surround"
        end,
    },
    ["AckslD/nvim-trevJ.lua"] = {
        module = "trevj",
        config = function()
            require "plugins.conf._trevJ"
        end,
    },
    ["mbbill/undotree"] = {
        opt = true,
        cmd = "UndotreeToggle",
    },
    ["danymat/neogen"] = {
        opt = true,
        cmd = "Neogen",
    },
    ["lewis6991/satellite.nvim"] = {
        module = "satellite",
        config = function()
            require "plugins.conf._satellite"
        end,
    },
    ["nvim-telescope/telescope-symbols.nvim"] = {
        opt = true,
    },
    ["folke/trouble.nvim"] = {
        ft = "qf",
        cmd = "Trouble",
        module = "trouble",
        config = function()
            require "plugins.conf._trouble"
        end
    },
    ["lewis6991/hover.nvim"] = {
        module = "hover",
        config = function()
            require "plugins.conf._hover"
        end
    },
    ["tpope/vim-dotenv"] = {
        cmd = "Dotenv",
    },

    -- FIX: DEPRECATED
    -- HACK: smjonas/inc-rename.nvim
    -- HACK: gbprod/cutlass.nvim
    -- HACK: ludovicchabant/vim-gutentags
    -- HACK: preservim/tagbar
    -- HACK: folke/persistence.nvim
    -- HACK: folke/trouble.nvim
    -- HACK: kdheepak/lazygit.nvim
    -- HACK: tpope/vim-surround
    -- HACK: ChristianChiarulli/nvcode-color-schemes.vim
    -- HACK: gelguy/wilder.nvim
    -- HACK: romgrk/fzy-lua-native
    -- HACK: ray-x/lsp_signature.nvim
    -- HACK: jose-elias-alvarez/null-ls.nvim
    -- HACK: NTBBloodbath/rest.nvim
}
