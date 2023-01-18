-- +------------------------------+
-- |                              |
-- |           DEFAULT            |
-- |                              |
-- +------------------------------+

vim.g.mapleader = " "

-- Set timeout for parenthesis matching
vim.g.matchparen_timeout = 5
vim.g.matchparen_insert_timeout = 5

-- Disable builtin vim plugins
local default_plugins = {
    "2html_plugin",
    "getscript",
    "getscriptplugin",
    "gzip",
    "logipat",
    -- "netrw",
    -- "netrwplugin",
    "netrwsettings",
    "netrwfilehandlers",
    "matchit",
    "tar",
    "tarplugin",
    "rrhelper",
    -- "spellfile_plugin",
    "vimball",
    "vimballplugin",
    "zip",
    "zipplugin",
    "python3_provider",
    "python_provider",
    "node_provider",
    "ruby_provider",
    "perl_provider",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(default_plugins) do
    vim.g["loaded_" .. plugin] = true
end

-- +------------------------------+
-- |                              |
-- |            CUSTOM            |
-- |                              |
-- +------------------------------+

-- Colour Scheme
vim.g.colour_scheme = "onedark"

-- Icon Sets
vim.g.icon_sets = {
    git = "square_solid",
}

-- Providers
vim.g.providers = {
    -- hover/native
    hover = "hover",

    -- gps/navic/treesitter
    context = "navic",

    -- aerial/symbols
    outline = "aerial",
}

-- Mappings
-- 0: Do not load compatibility mappings
-- 1: Load compatibility mappings under leader prefix
-- 2: Load compatibility mappings as root mappings
vim.g.compatibility_mode = 1
