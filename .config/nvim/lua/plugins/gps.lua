local present, gps = pcall(require, "nvim-gps")

if not present then
    return
end

local icons = require("core.icons").lspkind

gps.setup {
    icons = {
        ["class-name"] = icons.Class,
		["function-name"] = icons.Function,
		["method-name"] = icons.Method,
		["container-name"] = icons.Object,
		["tag-name"] = icons.Tag,
    },
    separator = " » ",
}

require("core.utils").load_context_provider(gps)
