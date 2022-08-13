local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    return
end

local icons = require("core.icons")

require("core.utils").load_highlight "nvimtree"

-- vim.wo.foldcolumn = "5"
local icon_padding = ""
if (vim.fn.has('unix') == 1 or vim.fn.has('macunix') == 1) then
    icon_padding = " "
end

local diagnostics_icons = require("core.icons").diagnostics

local options = {
    create_in_closed_folder = false,
    auto_reload_on_write = false,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_focused_file = {
        enable = false,
        update_cwd = false,
    },
    view = {
        side = "left",
        width = 30,
        centralize_selection = true,
        preserve_window_proportions = true,
        hide_root_folder = true,
        signcolumn = "auto:2-5",
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    filesystem_watchers = {
        enable = true,
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└" .. icon_padding,
                item = "│" .. icon_padding,
                edge = "│" .. icon_padding,
                none = " " .. icon_padding,
            }
        },
        icons = {
            show = {
                folder = true,
                folder_arrow = false,
                file = true,
                git = true,
            },
            glyphs = {
                default = icons.filesystem.file,
                symlink = "",
                git = icons.explorer.git,
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
            webdev_colors = true,
            git_placement = "before",
        },
        highlight_git = true,
        add_trailing = true,
        highlight_opened_files = "none",
        special_files = {},
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            info = diagnostics_icons.info .. " ",
            hint = diagnostics_icons.hint .. " ",
            warning = diagnostics_icons.warn .. " ",
            error = diagnostics_icons.error .. " ",
        },
    },
    live_filter = {
        prefix = icons.explorer.filter .. " ",
        always_show_folders = false,
    },
}

nvimtree.setup(options)

vim.api.nvim_create_autocmd({ "WinEnter" }, {
    pattern = "NvimTree*",
    callback = function()
        vim.wo.cursorline = true
    end
})
