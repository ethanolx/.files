return function(colour_palette)
    local colors = colour_palette.base_30

    return {
        -- Mode colours
        FelineModeNormal = { fg = colors.black, bg = colors.vibrant_green },
        FelineModeInsert = { fg = colors.black, bg = colors.sun },
        FelineModeTerminal = { fg = colors.black, bg = colors.blue },
        FelineModeVisual = { fg = colors.black, bg = colors.cyan },
        FelineModeReplace = { fg = colors.black, bg = colors.orange },
        FelineModeSelect = { fg = colors.black, bg = colors.nord_blue },
        FelineModeCommand = { fg = colors.black, bg = colors.red },
        FelineModeMisc = { fg = colors.black, bg = colors.green },

        FelineModeNormalSep = { fg = colors.vibrant_green, bg = colors.grey },
        FelineModeInsertSep = { fg = colors.sun, bg = colors.grey },
        FelineModeTerminalSep = { fg = colors.blue, bg = colors.grey },
        FelineModeVisualSep = { fg = colors.cyan, bg = colors.grey },
        FelineModeReplaceSep = { fg = colors.orange, bg = colors.grey },
        FelineModeSelectSep = { fg = colors.nord_blue, bg = colors.grey },
        FelineModeCommandSep = { fg = colors.red, bg = colors.grey },
        FelineModeMiscSep = { fg = colors.green, bg = colors.grey },

        FelineModeNormalCap = { fg = colors.statusline_bg, bg = colors.vibrant_green },
        FelineModeInsertCap = { fg = colors.statusline_bg, bg = colors.sun },
        FelineModeTerminalCap = { fg = colors.statusline_bg, bg = colors.blue },
        FelineModeVisualCap = { fg = colors.statusline_bg, bg = colors.cyan },
        FelineModeReplaceCap = { fg = colors.statusline_bg, bg = colors.orange },
        FelineModeSelectCap = { fg = colors.statusline_bg, bg = colors.nord_blue },
        FelineModeCommandCap = { fg = colors.statusline_bg, bg = colors.red },
        FelineModeMiscCap = { fg = colors.statusline_bg, bg = colors.green },
    }
end
