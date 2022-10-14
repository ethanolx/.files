local utils = require("core.utils")
local termcodes = utils.term_codes

local mappings = {}

mappings.alt = {
    v = {
        j = { ": MoveBlock(1)<cr>", "  move lines down" },
        J = { "<cmd> lua require(\"trevj\").format_at_cursor() <cr>", "unwrap lines", },
        k = { ": MoveBlock(-1)<cr>", "  move lines up" },
    },
    n = {
        p = { "\"+p", "   paste from system clipboard" },
        P = { "\"+P", "   paste from system clipboard" },
        y = { "\"+y", "   paste from system clipboard" },
        Y = { "\"+Y", "   paste from system clipboard" },

        j = { "<cmd> MoveLine(1) <cr>", "  move line down" },
        k = { "<cmd> MoveLine(-1) <cr>", "  move line up" },

        J = { "<cmd> lua require(\"trevj\").format_at_cursor() <cr>", "unwrap lines", },

        t = { "<cmd> ToggleTerm direction=tab <cr>", "   toggle floating term", },
        f = { "<cmd> ToggleTerm direction=float <cr>", "   toggle floating term", },
        h = { "<cmd> ToggleTerm direction=horizontal <cr>", "   toggle horizontal term", },
        v = { "<cmd> ToggleTerm direction=vertical <cr>", "   toggle vertical term", },

        [","] = { "<cmd> BufferLineMovePrev <cr>", "move buffer left" },
        [";"] = { "<cmd> BufferLineMoveNext <cr>", "move buffer right" },
    },
    t = {
        t = { "<cmd> ToggleTerm direction=tab <cr>", "   toggle floating term", },
        f = { "<cmd> ToggleTerm direction=float <cr>", "   toggle floating term", },
        h = { "<cmd> ToggleTerm direction=horizontal <cr>", "   toggle horizontal term", },
        v = { "<cmd> ToggleTerm direction=vertical <cr>", "   toggle vertical term", },
    },
}

mappings.ctl = {
    n = {
        up = { "<C-w>+", "ﱟ   increase window width" },
        down = { "<C-w>-", "ﱞ   decrease window width" },
        right = { "<C-w>>", "ﱟ   increase window width" },
        left = { "<C-w><", "ﱞ   decrease window width" },

        h = { "<C-w>h", "  window left" },
        l = { "<C-w>l", "  window right" },
        j = { "<C-w>j", "  window down" },
        k = { "<C-w>k", "  window up" },
    },
    t = {
        z = { termcodes "<C-\\><C-N>", "Escape terminal mode" },
        h = { termcodes "<C-\\><C-n><C-w>h", "Escape terminal mode" },
        j = { termcodes "<C-\\><C-n><C-w>j", "Escape terminal mode" },
        k = { termcodes "<C-\\><C-n><C-w>k", "Escape terminal mode" },
        l = { termcodes "<C-\\><C-n><C-w>l", "Escape terminal mode" },
    }
}

mappings.overload = {
    i = {
        ["<S-Tab>"] = { "<C-d>", "Undo indentation" },
    },
    n = {
        ["<Esc>"] = { function() vim.cmd "nohlsearch" vim.o.statusline = "%{%v:lua.require('feline').generate_statusline()%}" end,
            "  reset", },

        ["<Tab>"] = { "<cmd> BufferLineCycleNext <cr>", "   cycle next buffer" },
        ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <cr>", "   cycle prev buffer" },

        ["gd"] = { function() vim.lsp.buf.definition() end, "   lsp definition", },
        ["gD"] = { function() vim.lsp.buf.declaration() end, "   lsp declaration", },
        ["K"] = { require("core.utils").hover, "   lsp hover", },
    }
}

mappings.misc = {
    i = {
        ["<C-k><C-k>"] = { "<cmd>lua require'better-digraphs'.digraphs(\"i\")<cr>", "digraphs" },
    }
}

mappings.compatibility = {
    n = {
        ["<C-a>"] = { "<cmd>lua require(\"core.utils\").select_all() <cr>", "SELECT ALL" },
        ["<C-b>"] = { "<cmd>NvimTreeToggle<cr>", "TOGGLE EXPLORER" },
        ["<C-c>"] = { "\"*y", "COPY" },
        ["<C-f>"] = { "/", "FIND" },
        ["<C-g>"] = { ":", "GO TO LINE" },
        ["<C-o>"] = { ":e ", "OPEN FILE" },
        ["<C-s>"] = { "<cmd>w<cr>", "SAVE" },
        ["<C-v>"] = { "\"*p", "PASTE" },
        ["<C-z>"] = { "<cmd>normal \"u\"<cr>", "UNDO" },
    }
}

