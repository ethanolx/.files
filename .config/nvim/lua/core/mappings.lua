local utils = require("core.utils")
local termcodes = utils.term_codes

local mappings = {}

-- mappings._alt = {
--     v = {
--         j = { ": MoveBlock(1)<cr>", "  move lines down" },
--         J = { "<cmd> lua require(\"trevj\").format_at_cursor() <cr>", "unwrap lines", },
--         k = { ": MoveBlock(-1)<cr>", "  move lines up" },
--     },
--     n = {
--         p = { "\"+p", "   paste from system clipboard" },
--         P = { "\"+P", "   paste from system clipboard" },
--         y = { "\"+y", "   paste from system clipboard" },
--         Y = { "\"+Y", "   paste from system clipboard" },

--         j = { "<cmd> MoveLine(1) <cr>", "  move line down" },
--         k = { "<cmd> MoveLine(-1) <cr>", "  move line up" },

--         J = { "<cmd> lua require(\"trevj\").format_at_cursor() <cr>", "unwrap lines", },

--         t = { "<cmd> ToggleTerm direction=tab <cr>", "   toggle floating term", },
--         f = { "<cmd> ToggleTerm direction=float <cr>", "   toggle floating term", },
--         h = { "<cmd> ToggleTerm direction=horizontal <cr>", "   toggle horizontal term", },
--         v = { "<cmd> ToggleTerm direction=vertical <cr>", "   toggle vertical term", },

--         [","] = { "<cmd> BufferLineMovePrev <cr>", "move buffer left" },
--         [";"] = { "<cmd> BufferLineMoveNext <cr>", "move buffer right" },
--     }
-- }

-- mappings._ctl = {
--     n = {
--         up = { "<C-w>+", "ﱟ   increase window width" },
--         down = { "<C-w>-", "ﱞ   decrease window width" },
--         right = { "<C-w>>", "ﱟ   increase window width" },
--         left = { "<C-w><", "ﱞ   decrease window width" },

--         h = { "<C-w>h", "  window left" },
--         l = { "<C-w>l", "  window right" },
--         j = { "<C-w>j", "  window down" },
--         k = { "<C-w>k", "  window up" },
--         _ = { "<cmd> ToggleTerm <cr>", "   toggle floating term", },
--     },
--     t = {
--         z = { termcodes "<C-\\><C-N>", "Escape terminal mode" },
--         h = { termcodes "<C-\\><C-n><C-w>h", "Escape terminal mode" },
--         j = { termcodes "<C-\\><C-n><C-w>j", "Escape terminal mode" },
--         k = { termcodes "<C-\\><C-n><C-w>k", "Escape terminal mode" },
--         l = { termcodes "<C-\\><C-n><C-w>l", "Escape terminal mode" },
--     }
-- }

mappings._overload = {
    i = {
        ["<S-Tab>"] = { "<C-d>", "Undo indentation" },
    },
    n = {
        ["_"] = { "\"_", "" },
        ["<Esc>"] = {
            function()
                vim.cmd "nohlsearch"
                vim.o.statusline = "%{%v:lua.require('feline').generate_statusline()%}"
            end,
            "  reset",
        },
        ["<Tab>"] = { "<cmd> BufferLineCycleNext <cr>", "   cycle next buffer" },
        ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <cr>", "   cycle prev buffer" },
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
        ["K"] = { require("core.utils").hover, "   lsp hover", },

    }
}

mappings.misc = {
    i = {
        ["<C-k><C-k>"] = { "<cmd> lua require'better-digraphs'.digraphs(\"i\")<cr>", "digraphs" },
    }
}

mappings.compatibility = {
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

-- a:  autocomplete
mappings.a = {
    n = {
        ["<leader>a"] = { name = "autocomplete", },
        ["<leader>as"] = { "<cmd>CmpStatus<cr>", "check autocomplete status" },
    },
}

-- b:  buffers
mappings.b = {
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
mappings.c = {
    n = {
        -- Label
        ["<leader>c"] = { name = " comments /  palette" },
        ["<leader>cp"] = { "<cmd>PickColor<cr>", "colour picker" },
    },

    v = {
    },
}

-- d:  diagnostics/debugging
mappings.d = {
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
mappings.e = {
    n = {
        -- Label
        ["<leader>e"] = { "", "פּ   explorer" },
        ["<leader><leader>e"] = { "<cmd> NvimTreeToggle <cr>", "" },

        -- (f)ocus the current buffer
        ["<leader>ec"] = { "<cmd>NvimTreeCollapse<cr>", "פּ  focus nvimtree" },
        ["<leader>ef"] = { "<cmd> NvimTreeFindFile <cr>", "פּ  focus nvimtree" },
        ["<leader>er"] = { "<cmd> NvimTreeRefresh <cr>", "פּ  focus nvimtree" },
    },
}

-- f:  find/telescope
mappings.f = {
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
mappings.g = {
    n = {
        -- Label
        ["<leader>g"] = { "", "   git" },
        ["<leader><leader>g"] = { "<cmd> Neogit <cr>", "git main" },


        ["<leader>gC"] = {
            function()

            end, "  commit"
        },
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
mappings.h = {
    n = {
        ["<leader>h"] = { name = "health" },
        ["<leader><leader>h"] = { "<cmd>checkhealth<cr>", "check health" },
    }
}

-- i:  - (insert)
mappings.i = {

}

-- j:  - (move down)
mappings.j = {

}

-- k:  keymaps
mappings.k = {
    n = {
        ["<leader>k"] = { name = "keymaps" },
        ["<leader><leader>k"] = {
            "<cmd> WhichKey <cr>",
            "   which-key all keymaps",
        },
    }
}

-- l: LSP
mappings.l = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["<leader>li"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "   lsp implementation",
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
mappings.m = {
    n = {
        ["<leader>mt"] = { "<cmd> MarksToggleSigns <cr>", "toggle marks" },
    },
}

-- n:  navigation or notes
mappings.n = {
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
mappings.o = {
    n = {
        ["<leader>o"] = { "", "פּ   toggle outline" },
        -- ["<leader>oo"] = { "<cmd> SymbolsOutlineOpen <cr>", "פּ   open outline" },
        -- ["<leader>oc"] = { "<cmd> SymbolsOutlineClose <cr>", "פּ   close outline" },
        ["<leader><leader>o"] = { "<cmd> AerialToggle <cr>", "פּ   toggle outline" },
    }
}

-- p:  plugins
mappings.p = {
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
mappings.q = {
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
mappings.r = {
    n = {
    },
}

-- s:  sessions
mappings.s = {
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
mappings.t = {

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
mappings.u = {
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
mappings.v = {
    n = {
        ["<leader><leader>v"] = { "<cmd> luafile $nvim/init.lua <cr>", "Reload neovim config" },
        ["<leader>vx"] = { "<cmd> qa <cr>", "Exit neovim" },
        ["<leader>vX"] = { "<cmd> wqa <cr>", "save and Exit neovim" },
    },
}

-- w:  windows
mappings.w = {
    n = {
        -- Label
        ["<leader>w"] = { "", "   windows" },
        ["<leader>wc"] = { "<cmd>q<cr>", "close window" },
    },
}

-- x:  context
mappings.x = {
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
mappings.z = {
    n = {
        ["<leader><leader>z"] = { "<cmd> ZenMode <cr>", " toggle zen-mode" },

        ["<leader>zz"] = { "<cmd> ZenMode <cr>", "  toggle zen-mode" },
        ["<leader>zt"] = { "<cmd> Twilight <cr>", "  toggle twilight" },
    }
}


utils.load_mappings(mappings)
