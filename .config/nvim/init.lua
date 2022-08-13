-- INFO: IMPORT ALL CORE MODULES
pcall(require, "impatient")
require("core")
require("core.options")

-- setup packer + plugins
require("core.packer")
require("core.utils").load_mappings(require("core.mappings"))

require("core.utils").load_highlight "defaults"
