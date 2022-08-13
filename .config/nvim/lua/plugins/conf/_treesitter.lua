local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

require("core.utils").load_highlight "syntax"
require("core.utils").load_highlight "treesitter"

local options = {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "norg",
        "php",
        "python",
        "typescript",
        "vim",
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>xv",
            node_incremental = "<leader>xi",
            scope_incremental = "<leader>xs",
            node_decremental = "<leader>xd",
        },
    },
}

treesitter.setup(options)