-- a:  autocompletion
mappings.autocompletion = {
    n = {
        --[""] = { name = "autocomplete", },
        s = { "<cmd>CmpStatus<cr>", "check autocomplete status" },
    },
}

-- b:  buffers
mappings.buffer = {
    n = {
        -- Label
        --[""] = { "", "﬘   buffers" },

        -- (j)ump to buffer
        j = { "<cmd> BufferLinePick <cr>", "go to buffer" },

        -- move buffers

        -- (q)uit all buffers
        C = { "<cmd> BufferLineCloseLeft <CR> <cmd> BufferLineCloseRight <CR> <cmd> bp|sp|bn|bd <CR>",
            "close all buffers" },

        -- cycle through buffers

        -- close buffer + hide terminal buffer
        c = {
            function()
                require("core.utils").close_buffer()
            end,
            "   close buffer",
        },

        g = { "<cmd> BufferLineGroupToggle pinned<cr>", "toggle buffer pin" },
        p = { "<cmd> BufferLineTogglePin <cr>", "toggle buffer pin" },
    },
}

-- c:  comments/colour picker
mappings.colour = {
    n = {
        ["p"] = { "<cmd>PickColor<cr>", "colour picker" },
    },
}
mappings.comment = {}
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

            "  Jump to current_context",
        },
    }
}

-- d:  diagnostics/debugging
mappings.debug = {
    n = {
        c = { "<cmd> DapContinue <cr>", "  begin debugging session" },
        i = { "<cmd> DapStepInto <cr>", "  begin debugging session" },
        o = { "<cmd> DapStepOut <cr>", "  begin debugging session" },
        v = { "<cmd> DapStepOver <cr>", "  begin debugging session" },
        k = { "<cmd> DapTerminate <cr>", " ﰸ kill debugging session" },
        b = { "<cmd> DapToggleBreakpoint <cr>", "  toggle breakpoint" },
        B = { "<cmd> conditional breakpoint <cr>", "  toggle breapoint" },
        e = { "<cmd> lua require('dapui').eval() <cr>", "  inspect variable" },
        u = { "<cmd> lua require('dapui').toggle() <cr>", "toggle ui" },
    }
}
mappings.diagnostic = {
    n = {
        n = { "<cmd> lua vim.diagnostic.goto_next({ float = { border = \"rounded\" } }) <cr>",
            " ﭡ go to next diagnostic" },
        p = { "<cmd> lua vim.diagnostic.goto_prev({ float = { border = \"rounded\" } }) <cr>",
            " ﭣ go to previous diagnostic" },
        q = { function() vim.diagnostic.setqflist() end, "   diagnostics to quickfix", },
        l = { function() vim.diagnostic.setloclist() end, "   diagnostic to location list", },
        f = { function() vim.diagnostic.open_float({ border = "rounded", focusable = true, }) end, "   focus diagnostic", },
    },
}

-- e:  explorer
mappings.explorer = {
    n = {
        _ = { "<cmd> NvimTreeToggle <cr>", "" },

        -- (f)ocus the current buffer
        c = { "<cmd>NvimTreeCollapse<cr>", "פּ  focus nvimtree" },
        f = { "<cmd> NvimTreeFindFile <cr>", "פּ  focus nvimtree" },
        r = { "<cmd> NvimTreeRefresh <cr>", "פּ  focus nvimtree" },
    },
}

