local present, toggleterm = pcall(require, "toggleterm")

if not present then
    return
end

toggleterm.setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.5
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    highlights = {
        FloatBorder = { link = "FloatBorder", },
    },
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = false,
    direction = "tab",
    close_on_exit = true,
    shell = vim.loop.os_uname().sysname == "Linux" and "zsh" or "powershell",
    on_open = function (terminal)
        vim.cmd "normal i"
    end,
    float_opts = {
        border = "curved",
    },
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
}
