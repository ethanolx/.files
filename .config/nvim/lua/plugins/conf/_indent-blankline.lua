local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
    return
end

require("core.utils").load_highlight "blankline"

local options =  {
    enabled = true,
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "lsp-installer",
        "",
    },
    buftype_exclude = { "terminal" },
    char = "",
    char_blankline = "",
    context_char = "",
    context_char_blankline = "",
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
}

indent_blankline.setup(options)
