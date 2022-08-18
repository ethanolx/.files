local M = {}

-- Icon Sets
local filesystem_sets = {
    rounded = {
        file = "",
        closed_folder = "",
        opened_folder = "",
        closed_empty_folder = "",
        opened_empty_folder = "",
    },
    sharp = {
        file = "",
        closed_folder = "",
        opened_folder = "",
        closed_empty_folder = "",
        opened_empty_folder = "",
    }
}

local git_sets = {
    solid = {
        add = "",
        change = "", -- , , 
        delete = "",
    },
    outline = {
        add = "",
        change = "",
        delete = "",
    },
    circle_solid = {
        add = "",
        change = "ﴞ", -- ﭥ, , ﳁ
        delete = "",
    }
}

local explorer_sets = {
    cool = {
        filter = "",
        symlink_dir = "",
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "",
            untracked = "",
            deleted = "-", -- 
            ignored = "" -- 
        }
    }
}

local progress_sets = {
    circle = {

    }
}

local fold_sets = {
    sleek = {
        open = "",
        closed = "",
    }
}

local diagnostic_sets = {
    solid = {
        error = "",
        warn = "",
        hint = "",
        info = "",
        debug = "",
        trace = "",
    },
    outline = {
        error = "",
        warn = "",
        hint = "",
        info = "",
        debug = "",
        trace = "",
    }
}

local separator_sets = {
    round = {
        left = "",
        right = "",
    },
    block = {
        left = "█",
        right = "█",
    },
    arrow = {
        left = "",
        right = "",
    },
    slant = {
        left = "",
        right = "",
    }
}

local position_sets = {
    hexagon_outline = {
        symbol = "",
        top = "",
        bottom = "",
    },
    square_solid = {
        symbol = "",
        top = "ﰶ",
        bottom = "ﰭ",
    },
    circle_outline = {
        symbol = "",
        top = "",
        bottom = "",
    },
    square_outline = {
        symbol = "",
        top = "ﰷ",
        bottom = "ﰮ",
    },
}

M.filesystem = filesystem_sets[vim.g.filesystem_set]
M.positions = position_sets[vim.g.position_set]
M.explorer = explorer_sets[vim.g.explorer_set]
M.git = git_sets[vim.g.git_set]
M.diagnostics = diagnostic_sets[vim.g.diagnostic_set]
M.separators = separator_sets[vim.g.separator_set]
M.folds = fold_sets[vim.g.fold_set]

M.lsp = {
    neovim = {
        namespace = "",
        text = "",
        method = "",
        ["function"] = "",
        constructor = "",
        field = "ﰠ",
        variable = "",
        class = "ﴯ",
        interface = "",
        module = "",
        property = "ﰠ",
        unit = "",
        value = "",
        enum = "",
        keyword = "",
        snippet = "",
        color = "",
        file = M.filesystem.file,
        reference = "",
        folder = M.filesystem.closed_folder,
        enummember = "",
        constant = "",
        struct = "פּ",
        event = "",
        operator = "",
        typeparameter = "",
        table = "",
        object = "",
        tag = "",
        array = "",
        boolean = "",
        number = "",
        null = "ﳠ",
        string = "",
        calendar = "",
        watch = "",
        package = "",
    },
    vscode = {
        text = '  ',
        method = '  ',
        ["function"] = '  ',
        constructor = '  ',
        field = '  ',
        variable = '  ',
        class = '  ',
        interface = '  ',
        module = '  ',
        property = '  ',
        unit = '  ',
        value = '  ',
        enum = '  ',
        keyword = '  ',
        snippet = '  ',
        color = '  ',
        file = '  ',
        reference = '  ',
        folder = '  ',
        enummember = '  ',
        constant = '  ',
        struct = '  ',
        event = '  ',
        operator = '  ',
        typeparameter = '  ',
    }
}

M.lsp = M.lsp[vim.g.lsp_set]

M.devicons = {
    default_icon = {
        icon = M.filesystem.file,
        name = "Default",
    },

    c = {
        icon = "",
        name = "c",
    },

    css = {
        icon = "",
        name = "css",
    },

    cpp = {
        icon = "",
        name = "c",
    },

    deb = {
        icon = "",
        name = "deb",
    },

    Dockerfile = {
        icon = "",
        name = "Dockerfile",
    },

    html = {
        icon = "",
        name = "html",
    },

    jpeg = {
        icon = "",
        name = "jpeg",
    },

    jpg = {
        icon = "",
        name = "jpg",
    },

    js = {
        icon = "",
        name = "js",
    },

    kt = {
        icon = "󱈙",
        name = "kt",
    },

    lock = {
        icon = "",
        name = "lock",
    },

    lua = {
        icon = "",
        name = "lua",
    },

    mp3 = {
        icon = "",
        name = "mp3",
    },

    mp4 = {
        icon = "",
        name = "mp4",
    },

    norg = {
        icon = "ﴬ",
        name = "norg",
    },

    out = {
        icon = "",
        name = "out",
    },

    png = {
        icon = "",
        name = "png",
    },

    py = {
        icon = "",
        name = "py",
    },

    ["robots.txt"] = {
        icon = "ﮧ",
        name = "robots",
    },

    toml = {
        icon = "",
        name = "toml",
    },

    ts = {
        icon = "ﯤ",
        name = "ts",
    },

    ttf = {
        icon = "",
        name = "TrueTypeFont",
    },

    rb = {
        icon = "",
        name = "rb",
    },

    rpm = {
        icon = "",
        name = "rpm",
    },

    vue = {
        icon = "﵂",
        name = "vue",
    },

    woff = {
        icon = "",
        name = "WebOpenFontFormat",
    },

    woff2 = {
        icon = "",
        name = "WebOpenFontFormat2",
    },

    xz = {
        icon = "",
        name = "xz",
    },

    zip = {
        icon = "",
        name = "zip",
    },
}

M.operating_systems = {
    unix = "",
    mac = "",
    windows = "",
    dos = "",

    -- Linux-distribution-specific
    alpine = "",
    arch = "",
    centos = "",
    debian = "",
    fedora = "",
    gentoo = "",
    mint = "",
    redhat = "",
    ubuntu = "",
}

-- Rename to "all"
M.lspkind = {
    schema = "",
    schemas = "",
    table = "",
    tables = "",
    column = "",
}

for _, tbl in ipairs({ M.lsp, M.filesystem }) do
    for k, v in pairs(tbl) do
        M.lspkind[k] = v
    end
end

return M
