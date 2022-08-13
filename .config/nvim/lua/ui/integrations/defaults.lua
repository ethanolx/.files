return function(colour_palette)
    local colors = colour_palette.base_30
    local theme = colour_palette.base_16

    return {
        Whitespace = { fg = colors.line },
        MatchWord = {
            bg = colors.grey,
            fg = colors.white,
        },

        Pmenu = { bg = "" },
        PmenuSbar = { bg = "" },
        PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
        PmenuThumb = { bg = colors.grey },

        MatchParen = { link = "MatchWord" },

        Comment = { fg = colors.grey_fg },

        CursorLineNr = { fg = colors.white },
        LineNr = { fg = colors.grey },

        -- floating windows
        FloatBorder = { fg = colors.grey },
        NormalFloat = {},

        NvimInternalError = { fg = colors.red },
        WinSeparator = { fg = colors.line },
        VertSplit = { fg = colors.line, bg = "" },

        -- packer
        PackerPackageName = { fg = colors.red },
        PackerSuccess = { fg = colors.green },
        PackerStatusSuccess = { fg = theme.base08 },
        PackerStatusCommit = { fg = colors.blue },
        PackeProgress = { fg = colors.blue },
        PackerOutput = { fg = colors.red },
        PackerStatus = { fg = colors.blue },
        PackerHash = { fg = colors.blue },

        Normal = {
            fg = theme.base05,
            bg = theme.base00,
        },

        Bold = {
            bold = true,
        },

        Debug = {
            fg = theme.base08,
        },

        Todo = {
            fg = "",
            bg = "",
        },

        Directory = {
            fg = theme.base0D,
        },

        Error = {
            fg = theme.base00,
            bg = theme.base08,
        },

        ErrorMsg = {
            fg = theme.base08,
            bg = theme.base00,
        },

        Exception = {
            fg = theme.base08,
        },

        FoldColumn = { fg = "#56b6c2", bg = "" },
        Folded = { fg = theme.base03, bg = colors.one_bg2, bold = true },

        IncSearch = {
            fg = theme.base01,
            bg = theme.base09,
        },

        Italic = {
            italic = true,
        },

        Macro = {
            fg = theme.base08,
        },

        ModeMsg = {
            fg = theme.base0B,
        },

        MoreMsg = {
            fg = theme.base0B,
        },

        Question = {
            fg = theme.base0D,
        },

        Search = {
            fg = theme.base01,
            bg = theme.base0A,
        },

        Substitute = {
            fg = theme.base01,
            bg = theme.base0A,
            sp = "none",
        },

        SpecialKey = {
            fg = theme.base03,
        },

        TooLong = {
            fg = theme.base08,
        },

        UnderLined = {
            -- fg = theme.base0B,
            underline = true,
        },

        Visual = {
            bg = theme.base02,
        },

        VisualNOS = {
            fg = theme.base08,
        },

        WarningMsg = {
            fg = theme.base08,
        },

        WildMenu = {
            fg = theme.base08,
            bg = theme.base0A,
        },

        Title = {
            fg = theme.base0D,
            sp = "none",
        },

        Conceal = {
            bg = "NONE",
        },

        Cursor = {
            fg = theme.base00,
            bg = theme.base05,
        },
        TermCursor = {
            fg = theme.base00,
            bg = theme.base05,
        },
        TermCursorNC = {
            fg = theme.base00,
            bg = theme.base05,
        },

        NonText = {
            fg = theme.base03,
        },

        SignColumn = {
            fg = theme.base03,
            sp = "NONE",
        },

        ColorColumn = {
            bg = theme.base01,
            sp = "none",
        },

        CursorColumn = {
            bg = theme.base01,
            sp = "none",
        },

        CursorLine = {
            bg = "none",
            sp = "none",
        },

        QuickFixLine = {
            bg = theme.base01,
            sp = "none",
        },

        -- spell
        SpellBad = {
            undercurl = true,
            sp = theme.base08,
        },

        SpellLocal = {
            undercurl = true,
            sp = theme.base0C,
        },

        SpellCap = {
            undercurl = true,
            sp = theme.base0D,
        },

        SpellRare = {
            undercurl = true,
            sp = theme.base0E,
        },

        StatusLine = {
            fg = colors.nord_blue,
            bg = colors.statusline_bg,
        },
        TabLine = {
            fg = colors.nord_blue,
            bg = colors.black,
        },
        TabLineSel = {
            fg = colors.nord_blue,
            bg = colors.black,
        },
        TabLineFill = {
            bg = colors.black,
        }
    }
end