-- f:  find/telescope
mappings.find = {
    n = {
        _ = { "<cmd> Telescope builtin include_extensions=true <cr>", "   activate finder" },

        b = { "<cmd> Telescope current_buffer_fuzzy_find <cr>", "  find in current buffer" },
        B = { "<cmd> Telescope buffers <cr>", "  find buffers" },
        c = { "<cmd> TodoTelescope <cr>", "find comments" },
        dg = { "<cmd> Telescope diagnostics <cr>", "  find all diagnostics" },
        df = { "<cmd> Telescope dap frames <cr>", "  find all diagnostics" },
        db = { "<cmd> Telescope dap list_breakpoints <cr>", "  find all diagnostics" },
        dv = { "<cmd> Telescope dap variables <cr>", "  find all diagnostics" },
        e = { "<cmd> Telescope file_browser path=%:p:h select_buffer=true <cr>", "file browser" },
        E = { "<cmd> Telescope file_browser <cr>", "file browser" },
        f = { "<cmd> Telescope find_files <cr>", "  find files" },
        F = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>", "  find all" },
        gb = { "<cmd> Telescope git_branches <cr>", "   git branches" },
        gc = { "<cmd> Telescope git_commits <cr>", "   git commits" },
        gf = { "<cmd> Telescope git_files <cr>", "   git files" },
        gs = { "<cmd> Telescope git_status <cr>", "  git status" },
        h = { "<cmd> Telescope help_tags <cr>", "  help page" },
        j = { "<cmd> Telescope jumplist <cr>", "jumplist" },
        k = { "<cmd> Telescope keymaps <cr>", "   show keys" },
        ld = { "<cmd> Telescope lsp_definitions <cr>", " lsp stuff" },
        lr = { "<cmd> Telescope lsp_references <cr>", " lsp stuff" },
        li = { "<cmd> Telescope lsp_implementations <cr>", " lsp stuff" },
        ll = { "<cmd> Telescope loclist <cr>", "location list" },
        lt = { "<cmd> Telescope lsp_type_definitions <cr>", " lsp stuff" },
        ls = { "<cmd> Telescope lsp_document_symbols <cr>", " lsp stuff" },
        lS = { "<cmd> Telescope lsp_workspace_symbols <cr>", " lsp stuff" },
        m = { "<cmd> Telescope marks <cr>", "marks" },
        n = { "<cmd> Telescope notify <cr>", "notifications" },
        o = { "<cmd> Telescope oldfiles <cr>", "   find oldfiles" },
        q = { "<cmd> Telescope quickfix <cr>", "   show keys" },
        r = { "<cmd> Telescope registers <cr>", "   show keys" },
        s = { "<cmd> Telescope persisted <cr>", "sessions" },
        t = { "<cmd> Telescope treesitter <cr>", "treesitter" },
        x = { "<cmd> Telescope live_grep grep_open_files=true <cr>", "   live grep" },
        X = { "<cmd> Telescope live_grep <cr>", "   live grep" },
    },
}

-- g:  git
mappings.git = {
    n = {
        _ = { "<cmd> Neogit <cr>", "git main" },
        C = {
            function()

            end, "  commit"
        },
        a = { "<cmd> Gitsigns stage_hunk <cr>", "  stage_hunk" },
        A = { "<cmd> !git add \"%\" <cr>", "  stage this file" },
        S = { "<cmd> Telescope git_status <cr>", "   git status" },
        U = { "<cmd> silent!git reset % <cr>", "   git reset this file" },
        u = { "<cmd> Gitsigns undo_stage_hunk <cr>", "   undo git staging this hunk" },
        R = { "<cmd> silent!git restore % <cr>", "   git restore this file" },
        r = { "<cmd> Gitsigns reset_hunk <cr>", "   git reset this hunk" },
        b = { "<cmd> Gitsigns blame_line <cr>", "   git blame" },
        B = { "<cmd> !git branch <cr>", "   list branches" },
        l = { "<cmd> !git log -10 --graph --oneline <cr>", "   git log summary" },
        L = { "<cmd> !git log -10 <cr>", "   git log" },
        q = { "<cmd> Gitsigns setqflist <cr>", "   git quickfix" },
        d = { "<cmd> Gitsigns preview_hunk <cr>", "   view hunk diff" },
        D = { "<cmd> Gitsigns diffthis <cr>", "   view file diff" },
        n = { "<cmd> Gitsigns next_hunk <cr>", "   go to next hunk" },
        p = { "<cmd> Gitsigns prev_hunk <cr>", "   go to previous hunk" },
    },
}

-- h:  health
mappings.health = {
    n = {
        _ = { "<cmd>checkhealth<cr>", "check health" },
    }
}

-- i:
-- mappings.i = { }

-- j:  jump
mappings.jump = {

}

-- k:  keymaps
mappings.keymap = {
    n = {
        _ = { "<cmd> WhichKey <cr>", "   which-key all keymaps", },
    }
}

-- l: LSP
mappings.lsp = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        i = { function() vim.lsp.buf.implementation() end, "   lsp implementation", },
        s = { function() vim.lsp.buf.signature_help() end, "   lsp signature_help", },
        t = { function() vim.lsp.buf.type_definition() end, "   lsp definition type", },
        r = { "<cmd> lua vim.lsp.buf.rename() <cr>", "LSP rename" },
        a = {
            function()
                vim.cmd [[autocmd! CursorHold *]]
                vim.lsp.buf.code_action()

                vim.cmd [[autocmd CursorMoved * ++once lua require("core.utils").activate_diagnostics()]]
            end,
            "   lsp code_action",
        },

        R = { function() vim.lsp.buf.references() end, "   lsp references", },
        f = { function() vim.lsp.buf.format { async = true, } end, "   lsp formatting", },
        o = { "<cmd>lopen<cr>", "loclist open" },
        c = { "<cmd>lclose<cr>", "loclist close" },
        n = { "<cmd>lnext<cr>", "loclist next" },
        p = { "<cmd>lprevious<cr>", "loclist previous" },
    },
    v = {
        f = {
            function()
                vim.lsp.buf.range_formatting()
            end,
            "   lsp formatting",
        },
    }
}

