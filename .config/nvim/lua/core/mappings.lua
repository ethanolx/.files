local utils = require("core.utils")
local icons = require("core.icons")
local termcodes = utils.term_codes

local mappings = {}

mappings.alt = {
    v = {
        j = { ": MoveBlock(1)<cr>", "  Move Lines Down" },
        J = { "<cmd> lua require(\"trevj\").format_at_cursor() <cr>", "󰡏   Unwrap Lines", },
        k = { ": MoveBlock(-1)<cr>", "  Move Lines Up" },
        y = { "\"+y", "   Copy To Neovim Clipboard" },
        Y = { "\"+Y", "  Copy Line To System Clipboard" },
    },
    n = {
        p = { "\"+p", "  Paste Below From System Clipboard" },
        P = { "\"+P", "  Paste Above From System Clipboard" },
        y = { "\"+y", "   Copy To System Clipboard" },
        Y = { "\"+Y", "  Copy Line To System Clipboard" },
        j = { "<cmd> MoveLine(1) <cr>", "  Move Line Down" },
        k = { "<cmd> MoveLine(-1) <cr>", "  Move Line Up" },
        J = { "<cmd> lua require(\"trevj\").format_at_cursor() <cr>", "󰌑   Unwrap Line", },
        t = { "<cmd> ToggleTerm direction=tab <cr>", " 󰓩 Toggle Tab Terminal", },
        f = { "<cmd> ToggleTerm direction=float <cr>", " 󰉧 Toggle Floating Terminal", },
        h = { "<cmd> ToggleTerm direction=horizontal <cr>", "  Toggle Horizontal Terminal", },
        v = { "<cmd> ToggleTerm direction=vertical <cr>", "  Toggle Vertical Terminal", },
        [","] = { "<cmd> BufferLineMovePrev <cr>", "󰓩  Move Buffer Left" },
        [";"] = { "<cmd> BufferLineMoveNext <cr>", "󰓩  Move Buffer Right" },
    },
    t = {
        t = { "<cmd>ToggleTerm direction=tab<cr>", " 󰓩 Toggle Tab Terminal", },
        f = { "<cmd>ToggleTerm direction=float<cr>", " 󰉧 Toggle Floating Terminal", },
        h = { "<cmd>ToggleTerm direction=horizontal<cr>", "  Toggle Horizontal Terminal", },
        v = { "<cmd>ToggleTerm direction=vertical<cr>", "  Toggle Vertical Terminal", },
        n = { "<cmd>ToggleTermSetName<cr>", " 󰜢 Name Terminal", },
    },
}

mappings.ctl = {
    n = {
        up = { "<C-w>+", " 󰞙 Increase Window Height" },
        down = { "<C-w>-", " 󰞒 Decrease Window Height" },
        right = { "<C-w>>", " 󰞘 Increase Window Width" },
        left = { "<C-w><", " 󰞓 Decrease Window Width" },
        h = { "<C-w>h", "  Left Window" },
        l = { "<C-w>l", "  Right Window" },
        j = { "<C-w>j", "  Down Window" },
        k = { "<C-w>k", "  Up Window" },
    },
    t = {
        z = { termcodes "<C-\\><C-N>", " 󱊷 Escape Terminal Mode" },
        h = { termcodes "<C-\\><C-n><C-w>h", "  Left Window" },
        j = { termcodes "<C-\\><C-n><C-w>j", "  Right Window" },
        k = { termcodes "<C-\\><C-n><C-w>k", "  Down Window" },
        l = { termcodes "<C-\\><C-n><C-w>l", "  Up Window" },
    }
}

mappings.overload = {
    i = {
            ["<S-Tab>"] = { "<C-d>", "󰉵   Decrease Indentation" },
            -- ["<Tab>"] = { "<C-t>", "󰉶   Increase Indentation" },
    },
    n = {
            ["<Esc>"] = { "<Esc><cmd>nohl<cr>", "󰸱  Hide Search Highlights" },
            ["<Tab>"] = { "<cmd> BufferLineCycleNext <cr>", "   Next Buffer" },
            ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <cr>", "   Previous Buffer" },
            ["K"] = { utils.hover(), "󰆽   Hover", },
            ["gK"] = { utils.hover(true), "󰆽   Hover Options", },
            ["gV"] = { "'[v']", "Go to last paste" }
    }
}

