local present, feline = pcall(require, "feline")

if not present then
    return
end

local icons = require "core.icons"

local utils = require "core.utils"
utils.load_highlight "git"
utils.load_highlight "feline"

local options = {
    colours = require("core.themes." .. vim.g.colour_scheme).base_30,
    lsp = require "feline.providers.lsp",
    lsp_severity = vim.diagnostic.severity,
}

local os = vim.bo.fileformat:lower()
options.os_icon = string.format(" %s ", icons.operating_systems[os])

options.mode_icon = ""
options.position_icon = icons.positions.symbol

options.mode_colours = {
    ["n"] = { "NORMAL", "FelineModeNormal" },
    ["no"] = { "N-PENDING", "FelineModeNormal" },
    ["i"] = { "INSERT", "FelineModeInsert" },
    ["ic"] = { "INSERT", "FelineModeInsert" },
    ["t"] = { "TERMINAL", "FelineModeTerminal" },
    ["v"] = { "VISUAL", "FelineModeVisual" },
    ["V"] = { "V-LINE", "FelineModeVisual" },
    [""] = { "V-BLOCK", "FelineModeVisual" },
    ["R"] = { "REPLACE", "FelineModeReplace" },
    ["Rv"] = { "V-REPLACE", "FelineModeReplace" },
    ["s"] = { "SELECT", "FelineModeSelect" },
    ["S"] = { "S-LINE", "FelineModeSelect" },
    [""] = { "S-BLOCK", "FelineModeSelect" },
    ["c"] = { "COMMAND", "FelineModeCommand" },
    ["cv"] = { "COMMAND", "FelineModeCommand" },
    ["ce"] = { "COMMAND", "FelineModeCommand" },
    ["r"] = { "PROMPT", "FelineModeMisc" },
    ["rm"] = { "MORE", "FelineModeMisc" },
    ["r?"] = { "CONFIRM", "FelineModeMisc" },
    ["!"] = { "SHELL", "FelineModeMisc" },
}

options.current_mode = {
    provider = function()
        return " " .. options.mode_icon .. " " .. options.mode_colours[vim.fn.mode()][1] .. " "
    end,

    hl = function() return options.mode_colours[vim.fn.mode()][2] end,

    right_sep = function()
        return {
            str = icons.separators.right,
            hl = options.mode_colours[vim.fn.mode()][2] .. "Sep",
        }
    end,
}

options.current_mode_pad = {
    provider = icons.separators.right,
    hl = {
        fg = options.colours.grey,
        bg = options.colours.lightbg,
    },
}

-- options.directory_icon = {
--     provider = " " .. icons.lspkind.folder,
--     hl = {
--         fg = options.colours.white,
--         bg = options.colours.lightbg,
--     },
-- }

options.directory_name = {
    provider = function()
        local cwd = " " .. icons.lspkind.folder .. " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return cwd
    end,
    truncate_hide = true,
    priority = 1, -- truncate after lsp_provider
    hl = {
        fg = options.colours.white,
        bg = options.colours.lightbg,
    },
    right_sep = {
        str = " ",
        hl = {
            fg = options.colours.grey,
            bg = options.colours.lightbg,
        },
    },
}

options.file_icon = {
    provider = function()
        local filename = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local icon = require("nvim-web-devicons").get_icon(filename, extension)
        if filename == "" then
            icon = "ﰸ"
        elseif filename == "[packer]" then
            icon = ""
        elseif filename == "NvimTree_1" then
            icon = "פּ"
        elseif filename == "NeogitStatus" then
            icon = ""
        elseif filename == "OUTLINE" then
            icon = "פּ"
        elseif icon == nil then
            icon = icons.filesystem.file
        end
        return " " .. icon
    end,
    hl = function()
        local filename = vim.fn.expand "%:t"
        local extension = vim.fn.expand "%:e"
        local _, colour = require("nvim-web-devicons").get_icon_color(filename, extension)
        if filename == "NeogitStatus" then
            _, colour = require("nvim-web-devicons").get_icon_color(".gitignore", ".gitignore")
        elseif filename == "" or colour == nil then
            colour = "white"
        end
        return {
            fg = colour,
            bg = options.colours.lightbg,
        }
    end,
}

