return function(colour_palette)
    local theme = colour_palette.base_16
    local colors = colour_palette.base_30


    return {
        TSAnnotation = {
            fg = theme.base0F,
            sp = "none",
        },

        TSAttribute = {
            fg = theme.base0A,
            sp = "none",
        },

        TSCharacter = {
            fg = theme.base08,
            sp = "none",
        },

        TSConstBuiltin = {
            fg = theme.base09,
            sp = "none",
        },

        TSConstMacro = {
            fg = theme.base08,
            sp = "none",
        },

        TSError = {
            fg = theme.base08,
            sp = "none",
        },

        TSException = {
            fg = theme.base08,
            sp = "none",
        },

        TSFloat = {
            fg = theme.base09,
            sp = "none",
        },

        TSKeywordFunction = {
            fg = theme.base0E,
            sp = "none",
        },

        TSKeywordReturn = {
            fg = theme.base0E,
            sp = "none",
        },

        TSFuncBuiltin = {
            fg = theme.base0D,
            sp = "none",
        },

        TSFuncMacro = {
            fg = theme.base08,
            sp = "none",
        },

        TSKeywordOperator = {
            fg = theme.base0E,
            sp = "none",
        },

        TSMethod = {
            fg = theme.base0D,
            sp = "none",
        },

        TSNamespace = {
            fg = theme.base08,
            sp = "none",
        },

        TSNone = {
            fg = theme.base05,
            sp = "none",
        },

        TSParameter = {
            fg = theme.base08,
            sp = "none",
        },

        TSParameterReference = {
            fg = theme.base05,
            sp = "none",
        },

        TSPunctBracket = {
            fg = theme.base0F,
        },

        TSPunctDelimiter = {
            fg = theme.base0F,
            sp = "none",
        },

        TSPunctSpecial = {
            fg = theme.base08,
            sp = "none",
        },

        TSStringRegex = {
            fg = theme.base0C,
            sp = "none",
        },

        TSStringEscape = {
            fg = theme.base0C,
            sp = "none",
        },

        TSSymbol = {
            fg = theme.base0B,
            sp = "none",
        },

        TSTagDelimiter = {
            fg = theme.base0F,
            sp = "none",
        },

        TSText = {
            fg = theme.base05,
            sp = "none",
        },

        TSStrong = {
            bold = true,
        },

        TSEmphasis = {
            fg = theme.base09,
            sp = "none",
        },

        TSStrike = {
            fg = theme.base00,
            sp = "none",
            strikethrough = true,
        },

        TSLiteral = {
            fg = theme.base09,
            sp = "none",
        },

        TSURI = {
            fg = theme.base09,
            sp = "none",
            underline = true,
        },

        TSTypeBuiltin = {
            fg = theme.base0A,
            sp = "none",
        },

        TSVariableBuiltin = {
            fg = theme.base09,
            sp = "none",
        },

        TSVariable = {
            fg = theme.base05,
        },

        TSDefinition = { italic = true },
        TSDefinitionUsage = { italic = true },

        TSCurrentScope = {
            bold = true,
        },

        luaTSField = {
            fg = theme.base0D,
        },

        TSFieldKey = {
            fg = theme.base08,
        },

        TSProperty = {
            fg = theme.base08,
        },
        TreesitterContext = { italic = true, },
        TreesitterContextLineNumber = { fg = colors.grey, italic = true, },
    }
end