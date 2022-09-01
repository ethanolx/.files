local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

treesitter.setup {
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
    },
}
