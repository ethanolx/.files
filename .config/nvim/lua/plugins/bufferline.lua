local present, bufferline = pcall(require, "bufferline")

if not present then
    return
end

require("core.utils").load_highlights(
    function(colour_palette)
        return {
        --     BufferLinePick = { fg = "#56b6c2", bg = colour_palette.black2, italic = true },
        --     BufferLinePickVisible = { fg = "#56b6c2", bg = colour_palette.black2, italic = true },
        --     BufferLinePickSelected = { fg = "#56b6c2", bg = colour_palette.black, italic = true },
        --     BufferLinePin = { fg = colour_palette.red, },
        --     BufferLinePinned = { fg = "#565c64", bg = colour_palette.black2 },
        --     BufferLinePinnedVisible = { fg = "#565c64", bg = colour_palette.black2 },

        --     BufferLineBackground = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.black2,
        --     },

        --     BufferlineIndicatorVisible = {
        --         fg = colour_palette.black2,
        --         bg = colour_palette.black2,
        --     },

        --     -- buffers
        --     BufferLineBufferSelected = {
        --         fg = colour_palette.white,
        --         bg = colour_palette.black,
        --     },

        --     BufferLineBufferVisible = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.black2,
        --     },

        --     -- for diagnostics = "nvim_lsp"
        --     BufferLineError = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineErrorDiagnostic = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.black2,
        --     },

        --     -- close buttons
        --     BufferLineCloseButton = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineCloseButtonVisible = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineCloseButtonSelected = {
        --         fg = colour_palette.red,
        --         bg = colour_palette.black,
        --     },
        --     BufferLineFill = {
        --         fg = colour_palette.grey_fg,
        --         bg = colour_palette.black2,
        --     },
        --     BufferlineIndicatorSelected = {
        --         fg = colour_palette.black,
        --         bg = colour_palette.black,
        --     },

        --     -- modified
        --     BufferLineModified = {
        --         fg = colour_palette.red,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineModifiedVisible = {
        --         fg = colour_palette.red,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineModifiedSelected = {
        --         fg = colour_palette.green,
        --         bg = colour_palette.black,
        --     },

        --     -- separators
        --     BufferLineSeparator = {
        --         fg = colour_palette.black2,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineSeparatorVisible = {
        --         fg = colour_palette.black2,
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineSeparatorSelected = {
        --         fg = colour_palette.black2,
        --         bg = colour_palette.black2,
        --     },

        --     -- tabs
        --     BufferLineTab = {
        --         fg = colour_palette.light_grey,
        --         bg = colour_palette.one_bg3,
        --     },
        --     BufferLineTabSelected = {
        --         fg = colour_palette.black2,
        --         bg = colour_palette.nord_blue,
        --     },
        --     BufferLineTabClose = {
        --         fg = colour_palette.red,
        --         bg = colour_palette.black,
        --     },

        --     BufferLineDevIconDefaultSelected = {
        --         bg = colour_palette.black2,
        --     },

        --     BufferLineDevIconDefaultInactive = {
        --         bg = colour_palette.black2,
        --     },

        --     BufferLineDuplicate = {
        --         fg = "NONE",
        --         bg = colour_palette.black2,
        --     },
        --     BufferLineDuplicateSelected = {
        --         fg = colour_palette.red,
        --         bg = colour_palette.black,
        --     },
        --     BufferLineDuplicateVisible = {
        --         fg = colour_palette.blue,
        --         bg = colour_palette.black2,
        --     },

        --     -- custom area
        --     BufferLineRightCustomAreaText1 = {
        --         fg = colour_palette.white,
        --     },

        --     BufferLineRightCustomAreaText2 = {
        --         fg = colour_palette.red,
        --     },
        }
    end
)

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        show_close_icon = false,
        left_trunc_marker = " ",
        right_trunc_marker = " ",
        max_name_length = 20,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        show_buffer_close_icons = true,
        separator_style = "slant",
        themable = true,
        color_icons = true,
        show_buffer_icons = true,

        groups = {
            items = {
                require("bufferline.groups").builtin.pinned:with({
                    highlight = { gui = "bold" },
                    icon = "",
                }),
            }
        }
    },
}
