return function(colour_palette)
    local colors = colour_palette.base_30

    return {

        TelescopeBorder = {
            fg = colors.grey,
            -- bg = colors.darker_black,
        },

        TelescopePromptBorder = {
            fg = colors.grey,
            -- bg = colors.black2,
        },

        TelescopePromptNormal = {
            fg = colors.white,
            -- bg = colors.black2,
        },

        TelescopePromptPrefix = {
            fg = colors.red,
            -- bg = colors.black2,
        },

        TelescopeNormal = { bg = colors.darker_black },

        TelescopePreviewTitle = {
            fg = colors.black,
            bg = colors.green,
        },

        TelescopePromptTitle = {
            fg = colors.black,
            bg = colors.red,
        },

        TelescopeResultsTitle = {
            fg = colors.black,
            bg = colors.nord_blue,
        },

        TelescopeSelection = {
            bg = colors.one_bg,
            fg = colors.white,
        },

        TelescopeResultsDiffAdd = {
            fg = colors.green,
        },

        TelescopeResultsDiffChange = {
            fg = colors.yellow,
        },

        TelescopeResultsDiffDelete = {
            fg = colors.red,
        },
    }
end
