return function(colour_palette)
    local colors = colour_palette.base_30
    return {
        IndentBlanklineContextChar = { fg = colors.blue },
        IndentBlanklineContextStart = { fg = "", bg = "", italic = true, underline = false },
        IndentBlanklineContextSpaceChar = { fg = colors.line },
        IndentBlanklineChar = { fg = colors.line },
        IndentBlanklineSpaceChar = { fg = colors.line },
    }
end
