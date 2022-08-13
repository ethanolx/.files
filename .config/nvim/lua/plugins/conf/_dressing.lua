local present, dressing = pcall(require, "dressing")

if not present then
    return
end

require("core.utils").load_highlight "dressing"

dressing.setup {
    input = {
        winblend = 0,
        prompt_align = "center",
        default_prompt = "Input",
        relative = "editor",
        prefer_width = 80,
        get_config = function (opts)
        end
    },
    select = { },
}

require "telescope"
