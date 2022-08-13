-- n, v, i, t = mode names

local termcodes = require("core.utils").term_codes


local M = {}

M._utilities = {
    i = {
        ["<S-Tab>"] = { "<C-d>", "Undo indentation" },
        ["<C-k><C-k>"] = { "<cmd> lua require'better-digraphs'.digraphs(\"i\")<cr>", "digraphs" },
    },

    v = {
        -- ["<A-h>"] = { ": MoveHBlock(-1) <cr>", "  move lines up" },
        ["<A-j>"] = { ": MoveBlock(1) <cr>", "  move lines down" },
        ["<A-k>"] = { ": MoveBlock(-1) <cr>", "  move lines up" },
        -- ["<A-l>"] = { ": MoveHBlock(1) <cr>", "  move lines down" },
    },
    n = {
        ["<M-p>"] = { "\"+p", "   paste from system clipboard" },
        ["<M-P>"] = { "\"+P", "   paste from system clipboard" },
        ["<M-y>"] = { "\"+y", "   paste from system clipboard" },
        ["<M-Y>"] = { "\"+Y", "   paste from system clipboard" },

        ["<M-Up>"] = { "<C-w>+", "ﱟ   increase window width" },
        ["<M-Down>"] = { "<C-w>-", "ﱞ   decrease window width" },
        ["<M-Right>"] = { "<C-w>>", "ﱟ   increase window width" },
        ["<M-Left>"] = { "<C-w><", "ﱞ   decrease window width" },

        -- ["<A-h>"] = { "<cmd> MoveHChar(-1) <cr>", "  move line up" },
        ["<M-j>"] = { "<cmd> MoveLine(1) <cr>", "  move line down" },
        ["<M-k>"] = { "<cmd> MoveLine(-1) <cr>", "  move line up" },
        -- ["<A-l>"] = { "<cmd> MoveHChar(1) <cr>", "  move line down" },

        ["<leader><leader>"] = { "", "  main" },

        ["_"] = { "\"_", "" },
        ["<Esc>"] = {
            function()
                vim.cmd "nohlsearch"
                -- require("scrollbar.handlers.search").nohlsearch()
                -- require("hlslens.main").refresh()
                -- vim.o.winbar = "%{%v:lua.require'feline'.generate_winbar()%}"
                vim.o.statusline = "%{%v:lua.require('feline').generate_statusline()%}"
            end,
            "  reset",
        },
        -- ["n"] = { "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require(\"hlslens.main\").start()<cr>",
        --     "jump to next occurrence", },
        -- ["N"] = { "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require(\"hlslens.main\").start()<cr>",
        --     "jump to prev occurrence", },
        -- ["#"] = { "#<cmd>lua require(\"hlslens.main\").start()<cr>", "jump to next occurrence", },
        -- ["g#"] = { "g#<cmd>lua require(\"hlslens.main\").start()<cr>", "jump to next occurrence", },
        -- ["*"] = { "*<cmd>lua require(\"hlslens.main\").start()<cr>", "jump to next occurrence", },
        -- ["g*"] = { "g*<cmd>lua require(\"hlslens.main\").start()<cr>", "jump to next occurrence", },

        ["<M-,>"] = { "<cmd> BufferLineMovePrev <cr>", "move buffer left" },
        ["<M-;>"] = { "<cmd> BufferLineMoveNext <cr>", "move buffer right" },
        ["<Tab>"] = { "<cmd> BufferLineCycleNext <cr>", "   cycle next buffer" },
        ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <cr>", "   cycle prev buffer" },

        ["<C-h>"] = { "<C-w>h", "  window left" },
        ["<C-l>"] = { "<C-w>l", "  window right" },
        ["<C-j>"] = { "<C-w>j", "  window down" },
        ["<C-k>"] = { "<C-w>k", "  window up" },

        ["<C-_>"] = {
            "<cmd> ToggleTerm <cr>",
            "   toggle floating term",
        },
        -- toggle in normal mode
        ["<M-t>"] = {
            "<cmd> ToggleTerm direction=tab <cr>",
            "   toggle floating term",
        },
        ["<M-f>"] = {
            "<cmd> ToggleTerm direction=float <cr>",
            "   toggle floating term",
        },

        ["<M-h>"] = {
            "<cmd> ToggleTerm direction=horizontal <cr>",
            "   toggle horizontal term",
        },

        ["<M-v>"] = {
            "<cmd> ToggleTerm direction=vertical <cr>",
            "   toggle vertical term",
        },
    },

    t = {
        -- ["<Esc>"] = { termcodes "<C-\\><C-N>", "Escape terminal mode" },
        ["<C-z>"] = { termcodes "<C-\\><C-N>", "Escape terminal mode" },
        ["<C-h>"] = { termcodes "<C-\\><C-n><C-w>h", "Escape terminal mode" },
        ["<C-j>"] = { termcodes "<C-\\><C-n><C-w>j", "Escape terminal mode" },
        ["<C-k>"] = { termcodes "<C-\\><C-n><C-w>k", "Escape terminal mode" },
        ["<C-l>"] = { termcodes "<C-\\><C-n><C-w>l", "Escape terminal mode" },
    }
}

