local present, hlslens = pcall(require, "hlslens")

if not present then
    return
end

require("scrollbar.handlers.search").setup {
    auto_enable = true,
    override_lens = function(...) end,
}

vim.api.nvim_del_augroup_by_name('scrollbar_search_hide')
