local present, navic = pcall(require, "nvim-navic")

if not present then
    return
end

require("core.utils").load_highlight "navic"

local icons = require("core.icons").lspkind

local padded_icons = {}

for item, icon in pairs(icons) do
    padded_icons[item] = icon .. " "
end

navic.setup {
    highlight = true,
    icons = padded_icons,
    separator = " » ",
}
