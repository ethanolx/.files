return function(colour_palette)
    local colors = colour_palette.base_30

    return {
        DiagnosticInfo = { fg = "#35C5B8", bg = "" },
        DiagnosticHint = { fg = "#C678DD", bg = "" },
        DiagnosticWarn = { fg = "#F29949", bg = "" },
        DiagnosticError = { fg = "#FD7878", bg = "" },

        -- LSP References
        LspReferenceText = { fg = colors.darker_black, bg = colors.white },
        LspReferenceRead = { fg = colors.darker_black, bg = colors.white },
        LspReferenceWrite = { fg = colors.darker_black, bg = colors.white },

        -- Lsp Diagnostics
        LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },

        -- RenamerTitle = { fg = colors.black, bg = colors.red },
        -- RenamerBorder = { fg = colors.red },
    }
end
