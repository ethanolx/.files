local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
    return
end

treesitter.setup {
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}
