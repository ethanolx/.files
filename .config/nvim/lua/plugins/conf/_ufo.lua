local present, ufo = pcall(require, "ufo")

if not present then
    return
end

vim.wo.foldcolumn = '1'
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true

-- option 1: coc.nvim as LSP client
-- use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
--

-- option 2: nvim lsp as LSP client
-- tell the sever the capability of foldingRange
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
--

ufo.setup {
    -- open_fold_hl_timeout = {
    --     description = [[time in millisecond between the range to be highlgihted and to be cleared
    --                 while opening the folded line, `0` value will disable the highlight]],
    --     default = 400
    -- },
    provider_selector = function (bufnr, filetype)
        -- Use treesitter for .norg files
        if filetype == "norg" then
            return ""
        end

        return { "lsp", "indent" }
    end,
    -- fold_virt_text_handler = {
    --     description = [[a function customize fold virt text, see ### Customize fold text]],
    --     default = nil
    -- }
}
