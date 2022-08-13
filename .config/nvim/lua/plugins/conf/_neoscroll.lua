local present, neoscroll = pcall(require, "neoscroll")

if not present then
    return
end

neoscroll.setup {
    -- mappings = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb"},
    hide_cursor = true,
    stop_eof = true,
    use_local_scrolloff = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = nil,
    pre_hook = nil,
    post_hook = nil,
    performance_mode = false,
}

require("neoscroll.config").set_mappings {
    ['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100' } },
    ['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100' } },
    ['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '250' } },
    ['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '250' } },
    ['<C-y>'] = { 'scroll', { '-0.10', 'false', '50' } },
    ['<C-e>'] = { 'scroll', { '0.10', 'false', '50' } },
    ['zt']    = { 'zt', { '100' } },
    ['zz']    = { 'zz', { '100' } },
    ['zb']    = { 'zb', { '100' } },
}