M._compatibility = {
    n = {
        ["<C-a>"] = { "<cmd> lua require(\"core.utils\").select_all() <cr>", "SELECT ALL" },
        ["<C-s>"] = { "<cmd> w <cr>", "SAVE" },
        ["<C-z>"] = { "<cmd> normal \"u\" <cr>", "UNDO" },
        ["<C-c>"] = { "\"*y", "copy to system clipboard" },
        ["<C-v>"] = { "\"*p", "paste from system clipboard" },
        ["<C-f>"] = { "/", "search" },
        ["<C-b>"] = { "<cmd> NvimTreeToggle <cr>", "explorer" },
        ["<C-o>"] = { ":e ", "open file" },
    }
}

-- prefix: definition

-- a:  autocomplete
M.a = {
    n = {
        ["<leader>a"] = { name = "autocomplete", },
        ["<leader>as"] = { "<cmd>CmpStatus<cr>", "check autocomplete status" },
    },
}

-- b:  buffers
M.b = {
    n = {
        -- Label
        ["<leader>b"] = { "", "﬘   buffers" },

        -- (j)ump to buffer
        ["<leader>bj"] = { "<cmd> BufferLinePick <cr>", "go to buffer" },

        -- move buffers

        -- (q)uit all buffers
        ["<leader>bC"] = { "<cmd> BufferLineCloseLeft <CR> <cmd> BufferLineCloseRight <CR> <cmd> bp|sp|bn|bd <CR>",
            "close all buffers" },

        -- cycle through buffers

        -- close buffer + hide terminal buffer
        ["<leader>bc"] = {
            function()
                require("core.utils").close_buffer()
            end,
            "   close buffer",
        },

        ["<leader>bg"] = { "<cmd> BufferLineGroupToggle pinned<cr>", "toggle buffer pin" },
        ["<leader>bp"] = { "<cmd> BufferLineTogglePin <cr>", "toggle buffer pin" },
    },
}

-- c:  comments/colour picker
M.c = {
    n = {
        -- Label
        ["<leader>c"] = { name = " comments /  palette" },
        ["<leader>cp"] = { "<cmd>PickColor<cr>", "colour picker" },

        -- (f)ind todo comments
        -- ["<leader>cf"] = { "<cmd> TodoTelescope <cr>", "  find todo comments" },
        -- ["<leader>/"] = {
        --     function()
        --         require("Comment.api").toggle_current_linewise()
        --     end,

        --     "  toggle comment",
        -- },
    },

    v = {
        ["<leader>/"] = {
            "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
            "  toggle comment",
        },
    },
}