options.file_name = {
    provider = function()
        local filename = vim.fn.expand "%:t"
        if filename == "" then
            return " "
        elseif filename == "[packer]" then
            filename = "PACKER"
        elseif filename == "NvimTree_1" then
            filename = "EXPLORER"
        elseif filename == "NeogitStatus" then
            filename = "GIT"
        end
        return " " .. filename .. " "
    end,
    hl = {
        fg = options.colours.white,
        bg = options.colours.lightbg,
    },

    right_sep = {
        str = icons.separators.right,
        hl = {
            fg = options.colours.lightbg,
            bg = options.colours.grey,
        },
    },
}

options.file_pad = {
    provider = icons.separators.right,
    hl = {
        fg = options.colours.grey,
        bg = options.colours.statusline_bg,
    },
}

options.git_branch = {
    provider = "git_branch",
    hl = {
        fg = options.colours.white,
        bg = options.colours.statusline_bg,
    },
    icon = "  ",
}

options.empty_space = {
    provider = " ",
    hl = {
        fg = options.colours.statusline_bg,
        bg = options.colours.statusline_bg,
    },
}

options.diff = {
    add = {
        provider = "git_diff_added",
        hl = "DiffAdd",
        icon = " " .. icons.git.add .. " ",
    },

    change = {
        provider = "git_diff_changed",
        hl = "DiffChange",
        icon = " " .. icons.git.change .. " ",
    },

    remove = {
        provider = "git_diff_removed",
        hl = "DiffDelete",
        icon = " " .. icons.git.delete .. " ",
    },
}

options.diagnostics = {
    error = {
        provider = "diagnostic_errors",
        enabled = function()
            return options.lsp.diagnostics_exist(options.lsp_severity.ERROR)
        end,

        hl = "DiagnosticError",
        icon = " " .. icons.diagnostics.error .. " ",
    },

    warning = {
        provider = "diagnostic_warnings",
        enabled = function()
            return options.lsp.diagnostics_exist(options.lsp_severity.WARN)
        end,
        hl = "DiagnosticWarn",
        icon = " " .. icons.diagnostics.warn .. " ",
    },

    hint = {
        provider = "diagnostic_hints",
        enabled = function()
            return options.lsp.diagnostics_exist(options.lsp_severity.HINT)
        end,
        hl = "DiagnosticHint",
        icon = " " .. icons.diagnostics.hint .. " ",
    },

    info = {
        provider = "diagnostic_info",
        enabled = function()
            return options.lsp.diagnostics_exist(options.lsp_severity.INFO)
        end,
        hl = "DiagnosticInfo",
        icon = " " .. icons.diagnostics.info .. " ",
    },
}

options.lsp_progress = {
    provider = function()
        local Lsp = vim.lsp.util.get_progress_messages()[1]

        if Lsp then
            local msg = Lsp.message or ""
            local percentage = Lsp.percentage or 0
            local title = Lsp.title or ""
            local spinners = {
                "",
                "",
                "",
            }

            local success_icon = {
                "",
                "",
                "",
            }

            local ms = vim.loop.hrtime() / 1000000
            local frame = math.floor(ms / 120) % #spinners

            if percentage >= 70 then
                return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
            end

            return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
        end

        return " "
    end,
    hl = { fg = options.colours.green },
}

options.lsp_provider = {
    provider = "lsp_client_names",
    truncate_hide = true,
    hl = {
        fg = options.colours.nord_blue,
    },
    right_sep = {
        str = " ",
    }
}

options.file_info_pad = {
    provider = icons.separators.left,
    hl = {
        fg = options.colours.grey,
        bg = options.colours.statusline_bg,
        underline = false,
    },
}

