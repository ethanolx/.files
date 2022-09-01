local present, neogit = pcall(require, "neogit")

if not present then
   return
end

vim.cmd "PackerLoad nvim-treesitter"

neogit.setup {
    kind = "tab",
    signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
    },
}