-- d:  diagnostics/debugging
M.d = {
    n = {
        -- Label
        ["<leader>d"] = { "", " diagnostics /  debugging" },

        ["<leader>dn"] = { "<cmd> lua vim.diagnostic.goto_next({ float = { border = \"rounded\" } }) <cr>",
            " ﭡ go to next diagnostic" },
        ["<leader>dp"] = { "<cmd> lua vim.diagnostic.goto_prev({ float = { border = \"rounded\" } }) <cr>",
            " ﭣ go to previous diagnostic" },

        ["<leader>dc"] = { "<cmd> DapContinue <cr>", "  begin debugging session" },
        ["<leader>di"] = { "<cmd> DapStepInto <cr>", "  begin debugging session" },
        ["<leader>do"] = { "<cmd> DapStepOut <cr>", "  begin debugging session" },
        ["<leader>dv"] = { "<cmd> DapStepOver <cr>", "  begin debugging session" },
        ["<leader>dk"] = { "<cmd> DapTerminate <cr>", " ﰸ kill debugging session" },
        ["<leader>db"] = { "<cmd> DapToggleBreakpoint <cr>", "  toggle breakpoint" },
        -- ["<leader>dB"] = { "<cmd> conditional breakpoint <cr>", "  toggle breakpoint" },
        ["<leader>de"] = { "<cmd> lua require('dapui').eval() <cr>", "  inspect variable" },
        ["<leader>du"] = { "<cmd> lua require('dapui').toggle() <cr>", "toggle ui" },
        ["<leader>dq"] = {
            function()
                vim.diagnostic.setqflist()
            end,
            "   diagnostics to quickfix",
        },
        ["<leader>dl"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "   diagnostic to location list",
        },


        ["<leader>df"] = {
            function()
                vim.diagnostic.open_float({ border = "rounded", focusable = true, })
            end,
            "   focus diagnostic",
        },
    },
}

-- e:  explorer/file tree/nvim tree
M.e = {
    n = {
        -- Label
        ["<leader>e"] = { "", "פּ   explorer" },
        ["<leader><leader>e"] = { "<cmd> NvimTreeToggle <cr>", "" },

        -- (f)ocus the current buffer
        ["<leader>ef"] = { "<cmd> NvimTreeFindFile <cr>", "פּ  focus nvimtree" },
        ["<leader>er"] = { "<cmd> NvimTreeRefresh <cr>", "פּ  focus nvimtree" },
    },
}

