-- INFO: UI

-- INTRO
vim.opt.shortmess:append "sI" -- Disable Neovim's default intro

-- FONT
vim.opt.guifont = "UbuntuMono NF:h10" -- Set font family and font size

-- COLOUR SCHEME
vim.opt.termguicolors = true -- Use wider range of colours

-- CUSTOM VARIABLES
vim.g.colour_scheme = "onedark" -- Set general colour scheme

-- Icon options
vim.g.git_set = "circle_solid"
vim.g.lsp_set = "neovim"
vim.g.explorer_set = "cool"
vim.g.fold_set = "sleek"
vim.g.filesystem_set = "rounded"
vim.g.position_set = "hexagon_outline"
vim.g.diagnostic_set = "outline"
vim.g.separator_set = "arrow" --

-- Provider options
vim.g.context_provider = "nvim-navic" -- treesitter-context/nvim-gps/nvim-navic
vim.g.outline_provider = "aerial.nvim" -- aerial.nvim/symbols-outline.nvim
vim.g.scrollbar_provider = "satellite.nvim" -- satellite.nvim/nvim-scrollbar

vim.g.load_compatibility_mappings = false -- Load mappings used in other editors

-- GUTTER
vim.opt.signcolumn = "auto:2-4" -- Set the width of the sign column

vim.opt.foldcolumn = "1" -- Set the width of the fold column
vim.opt.foldlevel = 99 -- Expand all folds by default
vim.opt.foldenable = true -- Enable folding

vim.opt.number = true -- Enable line numbers
vim.opt.numberwidth = 2 -- Set the minimum width of the number column
vim.opt.relativenumber = true -- Disable relative numbers
vim.opt.ruler = false -- Disable the ruler

-- INDENTATION
vim.opt.smarttab = true -- Delete leading spaces like tabs
vim.opt.expandtab = true -- Use soft tabs by default
vim.opt.tabstop = 4 -- Set the width of hard tabs
vim.opt.softtabstop = 4 -- Set the width of soft tabs
vim.opt.shiftwidth = 4 -- Set the width of tabs for autoindent
vim.opt.autoindent = true -- Enable
vim.opt.smartindent = false

-- CASE SENSITIVITY
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- STATUS LINE
vim.opt.laststatus = 3 -- Use a global status line
vim.opt.showmode = false -- Hide the verbose mode below the status line ("-- INSERT --")

-- EXTRA
vim.opt.fillchars = { -- Configure special representative icons
    eob = " ",

    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",

    horiz = "─",
    horizup = '┴',
    horizdown = "┬",

    vert = "│",
    vertleft = "┤",
    vertright = "├",
    verthoriz = "┼",
}
vim.opt.list = true -- Enable special representative icons
vim.opt.listchars = { -- Configure special representative icons
    -- eol = " ",

    tab = "",
    space = " ",
    lead = "·",
    trail = "…",
}

-- use filetype.lua instead of filetype.vim


-- vim.opt.title = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- TIMING
vim.opt.timeoutlen = 400
vim.opt.updatetime = 250 -- Update frequency for gitsigns.nvim

-- BACKUP
vim.opt.undofile = false
-- vim.opt.undodir = vim.fn.stdpath("data") .. "/undo/"
vim.opt.backup = false
-- vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup/"
vim.opt.swapfile = false
-- vim.opt.dir = vim.fn.stdpath("data") .. "/swap/"

-- vim.opt.lazyredraw = false
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line


-- INFO: GENERAL
vim.opt.clipboard = ""
vim.g.mapleader = " "
vim.opt.whichwrap = "<>[]bs"
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.mouse = "a"
vim.opt.compatible = false
vim.opt.scrolloff = 0
vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winpos,winsize"
vim.opt.redrawtime = 100
vim.opt.autoread = true
vim.opt.spell = false -- Only enable for text files and markdown
vim.opt.formatoptions = "tcqjrp"
vim.opt.linebreak = true
vim.opt.breakat = " ^I!@*-+;:,./?"
vim.opt.completeopt = "menuone,noselect"

vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

vim.g.matchparen_timeout = 5
vim.g.matchparen_insert_timeout = 5

-- disable some builtin vim plugins
local default_plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    -- "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
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

-- set shada path
vim.schedule(function()
    vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
    vim.cmd [[ silent! rsh ]]
end)
