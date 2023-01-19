local present, neorg = pcall(require, "neorg")

if not present then
    return
end

neorg.setup {
    load = {
        ["core.defaults"] = {},
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
                    notes = "~/Documents/Notes",
                },
            },
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[neorg]",
            },
        },
        ["core.presenter"] = {
            config = {
                zen_mode = "zen-mode",
            },
        },
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
                            query = "(todo_item_done) @icon",
                        },

                        pending = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_pending) @icon",
                        },

                        undone = {
                            enabled = true,
                            highlight = "@neorg.todo_items.undone",
                            query = "(todo_item_undone) @icon",
                        },

                        uncertain = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_uncertain) @icon",
                        },

                        on_hold = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_on_hold) @icon",
                        },

                        cancelled = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_cancelled) @icon",
                        },

                        recurring = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_recurring) @icon",
                        },

                        urgent = {
                            enabled = true,
                            icon = "",
                            query = "(todo_item_urgent) @icon",
                        },
                    },
                }
            },
        },
    },
}
