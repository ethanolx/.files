local present, mason_lspconfig = pcall(require, "mason-lspconfig")

if not present then
    return
end

mason_lspconfig.setup {
    automatic_installation = true,

    ensure_installed = {
        "clangd",
        "csharp_ls",
        "cssls",
        "html",
        "intelephense",
        "jdtls",
        "jsonls",
        "prosemd_lsp",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "sumneko_lua",
        "tsserver",
        "vimls",
    }
}
