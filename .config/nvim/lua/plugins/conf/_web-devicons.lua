local present, web_devicons = pcall(require, "nvim-web-devicons")

if not present then
    return
end

require("core.utils").load_highlight "devicons"

web_devicons.setup {
    override = require("core.icons").devicons
}