-- m:  mark
mappings.mark = {
    n = {
        t = { "<cmd>MarksToggleSigns<cr>", "toggle marks" },
    },
}

-- n:  notes
mappings.note = {
    n = {
        _ = {
            function()
                local cwd = vim.fn.getcwd()
                local neorg_not_loaded, _ = pcall(vim.cmd, "NeorgStart")
                local neorg_loaded = not neorg_not_loaded
                if neorg_loaded then
                    vim.cmd "Neorg workspace notes"
                else
                    vim.g.prev_cwd = cwd
                end
            end,
            "Open notes"
        },
        v = { "<cmd>Neorg gtd views<cr>", "notes overview" },
        r = {
            function()
                vim.cmd "Neorg return "
                vim.cmd("cd " .. vim.g.prev_cwd)
            end,
            "Return to cwd",
        },
        p = { "<cmd> Neorg presenter start <cr>", "start presentation" },
    },
}

-- o:  outline
mappings.outline = {
    n = {
        o = { "<cmd> SymbolsOutlineOpen <cr>", "פּ   open outline" },
        c = { "<cmd> SymbolsOutlineClose <cr>", "פּ   close outline" },
    }
}

-- p:  package
mappings.package = {
    n = {

    }
}
mappings.plugin = {
    n = {
        s = { "<cmd> PackerStatus <cr>", "" },
        c = { "<cmd> PackerClean <cr>", "" },
        i = { "<cmd> PackerInstall <cr>", "" },
        p = { "<cmd> PackerProfile <cr>", "" },
        u = { "<cmd> PackerUpdate <cr>", "" },
    },
}

-- q:  quickfix
mappings.quickfix = {
    n = {
        _ = { "<cmd> TroubleToggle quickfix <cr>", "" },
        c = { "<cmd> TroubleClose <cr>", "close quickfix" },
        o = { "<cmd> Trouble quickfix <cr>", "open quickfix" },
        n = { "<cmd> cnext <cr>", "next item in quickfix" },
        p = { "<cmd> cprevious <cr>", "prev item in quickfix" },
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
        -- (r)estore last session
        r = { "<cmd>SessionLoad<cr>", "  restore last session" },

        -- (s)ave current session
        s = { "<cmd>SessionSave<cr>", "  save current session" },
    },
}

-- t:  terminal
mappings.terminal = {
    n = {
        --[""] = { name = " terminal /  testing" },
        l = {
            "<cmd> ToggleTermSendCurrentLine <cr>",
            ""
        },
    },
    v = {
        l = {
            "<cmd> ToggleTermSendVisualLines <cr>",
            ""
        },
        v = {
            "<cmd> ToggleTermSendVisualSelection <cr>",
            ""
        },
    },
}
mappings.test = {

}

-- u:  undo
mappings.undo = {
    n = {
        -- [""] = { "", "undotree" },
        _ = { "<cmd> UndotreeToggle <cr>", "undotree" },

        o = { "<cmd> UndotreeShow <cr>", "undotree" },
        f = { "<cmd> UndotreeFocus <cr>", "undotree" },
        c = { "<cmd> UndotreeHide <cr>", "undotree" },
        t = { "<cmd> UndotreeToggle <cr>", "undotree" },
    },
}

-- v:  vim
mappings.vim = {
    n = {
        x = { "<cmd> qa <cr>", "Exit neovim" },
        X = { "<cmd> wqa <cr>", "save and Exit neovim" },
    },
}

-- w:  window
mappings.window = {
    n = {
        -- Label
        --[""] = { "", "   windows" },
        c = { "<cmd>q<cr>", "close window" },
    },
}

-- x:
-- mappings.x = { }

-- z:  zen
mappings.zen = {
    n = {
        z = { "<cmd> ZenMode <cr>", "  toggle zen-mode" },
        t = { "<cmd> Twilight <cr>", "  toggle twilight" },
    }
}


utils.load_mappings(mappings)
