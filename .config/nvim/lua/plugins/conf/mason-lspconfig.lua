local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
    return
end

mason_lspconfig.setup {
    automatic_installation = true,

    ensure_installed = {
        "clangd",
        "cssls",
        "csharp_ls",
        "html",
        "intelephense",
        "jdtls",
        "pyright",
        "jsonls",
        "prosemd_lsp",
        "sqlls",
        "tsserver",
        "sumneko_lua",
        "vimls",
    }
}

