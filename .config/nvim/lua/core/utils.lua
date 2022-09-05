local utils = {}

utils.get_colour_palette = function(colour_scheme)
    colour_scheme = colour_scheme or vim.g.colour_scheme

    local available, colour_palette = pcall(require, "core.themes." .. colour_scheme)

    if not available then
        vim.notify("The selected colour scheme \"" .. colour_scheme .. "\" is not available!", vim.log.levels.ERROR)
        return
    end

    return colour_palette
end

utils.format_plugin_name = function(plugin_name)
    local clean_plugin_name = plugin_name
    clean_plugin_name = string.lower(clean_plugin_name)
    clean_plugin_name, _ = string.gsub(clean_plugin_name, '[%.%-_]?n?vim[%.%-_]?', '')
    clean_plugin_name, _ = string.gsub(clean_plugin_name, '[%.%-_]?lua[%.%-_]?', '')

    return clean_plugin_name
end

utils.load_highlights = function(callback)
    local colour_palette = utils.get_colour_palette(vim.g.colour_scheme)

    local base16 = colour_palette and colour_palette.base_16
    local base30 = colour_palette and colour_palette.base_30
    local merged_palette = vim.tbl_extend("error", base16, base30)

    local hl_groups = callback(merged_palette)

    for hl_group, hl_opts in pairs(hl_groups) do
        vim.api.nvim_set_hl(0, hl_group, hl_opts)
    end
end

-- WARN: depends on bufferline.nvim's api
utils.check_if_last_buffer = function()
    local bufferline_commands = require "bufferline.commands"
    local bufferline_state = require "bufferline.state"
    local current_buffer_index = bufferline_commands.get_current_element_index(bufferline_state)
    return current_buffer_index >= #bufferline_state.components
end

utils.close_buffer = function(force)
    if vim.bo.buftype == "terminal" then
        force = force or #vim.api.nvim_list_wins() < 2 and ":bd!"
        local swap = force and #vim.api.nvim_list_bufs() > 1 and ":bp | bd!" .. vim.fn.bufnr()
        return vim.cmd(swap or force or "hide")
    end

    local fileExists = vim.fn.filereadable(vim.fn.expand "%p")
    local modified = vim.api.nvim_buf_get_option(vim.fn.bufnr(), "modified")

    -- if file doesnt exist & its modified
    if fileExists == 0 and modified then
        print "no file name? add it now!"
        return
    end

    force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"

    -- if buffer is the last, fall back to the previous buffer
    -- after closing, else fall back to the next buffer
    local direction = utils.check_if_last_buffer() and "p" or "n"
    local bufnr = vim.fn.bufnr()

    -- if not force, change to prev buf and then close current
    local close_cmd = force and ":bd!" or (":b" .. direction .. " | bd" .. bufnr)
    vim.cmd(close_cmd)
end

utils.load_alt_mappings = function (modes)
    local which_key = require("which-key")
    for mode, mappings in pairs(modes) do
        for key, details in pairs(mappings) do
            local action, comment, opts = table.unpack(details)

            which_key.register({ [string.format("<M-%s>")] =  })
        end
    end
    for category, section_mappings in pairs(mappings) do
        for mode, mode_mappings in pairs(section_mappings) do
            for keybind, mapping_info in pairs(mode_mappings) do
                if category == "_compatibility" then
                    local compatibility_mode = vim.g.compatibility_mode or 1
                    if compatibility_mode == 0 then
                        goto continue
                    elseif compatibility_mode == 1 then
                        keybind = "<leader>" .. keybind
                    end
                end

                local opts = mapping_info[3] or { remap = false, silent = true, }
                opts.mode = mode
                mapping_info[3] = nil

                which_key.register({ [keybind] = mapping_info }, opts)

                ::continue::
            end
        end
    end
end

utils.load_mappings = function(mappings)
    require("legendary")

    for section, modes in pairs(mappings) do
        if section == "alt" then
            utils.load_alt_mappings(modes)
        elseif section == "ctl" then
            utils.load_ctl_mappings(modes)
        elseif section == "misc" then
            utils.load_misc_mappings(modes)
        elseif section == "overload" then
            utils.load_overload_mappings(modes)
        elseif section == "compatibility" then
            utils.load_compatibility_mappings(modes)
        else
            utils.load_main_mappings(modes)
        end
    end
end

utils.get_plugin_name = function()
    local plugin_path = vim.fn.expand("%:h")
    local path_components = vim.fn.split(plugin_path, "[\\|/]")
    local plugin_name = path_components[#path_components]
    return plugin_name
end

utils.term_codes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

utils.select_all = function()
    local linenr = vim.fn.line(".")
    local colnr = vim.fn.col(".")

    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "[vV]:*", -- visual/visual line
        callback = function()
            local last_line = vim.fn.line("$")
            local new_line_nr = math.min(last_line, linenr)

            vim.api.nvim_win_set_cursor(0, { new_line_nr, colnr - 1 })
        end,
        once = true,
    })

    vim.cmd "normal ggVG"
end

utils.activate_diagnostics = function()
    vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
end

utils.capitalize = function(str)
    return (str:gsub("^%l", string.upper))
end

utils.replace_with_trouble = function()
    local buftype = "quickfix"
    if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
        buftype = "loclist"
    end

    local ok, trouble = pcall(require, "trouble")
    if ok then
        vim.api.nvim_win_close(0, true)
        trouble.toggle(buftype)
    else
        local set = vim.opt_local
        set.colorcolumn = ""
        set.number = false
        set.relativenumber = false
        set.signcolumn = "no"
    end
end

utils.reset_cursor_pos = function(pos)
    local num_rows = vim.api.nvim_buf_line_count(0)

    --[[
        if the row value in the original cursor
        position tuple is greater than the
        line count after empty line deletion
        (meaning that the cursor was inside of
        the group of empty lines at the end of
        the file when they were deleted), set
        the cursor row to the last line.
    ]]
    if pos[1] > num_rows then
        pos[1] = num_rows
    end

    vim.api.nvim_win_set_cursor(0, pos)
end

utils.load_context_provider = function(context_provider)
    local current_context = {
        provider = function()
            return context_provider.get_location()
        end,
        enabled = function()
            return context_provider.is_available()
        end,
        hl = "WinBar"
    }

    require("feline").winbar.setup {
        components = {
            active = {
                {},
                { current_context },
                {},
            },
            inactive = {},
        }
    }
end

utils.hover = function()
    vim.cmd [[autocmd! CursorHold *]]
    vim.lsp.buf.hover()
    vim.cmd [[autocmd CursorMoved * ++once lua require("core.utils").activate_diagnostics()]]
end

return utils
