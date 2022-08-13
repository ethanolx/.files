return function (colour_palette)
    local colors = colour_palette.base_30
    local theme = colour_palette.base_16

    return {
        ScrollbarInfo = { link = "DiagnosticInfo" },
        ScrollbarHint = { link = "DiagnosticHint" },
        ScrollbarWarn = { link = "DiagnosticWarn" },
        ScrollbarError = { link = "DiagnosticError" },

        ScrollbarSearch = { fg = theme.base0A },

        ScrollbarInfoHandle = { fg = "#35C5B8", bg = colors.one_bg2 },
        ScrollbarHintHandle = { fg = "#C678DD", bg = colors.one_bg2 },
        ScrollbarWarnHandle = { fg = "#F29949", bg = colors.one_bg2 },
        ScrollbarErrorHandle = { fg = "#FD7878", bg = colors.one_bg2 },

        ScrollbarSearchHandle = { fg = theme.base0A, bg = colors.one_bg2 },
    }
end