mappings.misc = {
    i = {
            ["<C-k><C-k>"] = { "<cmd>lua require'better-digraphs'.digraphs(\"i\")<cr>", "󱍨   Insert Digraph" },
    }
}

mappings.compatibility = {
    n = {
            ["<C-a>"] = { "<cmd>lua require(\"core.utils\").select_all() <cr>", "* Select All" },
            ["<C-b>"] = { "<cmd>NvimTreeToggle<cr>", "* Toggle Explorer" },
            ["<C-c>"] = { "\"*y", "* Copy" },
            ["<C-f>"] = { "/", "* Find" },
            ["<C-g>"] = { ":", "* Go To Line" },
            ["<C-o>"] = { ":e ", "* Open File" },
            ["<C-s>"] = { "<cmd>w<cr>", "* Save" },
            ["<C-v>"] = { "\"*p", "* Paste" },
            ["<C-z>"] = { "<cmd>normal \"u\"<cr>", "* Undo" },
    }
}

-- a:  autocompletion
mappings.autocompletion = {
    n = {
        s = { "<cmd>CmpStatus<cr>", "󱖫 Autocomplete Status" },
    },
}

-- b:  buffers
mappings.buffer = {
    n = {
        j = { "<cmd>BufferLinePick<cr>", "󰿄 Jump To Buffer" },
        c = { function() require("core.utils").close_buffer() end, "󰅗 Close Buffer", },
        C = { "<cmd>%bd<cr>", "󰱝 Close All Buffers" },
        g = { "<cmd>BufferLineGroupToggle pinned<cr>", " Toggle Pinned Buffers" },
        p = { "<cmd>BufferLineTogglePin<cr>", " Toggle Buffer Pin" },
    },
}

-- c:  comments/colour picker
mappings.colour = {
    n = {
        p = { "<cmd>PickColor<cr>", " Colour Picker" },
    },
}
mappings.comment = {
    n = {
        q = { "<cmd>TodoQuickFix<cr>", icons.category.quickfix .. " Todo Comments Quickfix" },
    }
}
mappings.context = {
    n = {
        j = {
            function()
                local ok, start = require("indent_blankline.utils").get_current_context(
                    vim.g.indent_blankline_context_patterns,
                    vim.g.indent_blankline_use_treesitter_scope
                )

                if ok then
                    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
                    vim.cmd "silent normal ^"
                end
            end,
            "󰿄 Jump To Current Context",
        },
    }
}

-- d:  diagnostics/debugging
mappings.debug = {
    n = {
        -- B = { "<cmd> conditional breakpoint <cr>", " Toggle Conditional Breapoint" },
        b = { "<cmd> DapToggleBreakpoint <cr>", " Toggle Breakpoint" },
        c = { "<cmd> DapContinue <cr>", " Begin Debugging Session" },
        e = { "<cmd> lua require('dapui').eval() <cr>", " Inspect Variable" },
        i = { "<cmd> DapStepInto <cr>", " Step Into" },
        k = { "<cmd> DapTerminate <cr>", " Kill Debugging Session" },
        o = { "<cmd> DapStepOut <cr>", " Step Out" },
        u = { "<cmd> lua require('dapui').toggle() <cr>", " Toggle UI" },
        v = { "<cmd> DapStepOver <cr>", " Step Over" },
    }
}
mappings.diagnostic = {
    n = {
        n = { "<cmd>lua vim.diagnostic.goto_next({float={ border = \"rounded\"}})<cr>", "󰒭 Go To Next Diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev({float={ border = \"rounded\"}})<cr>", "󰒮 Go To Previous Diagnostic" },
        q = { function() vim.diagnostic.setqflist() end, "󰁨 Diagnostics To Quickfix List", },
        l = { function() vim.diagnostic.setloclist() end, " Diagnostics To Location List", },
        f = { function() vim.diagnostic.open_float({ border = "rounded", focusable = true, }) end, " Diagnostic Float", },
    },
}