options.os = {
    provider = options.os_icon,

    hl = {
        fg = options.colours.white,
    },
    left_sep = {
        str = icons.separators.left,
        hl = {
            fg = options.colours.statusline_bg,
            bg = options.colours.grey,
        },
    }
}

options.file_encoding = {
    provider = "file_encoding",

    hl = {
        fg = options.colours.white,
    },
}

options.position_pad = {
    provider = icons.separators.left,
    hl = {
        fg = options.colours.grey,
        bg = options.colours.statusline_bg,
    },
}

options.position_icon = {
    provider = " " .. options.position_icon,
    hl = {
        fg = options.colours.white,
        bg = options.colours.lightbg,
    },
    left_sep = {
        str = icons.separators.left,
        hl = {
            fg = options.colours.lightbg,
            bg = options.colours.grey,
        }
    }
}

options.current_position = {
    provider = function()
        local current_line = vim.fn.line "."
        local total_line = vim.fn.line "$"
        local current_col = vim.fn.col "."

        local prefix = ""
        if current_line == 1 then
            prefix = ""
        elseif current_line == total_line then
            prefix = ""
        else
            local percentage, _ = math.modf((current_line / total_line) * 100)
            prefix = tostring(percentage) .. "%%"
        end

        return " " .. prefix .. " " .. current_line .. ":" .. current_col .. " "
    end,

    hl = {
        fg = options.colours.white,
        bg = options.colours.lightbg,
    },
}

options.cap_pad = {
    provider = icons.separators.left,
    hl = {
        fg = options.colours.grey,
        bg = options.colours.lightbg,
    },
}

options.cap = {
    provider = " " .. options.mode_icon .. " ",

    hl = function()
        return options.mode_colours[vim.fn.mode()][2] .. "Cap"
        -- return {
        --     fg = options.colours.statusline_bg,
        --     bg = options.mode_colours[vim.fn.mode()][2],
        -- }
    end,

    left_sep = function()
        return {
            str = icons.separators.left,
            hl = options.mode_colours[vim.fn.mode()][2] .. "Sep",
            -- hl = {
            --     fg = options.mode_colours[vim.fn.mode()][2],
            --     bg = options.colours.grey,
            -- },
        }
    end,
}

local components = {
    {
        options.current_mode,
        options.current_mode_pad,
        -- options.directory_icon,
        options.directory_name,
        options.file_icon,
        options.file_name,
        options.file_pad,
        options.git_branch,
        options.empty_space,
        options.diff.add,
        options.diff.change,
        options.diff.remove,
        options.diagnostics.info,
        options.diagnostics.hint,
        options.diagnostics.warning,
        options.diagnostics.error,
    },
    {
        options.lsp_progress,
    },
    {
        options.lsp_provider,
        options.file_info_pad,
        options.os,
        options.file_encoding,
        options.empty_space,
        options.position_pad,
        options.position_icon,
        options.current_position,
        options.cap_pad,
        options.cap,
    },
}

options.components = {
    active = components,
    inactive = components,
}

options.theme = {
    bg = options.colours.statusline_bg,
    fg = options.colours.fg,
}

feline.setup {
    theme = options.theme,
    components = options.components,
}

-- NOTE: WINBAR (autocmd this)
local context_provider = nil

if vim.g.context_provider == "nvim-gps" then
    context_provider = require "nvim-gps"
elseif vim.g.context_provider == "nvim-navic" then
    context_provider = require "nvim-navic"
end

if context_provider ~= nil then
    local current_context = {
        provider = function()
            return context_provider.get_location()
        end,
        enabled = function()
            return context_provider.is_available()
        end,
        hl = "WinBar"
    }

    local winbar_components = {
        {},
        { current_context, },
        {},
    }

    feline.winbar.setup {
        components = {
            active = winbar_components,
            inactive = {},
        }
    }
else
    require "treesitter-context"
end