-- f:  find/telescope
M.f = {
    n = {
        -- Label
        ["<leader>f"] = { "", "   find" },
        ["<leader><leader>f"] = { "<cmd> Telescope builtin include_extensions=true <cr>", "   activate finder" },

        ["<leader>fb"] = { "<cmd> Telescope current_buffer_fuzzy_find <cr>", "  find in current buffer" },
        ["<leader>fB"] = { "<cmd> Telescope buffers <cr>", "  find buffers" },
        ["<leader>fc"] = { "<cmd> TodoTelescope <cr>", "find comments" },
        ["<leader>fdg"] = { "<cmd> Telescope diagnostics <cr>", "  find all diagnostics" },
        ["<leader>fdf"] = { "<cmd> Telescope dap frames <cr>", "  find all diagnostics" },
        ["<leader>fdb"] = { "<cmd> Telescope dap list_breakpoints <cr>", "  find all diagnostics" },
        ["<leader>fdv"] = { "<cmd> Telescope dap variables <cr>", "  find all diagnostics" },
        ["<leader>fe"] = { "<cmd> Telescope file_browser path=%:p:h select_buffer=true <cr>", "file browser" },
        ["<leader>fE"] = { "<cmd> Telescope file_browser <cr>", "file browser" },
        ["<leader>ff"] = { "<cmd> Telescope find_files <cr>", "  find files" },
        ["<leader>fF"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>", "  find all" },
        ["<leader>fgb"] = { "<cmd> Telescope git_branches <cr>", "   git branches" },
        ["<leader>fgc"] = { "<cmd> Telescope git_commits <cr>", "   git commits" },
        ["<leader>fgf"] = { "<cmd> Telescope git_files <cr>", "   git files" },
        ["<leader>fgs"] = { "<cmd> Telescope git_status <cr>", "  git status" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <cr>", "  help page" },
        ["<leader>fj"] = { "<cmd> Telescope jumplist <cr>", "jumplist" },
        ["<leader>fk"] = { "<cmd> Telescope keymaps <cr>", "   show keys" },
        ["<leader>fld"] = { "<cmd> Telescope lsp_definitions <cr>", " lsp stuff" },
        ["<leader>flr"] = { "<cmd> Telescope lsp_references <cr>", " lsp stuff" },
        ["<leader>fli"] = { "<cmd> Telescope lsp_implementations <cr>", " lsp stuff" },
        ["<leader>fll"] = { "<cmd> Telescope loclist <cr>", "location list" },
        ["<leader>flt"] = { "<cmd> Telescope lsp_type_definitions <cr>", " lsp stuff" },
        ["<leader>fls"] = { "<cmd> Telescope lsp_document_symbols <cr>", " lsp stuff" },
        ["<leader>flS"] = { "<cmd> Telescope lsp_workspace_symbols <cr>", " lsp stuff" },
        ["<leader>fm"] = { "<cmd> Telescope marks <cr>", "marks" },
        ["<leader>fn"] = { "<cmd> Telescope notify <cr>", "notifications" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <cr>", "   find oldfiles" },
        ["<leader>fq"] = { "<cmd> Telescope quickfix <cr>", "   show keys" },
        ["<leader>fr"] = { "<cmd> Telescope registers <cr>", "   show keys" },
        ["<leader>fs"] = { "<cmd> Telescope persisted <cr>", "sessions" },
        ["<leader>ft"] = { "<cmd> Telescope treesitter <cr>", "treesitter" },
        ["<leader>fx"] = { "<cmd> Telescope live_grep grep_open_files=true <cr>", "   live grep" },
        ["<leader>fX"] = { "<cmd> Telescope live_grep <cr>", "   live grep" },
    },
}

-- g:  git
M.g = {
    n = {
        -- Label
        ["<leader>g"] = { "", "   git" },
        ["<leader><leader>g"] = { "<cmd> Neogit <cr>", "git main" },


        ["<leader>gC"] = {
            function()

            end, "  commit" },
        ["<leader>ga"] = { "<cmd> Gitsigns stage_hunk <cr>", "  stage_hunk" },
        ["<leader>gA"] = { "<cmd> !git add % <cr>", "  stage this file" },
        ["<leader>gS"] = { "<cmd> Telescope git_status <cr>", "   git status" },
        ["<leader>gU"] = { "<cmd> silent!git reset % <cr>", "   git reset this file" },
        ["<leader>gu"] = { "<cmd> Gitsigns undo_stage_hunk <cr>", "   undo git staging this hunk" },
        ["<leader>gR"] = { "<cmd> silent!git restore % <cr>", "   git restore this file" },
        ["<leader>gr"] = { "<cmd> Gitsigns reset_hunk <cr>", "   git reset this hunk" },
        ["<leader>gb"] = { "<cmd> Gitsigns blame_line <cr>", "   git blame" },
        ["<leader>gB"] = { "<cmd> !git branch <cr>", "   list branches" },
        ["<leader>gl"] = { "<cmd> !git log -10 --graph --oneline <cr>", "   git log summary" },
        ["<leader>gL"] = { "<cmd> !git log -10 <cr>", "   git log" },
        ["<leader>gq"] = { "<cmd> Gitsigns setqflist <cr>", "   git quickfix" },
        ["<leader>gd"] = { "<cmd> Gitsigns preview_hunk <cr>", "   view hunk diff" },
        ["<leader>gD"] = { "<cmd> Gitsigns diffthis <cr>", "   view file diff" },
        ["<leader>gn"] = { "<cmd> Gitsigns next_hunk <cr>", "   go to next hunk" },
        ["<leader>gp"] = { "<cmd> Gitsigns prev_hunk <cr>", "   go to previous hunk" },
    },
}

-- h:  health
M.h = {
    n = {
        ["<leader>h"] = { name = "health" },
        ["<leader><leader>h"] = { "<cmd>checkhealth<cr>", "check health" },
    }
}

-- i:  - (insert)
M.i = {

}

-- j:  - (move down)
M.j = {

}

-- k:  keymaps
M.k = {
    n = {
        ["<leader>k"] = { name = "keymaps" },
        ["<leader><leader>k"] = {
            "<cmd> WhichKey <cr>",
            "   which-key all keymaps",
        },
    }
}

-- l: LSP
M.l = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "   lsp declaration",
        },

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "   lsp definition",
        },

        -- ["K"] = {
        --     require("hover").hover,
        --     "hover",
        -- },
        ["K"] = {
            function()
                vim.cmd [[autocmd! CursorHold *]]
                vim.lsp.buf.hover()
                vim.cmd [[autocmd CursorMoved * ++once lua require("core.utils").activate_diagnostics()]]
            end,
            "   lsp hover",
        },

        ["<leader>li"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "   lsp implementation",
        },

        ["<M-J>"] = {
            "<cmd> lua require(\"trevj\").format_at_cursor() <cr>",
            "unwrap lines",
        },

        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "   lsp signature_help",
        },

        ["<leader>lt"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "   lsp definition type",
        },

        -- ["<leader>lr"] = { ":Re ", "   lsp rename", },

        ["<leader>lr"] = { "<cmd> lua vim.lsp.buf.rename() <cr>", "LSP rename" },

        ["<leader>la"] = {
            function()
                vim.cmd [[autocmd! CursorHold *]]
                vim.lsp.buf.code_action()

                vim.cmd [[autocmd CursorMoved * ++once lua require("core.utils").activate_diagnostics()]]
            end,
            "   lsp code_action",
        },

        ["<leader>lR"] = {
            function()
                vim.lsp.buf.references()
            end,
            "   lsp references",
        },

        ["<leader>lf"] = {
            function()
                if vim.lsp.buf.format ~= nil then
                    vim.lsp.buf.format { async = true, }
                else
                    vim.lsp.buf.formatting()
                end
            end,
            "   lsp formatting",
        },

        ["<leader>lo"] = { "<cmd>lopen<cr>", "loclist open" },
        ["<leader>lc"] = { "<cmd>lclose<cr>", "loclist close" },
        ["<leader>ln"] = { "<cmd>lnext<cr>", "loclist next" },
        ["<leader>lp"] = { "<cmd>lprevious<cr>", "loclist previous" },
    },

    v = {

        ["<leader>lf"] = {
            function()
                vim.lsp.buf.range_formatting()
            end,
            "   lsp formatting",
        },
    }
}