-- e:  explorer
mappings.explorer = {
    n = {
        _ = { "<cmd>NvimTreeToggle<cr>", "󰔡 Toggle Explorer" },
        c = { "<cmd>NvimTreeClose<cr>", " Collapse Explorer" },
        f = { "<cmd>NvimTreeFindFile<cr>", "󰆤 Find File In Explorer" },
        r = { "<cmd>NvimTreeRefresh<cr>", " Refresh Explorer" },
    },
}

-- f:  find/telescope
mappings.find = {
    n = {
        _ = { "<cmd> Telescope builtin include_extensions=true <cr>", "󰔡 Activate Finder" },
        b = { "<cmd> Telescope current_buffer_fuzzy_find <cr>", " Find In Current Buffer" },
        B = { "<cmd> Telescope buffers <cr>", icons.category.buffer .. " Find Buffers" },
        c = { "<cmd> TodoTelescope <cr>", icons.category.comment .. " Find Comments" },
        d = { icons.category.debug .. " Debug / " .. icons.category.diagnostic .. " Diagnostic" },
        dg = { "<cmd> Telescope diagnostics <cr>", icons.category.diagnostic .. "   Find Diagnostics" },
        df = { "<cmd> Telescope dap frames <cr>", icons.category.debug .. "  Find DAP Frames" },
        db = { "<cmd> Telescope dap list_breakpoints <cr>", icons.category.debug .. " 󰏧 Find DAP Breakpoints" },
        dv = { "<cmd> Telescope dap variables <cr>", icons.category.debug .. " 󰀫 Find DAP Variables" },
        e = { "<cmd> Telescope file_browser path=%:p:h select_buffer=true hidden=true <cr>",
            icons.category.explorer .. " File Explorer In CWD" },
        E = { "<cmd> Telescope file_browser <cr>", icons.category.explorer .. " File Explorer" },
        f = { "<cmd> Telescope find_files <cr>", icons.filesystem.file .. " Find Files" },
        F = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>",
            icons.filesystem.file .. " Find Hidden/Dot Files" },
        g = { icons.category.git .. " Git" },
        gb = { "<cmd> Telescope git_branches <cr>", icons.category.git .. "  Find Git Branches" },
        gc = { "<cmd> Telescope git_commits <cr>", icons.category.git .. "  Git Commits" },
        gf = { "<cmd> Telescope git_files <cr>", icons.category.git .. " " .. icons.filesystem.file .. " Find Git Files" },
        gs = { "<cmd> Telescope git_status <cr>", icons.category.git .. " 󱖫 Find Git Status" },
        h = { "<cmd> Telescope help_tags <cr>", "󰞋 Find Help" },
        j = { "<cmd> Telescope jumplist <cr>", icons.category.jump .. " Find In Jump List" },
        k = { "<cmd> Telescope keymaps <cr>", icons.category.keymap .. " Find Keymaps" },
        l = { icons.category.location .. " Location / " .. icons.category.lsp .. " LSP" },
        ld = { "<cmd> Telescope lsp_definitions <cr>", icons.category.lsp .. " 󰯂 Find LSP Definitions" },
        lr = { "<cmd> Telescope lsp_references <cr>", icons.category.lsp .. "  Find LSP References" },
        li = { "<cmd> Telescope lsp_implementations <cr>", icons.category.lsp .. "  Find LSP Implementations" },
        ll = { "<cmd> Telescope loclist <cr>", icons.category.location .. "   Find In Location List" },
        lt = { "<cmd> Telescope lsp_type_definitions <cr>", icons.category.lsp .. "  Find LSP Type Definitions" },
        ls = { "<cmd> Telescope lsp_document_symbols <cr>", icons.category.lsp .. "  Find LSP Document Symbols" },
        lS = { "<cmd> Telescope lsp_workspace_symbols <cr>", icons.category.lsp .. "  Find LSP Workspace Symbols" },
        m = { "<cmd> Telescope marks <cr>", icons.category.mark .. " Find Marks" },
        n = { "<cmd> Telescope notify <cr>", "󰇮 Find Notifications" },
        o = { "<cmd> Telescope oldfiles <cr>", "󰋚 Find Oldfiles" },
        q = { "<cmd> Telescope quickfix <cr>", icons.category.quickfix .. " Find In Quickfix List" },
        r = { "<cmd> Telescope registers <cr>", "󰍛 Find Registers" },
        s = { "<cmd> Telescope persisted <cr>", icons.category.session .. " Find Sessions" },
        t = { "<cmd> Telescope treesitter <cr>", "󰙅 Find Treesitter Symbols" },
        x = { "<cmd> Telescope live_grep grep_open_files=true<cr>", " Live Grep In Open Files" },
        X = { "<cmd> Telescope live_grep <cr>", " Live Grep" },
    },
}

