local symbol_icons = require("core.icons").lspkind

local symbol_highlights = {
    File = "TSURI",
    Module = "TSNamespace",
    Namespace = "TSNamespace",
    Package = "TSNamespace",
    Class = "TSType",
    Method = "TSMethod",
    Property = "TSMethod",
    Field = "TSField",
    Constructor = "TSConstructor",
    Enum = "TSType",
    Interface = "TSType",
    Function = "TSFunction",
    Variable = "TSConstant",
    Constant = "TSConstant",
    String = "TSString",
    Number = "TSNumber",
    Boolean = "TSBoolean",
    Array = "TSConstant",
    Object = "TSType",
    Key = "TSType",
    Null = "TSType",
    EnumMember = "TSField",
    Struct = "TSType",
    Event = "TSType",
    Operator = "TSOperator",
    TypeParameter = "TSParameter",
}

local symbols = {}

for k, v in pairs(symbol_highlights) do
    symbols[k] = {
        icon = symbol_icons[k],
        hl = v,
    }
end

vim.g.symbols_outline = {
    highlight_hovered_item = true,
    auto_preview = false,
    border = "rounded",
    symbols = symbols,
}

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            FocusedSymbol = { bg = colour_palette.line, italic = true, },
        }
    end
)