-- m:  multi cursor
M.m = {
    n = {
        ["<leader>mt"] = { "<cmd> MarksToggleSigns <cr>", "toggle marks" },
    },
}

-- n:  navigation or notes
M.n = {
    n = {
        -- Label
        ["<leader>n"] = { "", "   navigation" },

        ["<leader><leader>n"] = {
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
        ["<leader>nv"] = { "<cmd>Neorg gtd views<cr>", "notes overview" },
        ["<leader>nr"] = {
            function()
                vim.cmd "Neorg return "
                vim.cmd("cd " .. vim.g.prev_cwd)
            end,
            "Return to cwd",
        },
        ["<leader>np"] = { "<cmd> Neorg presenter start <cr>", "start presentation" },
    },
}

-- o:  outline
M.o = {
    n = {
        ["<leader>o"] = { "", "פּ   toggle outline" },
        -- ["<leader>oo"] = { "<cmd> SymbolsOutlineOpen <cr>", "פּ   open outline" },
        -- ["<leader>oc"] = { "<cmd> SymbolsOutlineClose <cr>", "פּ   close outline" },
        ["<leader><leader>o"] = { "<cmd> AerialToggle <cr>", "פּ   toggle outline" },
    }
}

-- p:  plugins
M.p = {
    n = {
        -- -- Label
        -- ["<leader>p"] = { "", "   projects" },

        -- -- (r)estore last session
        -- ["<leader>pr"] = { "<cmd> SessionLoad <cr>", "  restore last session" },

        -- -- (s)ave current session
        -- ["<leader>ps"] = { "<cmd> SessionSave <cr>", "  save current session" },
        ["<leader><leader>p"] = { "", "packer" },

        ["<leader>ps"] = { "<cmd> PackerStatus <cr>", "" },
        ["<leader>pc"] = { "<cmd> PackerClean <cr>", "" },
        ["<leader>pi"] = { "<cmd> PackerInstall <cr>", "" },
        ["<leader>pp"] = { "<cmd> PackerProfile <cr>", "" },
        ["<leader>pu"] = { "<cmd> PackerUpdate <cr>", "" },
    },
}

-- q:  quickfix
M.q = {
    n = {
        ["<leader>q"] = { "", "   quickfix" },

        ["<leader><leader>q"] = { "<cmd> TroubleToggle quickfix <cr>", "" },
        ["<leader>qc"] = { "<cmd> TroubleClose <cr>", "close quickfix" },
        ["<leader>qo"] = { "<cmd> Trouble quickfix <cr>", "open quickfix" },
        ["<leader>qn"] = { "<cmd> cnext <cr>", "next item in quickfix" },
        ["<leader>qp"] = { "<cmd> cprevious <cr>", "prev item in quickfix" },
    },
}

-- r:  run (for programs, or debugging)
M.r = {
    n = {
    },
}

-- s:  sessions
M.s = {
    n = {
        -- Label
        ["<leader>s"] = { "", "   sessions" },

        -- (r)estore last session
        ["<leader>sr"] = { "<cmd> SessionLoad <cr>", "  restore last session" },

        -- (s)ave current session
        ["<leader>ss"] = { "<cmd> SessionSave <cr>", "  save current session" },
    },
}

-- t:  terminal/testing
M.t = {

    n = {
        ["<leader>t"] = { name = " terminal /  testing" },
        ["<leader>tl"] = {
            "<cmd> ToggleTermSendCurrentLine <cr>",
            ""
        },
    },
    v = {
        ["<leader>tl"] = {
            "<cmd> ToggleTermSendVisualLines <cr>",
            ""
        },
        ["<leader>tv"] = {
            "<cmd> ToggleTermSendVisualSelection <cr>",
            ""
        },
    },
    t = {
        ["<C-_>"] = {
            "<cmd> ToggleTerm <cr>",
            "   toggle floating term",
        },

        -- toggle in terminal mode
        ["<M-t>"] = {
            "<cmd> ToggleTerm direction=tab <cr>",
            "   toggle floating term",
        },
        ["<M-f>"] = {
            "<cmd> ToggleTerm direction=float <cr>",
            "   toggle floating term",
        },

        ["<M-h>"] = {
            "<cmd> ToggleTerm direction=horizontal <cr>",
            "   toggle horizontal term",
        },

        ["<M-v>"] = {
            "<cmd> ToggleTerm direction=vertical <cr>",
            "   toggle vertical term",
        },
    },
}

-- u:  - (undo)
M.u = {
    n = {
        ["<leader>u"] = { "", "undotree" },

        ["<leader>uo"] = { "<cmd> UndotreeShow <cr>", "undotree" },
        ["<leader>uf"] = { "<cmd> UndotreeFocus <cr>", "undotree" },
        ["<leader>uc"] = { "<cmd> UndotreeHide <cr>", "undotree" },
        ["<leader>ut"] = { "<cmd> UndotreeToggle <cr>", "undotree" },

        ["<leader><leader>u"] = { "<cmd> UndotreeToggle <cr>", "undotree" },
    },
}

-- v:  - (visual)
M.v = {
    n = {
        ["<leader><leader>v"] = { "<cmd> luafile $nvim/init.lua <cr>", "Reload neovim config" },
        ["<leader>vx"] = { "<cmd> qa <cr>", "Exit neovim" },
        ["<leader>vX"] = { "<cmd> wqa <cr>", "save and Exit neovim" },
    },
}

-- w:  windows
M.w = {
    n = {
        -- Label
        ["<leader>w"] = { "", "   windows" },
        ["<leader>wc"] = { "<cmd> q <cr>", "close window" },
    },
}

-- x:  context
M.x = {
    n = {
        ["<leader>xj"] = {
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

-- z:  zen mode
M.z = {
    n = {
        ["<leader><leader>z"] = { "<cmd> ZenMode <cr>", " toggle zen-mode" },

        ["<leader>zz"] = { "<cmd> ZenMode <cr>", "  toggle zen-mode" },
        ["<leader>zt"] = { "<cmd> Twilight <cr>", "  toggle twilight" },
    }
}

return M