-- g:  git
mappings.git = {
    n = {
        _ = { "<cmd> Neogit <cr>", " Activate Neogit" },
        A = { "<cmd> !git add \"%\" <cr>", " Git Stage File" },
        a = { "<cmd> Gitsigns stage_hunk <cr>", " Git Stage Hunk" },
        B = { "<cmd> !git branch <cr>", " Git Branch" },
        b = { "<cmd> Gitsigns blame_line <cr>", " Git Blame" },
        C = { "<cmd>git commit<cr>", " commit" },
        D = { "<cmd> Gitsigns diffthis <cr>", " View File Diff" },
        d = { "<cmd> Gitsigns preview_hunk <cr>", " View Hunk Diff" },
        i = { "<cmd>GitMessenger<cr>", " Git Inspect" },
        l = { "<cmd> !git log -10 --graph --oneline <cr>", "󰅍 Git Log Summary" },
        L = { "<cmd> !git log<cr>", "󱉫 Git Log" },
        n = { "<cmd>Gitsigns next_hunk<cr>", "󰒭 Go To Next Hunk" },
        p = { "<cmd>Gitsigns prev_hunk<cr>", "󰒭 Go To Previous Hunk" },
        q = { "<cmd>Gitsigns setqflist<cr>", "󰁨 Git Quickfix" },
        R = { "<cmd>!git restore \"%\"<cr>", " Git Restore File" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", " Git Restore Hunk" },
        S = { "<cmd>Telescope git_status<cr>", "󱖫 Git Status" },
        U = { "<cmd>!git reset \"%\"<cr>", " Git Reset File" },
        u = { "<cmd>Gitsigns undo_stage_hunk<cr>", " Git Reset Hunk" },
    },
}

-- h:  health
mappings.health = {
    n = {
        _ = { "<cmd>checkhealth<cr>", "󰟌 Check Health" },
    }
}

-- i:
-- mappings.i = { }

-- j:  jump
mappings.jump = {
    n = {
        _ = { "<cmd>Pounce<cr>", " Fuzzy Jump" },
    }
}

-- k:  keymaps
mappings.keymap = {
    n = {
        _ = { "<cmd>WhichKey<cr>", icons.category.keymap .. " Query WhichKey", },
    }
}

-- l: LSP/location
mappings.location = {
    n = {
        c = { "<cmd>lclose<cr>", " Close Location List" },
        n = { "<cmd>lnext<cr>", "󰒭 Next Item" },
        o = { "<cmd>lopen<cr>", " Open Location List" },
        p = { "<cmd>lprevious<cr>", "󰒮 Previous Item" },
    }
}
mappings.lsp = {
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    n = {
        a = { function() vim.lsp.buf.code_action() end, " Code Actions", },
        D = { function() vim.lsp.buf.declaration() end, "󰯁 Declaration", },
        d = { function() vim.lsp.buf.definition() end, "󰯂 Definition", },
        f = { function() vim.lsp.buf.format { async = true, } end, "󰉨 Format", },
        i = { function() vim.lsp.buf.implementation() end, " Implementation", },
        r = { function() vim.lsp.buf.rename() end, " Rename Symbol" },
        R = { function() vim.lsp.buf.references() end, " References", },
        s = { function() vim.lsp.buf.signature_help() end, "󰷻 Signature", },
        t = { function() vim.lsp.buf.type_definition() end, " Type Definition", },
    },
    v = {
        f = { function() vim.lsp.buf.range_formatting() end, "󰉨 Format", },
    }
}

-- m:  mark
mappings.mark = {
    n = {
        t = { "<cmd>MarksToggleSigns<cr>", "󰔡 Toggle Marks" },
    },
}

-- n:  notes
mappings.note = {
    n = {
        _ = {
            function()
                local cwd = vim.fn.getcwd()
                vim.cmd "Neorg workspace notes"
                vim.g.prev_cwd = cwd
            end,
            " Open Notes"
        },
        v = { "<cmd>Neorg gtd views<cr>", " Notes Overview" },
        r = {
            function()
                vim.cmd("Neorg return")
                vim.cmd("cd " .. vim.g.prev_cwd)
            end,
            " Return To Code",
        },
        p = { "<cmd> Neorg presenter start <cr>", "󰐩 Start Presentation" },
    },
}

-- o:  outline
mappings.outline = {
    n = {
        _ = { utils.outline(), "󰔡 Toggle Outline" },
        o = { utils.outline("open"), " Open Outline" },
        c = { utils.outline("close"), " Close Outline" },
    }
}

-- p:  package/plugin
mappings.package = {
    n = {
        S = { "<cmd>Mason<cr>", "󱖫 Package Status" },
    }
}
mappings.plugin = {
    n = {
        s = { "<cmd> PackerStatus <cr>", "󱖫 Plugin Status" },
        c = { "<cmd> PackerClean <cr>", "󰃢 Clean Plugins" },
        i = { "<cmd> PackerInstall <cr>", " Install Plugins" },
        p = { "<cmd> PackerProfile <cr>", " Plugin Startup Profile" },
        u = { "<cmd> PackerUpdate <cr>", "󰚰 Update Plugins" },
    },
}

-- q:  quickfix
mappings.quickfix = {
    n = {
        _ = { "<cmd> TroubleToggle quickfix <cr>", "󰔡 Toggle Quickfix" },
        c = { "<cmd> TroubleClose <cr>", " Close Quickfix" },
        o = { "<cmd> Trouble quickfix <cr>", " Open Quickfix" },
        n = { "<cmd> cnext <cr>", "󰒭 Next Item" },
        p = { "<cmd> cprevious <cr>", "󰒮 Prev Item" },
    },
}

-- r:  run (for programs, or debugging)
mappings.run = {
    n = {
    },
}

-- s:  session
mappings.session = {
    n = {
        r = { "<cmd>SessionLoad<cr>", " Restore Last Session" },
        s = { "<cmd>SessionSave<cr>", " Save Current Session" },
    },
}

-- t:  terminal/testing
mappings.terminal = {
    n = {
        l = { "<cmd> ToggleTermSendCurrentLine <cr>", " Send Current Line To Terminal" },
    },
    v = {
        l = { "<cmd> ToggleTermSendVisualLines <cr>", " Send Selected Lines To Terminal" },
        v = { "<cmd> ToggleTermSendVisualSelection <cr>", " Send Selected Text To Terminal" },
    },
}
mappings.test = {}

-- u:  undo
mappings.undo = {
    n = {
        _ = { "<cmd>UndotreeToggle<cr>", "󰔡 Toggle UndoTree" },
        o = { "<cmd>UndotreeShow<cr>", " Open UndoTree" },
        f = { "<cmd>UndotreeFocus<cr>", "󰆤 Focus UndoTree" },
        c = { "<cmd>UndotreeHide<cr>", " Hide UndoTree" },
        t = { "<cmd>UndotreeToggle<cr>", "󰔡 Toggle UndoTree" },
    },
}

-- v:  vim
mappings.vim = {
    n = {
        h = { "<cmd>checkhealth<cr>", " Check Health" },
        q = { "<cmd>qa!<cr>", "󰗼 Exit Without Saving" },
        Q = { "<cmd>wqa<cr>", "󰸧 Save All And Exit" },
        s = { "<cmd>StartupTime<cr>", " Analyse Startup Time" },
    },
}

-- w:  window
mappings.window = {
    n = {
        c = { "<cmd>q<cr>", " Close Current Window" },
    },
}

-- x:
-- mappings.x = { }

-- z:  zen
mappings.zen = {
    n = {
        z = { "<cmd>ZenMode<cr>", "󰔡 Toggle Zen-Mode" },
        t = { "<cmd>Twilight<cr>", " Toggle Twilight" },
    }
}


utils.load_mappings(mappings)
