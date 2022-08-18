return function (colour_palette)
    return {
        VM_Mono = {
            fg = colour_palette.base_30.yellow,
        },
        VM_Cursor = { link = "Cursor", },
        VM_Extend = { link = "Visual", },
        VM_Insert = {
            fg = colour_palette.base_30.vibrant_green,
            underline = true,
        },
    }
end
