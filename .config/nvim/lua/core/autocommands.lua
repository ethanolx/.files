-- autocmdsa
local autocmd = vim.api.nvim_create_autocmd

autocmd("InsertLeave", {
    callback = function()
        if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
    end,
})

autocmd("BufEnter", { command = "set foldexpr=nvim_treesitter#fold_expr()", once = true, })
autocmd("FileType", { pattern = "mason", command = "IndentBlanklineDisable" })

-- autocmd("VimEnter", {
--     callback = function()
--         vim.cmd "profile start $nvim/profile.log"
--         vim.cmd "profile func *"
--         vim.cmd "profile! file *"
--     end,
--     once = true,
-- })

-- autocmd("BufWritePost", {
--     callback = function()
--         vim.cmd "profile dump"
--     end,
-- })

-- Quit Neovim if the only open window is NvimTree
vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

-- Show diagnostics upon hovering
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({ focusable = false, border = "rounded" })]]
-- require("core.utils").activate_diagnostics()

-- Disable signcolumn for git commits
vim.cmd [[autocmd FileType gitcommit setlocal signcolumn=no]]
vim.cmd [[autocmd FileType Outline setlocal signcolumn=no]]

autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "quickfix",
    callback = require("core.utils").replace_with_trouble,
})
-- autocmd({ "BufEnter" }, {
--     pattern = "*",
--     callback = function()
--         if vim.bo.filetype == "qf" then
--             vim.wo.winbar = ""
--             vim.cmd "cclose"
--             vim.cmd "Trouble quickfix"
--         end
--     end,
-- })

autocmd("InsertEnter", {
    pattern = "*",
    callback = function ()
        vim.diagnostic.disable(0)
    end,
})

autocmd("InsertLeave", {
    pattern = "*",
    callback = function ()
        vim.diagnostic.enable(0)
    end,
})
