return function(colour_palette)
    local colors = colour_palette.base_30

    return {
        NvimTreeEmptyFolderName = { fg = colors.folder_bg },
        NvimTreeEndOfBuffer = { fg = colors.black },
        NvimTreeFolderIcon = { fg = colors.folder_bg },
        NvimTreeFolderName = { fg = colors.folder_bg },
        NvimTreeIndentMarker = { fg = colors.grey_fg },
        NvimTreeNormal = { bg = colors.black },
        NvimTreeNormalNC = { bg = colors.black },
        NvimTreeOpenedFolderName = { fg = colors.folder_bg },
        NvimTreeGitIgnored = { fg = colors.light_grey },

        -- NvimTreeWinSeparator = {
        --     fg = colors.black,
        --     bg = colors.black,
        -- },

        NvimTreeWindowPicker = {
            fg = colors.red,
            bg = colors.black2,
        },

        NvimTreeCursorLine = {
            bg = colors.black2,
        },

        NvimTreeGitModified = { fg = "#E2C08D" },
        NvimTreeGitDirty = { fg = "#E2C08D" },
        NvimTreeGitMerge = { fg = "#F59E1B" },
        NvimTreeGitStaged = { fg = "#73C991" },
        NvimTreeGitNew = { fg = "#73C991" },
        NvimTreeGitDeleted = { fg = "#EC5F67" },
        NvimTreeLiveFilterPrefix = { fg = colors.dark_purple },

        NvimTreeSpecialFile = {
            fg = colors.yellow,
            bold = true,
        },

        NvimTreeRootFolder = {
            fg = colors.red,
            bold = true,
        },
    }
end
