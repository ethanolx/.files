-- vim.cmd [[inoremap <C-k> <Cmd>lua require'better-digraphs'.digraphs("i")<CR>]]
-- vim.cmd [[nnoremap r<C-k><C-k> <Cmd>lua require'better-digraphs'.digraphs("r")<CR>]]
-- vim.cmd [[vnoremap r<C-k><C-k> <ESC><Cmd>lua require'better-digraphs'.digraphs("gvr")<CR>]]

vim.g.BetterDigraphsAdditions = {
    -- {
    --   digraph = "OK",
    --   symbol = "*",
    --   name = "NEW STAR"
    -- },
    -- {
    --   digraph = "zz",
    --   symbol = "Z",
    --   name = "CAPITAL Z"
    -- }
}
