local present, scrollbar = pcall(require, "scrollbar")

if not present then
    return
end

scrollbar.setup {
    excluded_filetypes = {
        "prompt",
        "help",
        "terminal",
        "alpha",
        -- "packer",
        "lspinfo",
        "NvimTree",
        "TelescopePrompt",
        "TelescopeResults",
        "lsp-installer",
        "color-picker",
        "",
    },
    marks = {
        Search = {
            text = { "-", "=", "", "ﮆ", },
            priority = 0,
            color = nil,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=", "", "ﮆ", },
            priority = 1,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=", "", "ﮆ", },
            priority = 2,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=", "", "ﮆ", },
            priority = 3,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=", "", "ﮆ", },
            priority = 4,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=", "", "ﮆ", },
            priority = 5,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
    }
}

require("core.utils").load_highlight "scrollbar"
