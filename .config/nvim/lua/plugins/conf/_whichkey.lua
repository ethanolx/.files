local present, which_key = pcall(require, "which-key")

if not present then
    return
end

require("core.utils").load_highlight "which-key"

which_key.setup {
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 30,
        }
    },

    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
    },

    operators = {
        gc = "comments",
        ys = "surround",
    },

    popup_mappings = {
        scroll_down = "<C-d>", -- binding to scroll down inside the popup
        scroll_up = "<C-u>", -- binding to scroll up inside the popup
    },

    window = {
        border = "rounded", -- none/single/double/shadow
        margin = { 0, 0, 0, 0 },
        padding = { 1, 1, 1, 1 },
    },

    layout = {
        spacing = 5, -- spacing between columns
    },
}
