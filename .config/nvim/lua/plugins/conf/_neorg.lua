local present, neorg = pcall(require, "neorg")

if not present then
    return
end

neorg.setup {
    load = {
        ["core.defaults"] = {},
        -- ["core.norg.qol.todo_items"] = {},
        -- ["core.mode"] = {},
        -- ["core.norg.esupports.hop"] = {},
        -- ["core.integrations.treesitter"] = {},
        -- ["core.autocommands"] = {},
        -- ["core.syntax"] = {},
        -- ["core.neorgcmd"] = {},
        -- ["core.norg.esupports.indent"] = {},
        -- ["core.norg.esupports.metagen"] = {},
        -- ["core.norg.news"] = {},
        -- ["core.tangle"] = {},
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    keybinds.remap_key("presenter", "n", "h", "<C-h>")
                    keybinds.remap_key("presenter", "n", "l", "<C-l>")
                end,
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            },
        },
        ["core.norg.qol.toc"] = {},
        -- ["core.export"] = {}, -- TODO: Uncomment when u update
        ["core.norg.journal"] = {
            config = {
                strategy = "flat", -- NOTE: Avoid "nested" for OS-compatibility reasons
            },
        },
        ["core.norg.manoeuvre"] = {},
        ["core.norg.concealer"] = {
            config = {
                icons = {
                    todo = {
                        enabled = true,

                        done = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemDoneMark",
                            query = "(todo_item_done) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        pending = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemPendingMark",
                            query = "(todo_item_pending) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        undone = {
                            enabled = true,
                            icon = "×",
                            highlight = "NeorgTodoItemUndoneMark",
                            query = "(todo_item_undone) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        uncertain = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemUncertainMark",
                            query = "(todo_item_uncertain) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        on_hold = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemOnHoldMark",
                            query = "(todo_item_on_hold) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        cancelled = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemCancelledMark",
                            query = "(todo_item_cancelled) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        recurring = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemRecurringMark",
                            query = "(todo_item_recurring) @icon",
                            extract = function()
                                return 1
                            end,
                        },

                        urgent = {
                            enabled = true,
                            icon = "",
                            highlight = "NeorgTodoItemUrgentMark",
                            query = "(todo_item_urgent) @icon",
                            extract = function()
                                return 1
                            end,
                        },
                    },
                }
            },
        },
        -- ["core.export.markdown"] = {},
        ["core.gtd.base"] = {
            config = {
                workspace = "notes",
            },
        },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    callback = function()
        vim.wo.foldcolumn = "auto:6"
        vim.wo.signcolumn = "yes:1"
    end,
})
