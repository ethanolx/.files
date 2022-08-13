local present, lspconfig = pcall(require, "lspconfig")

if not present then
    return
end

require("core.utils").load_highlight "lsp"

local icons = require("core.icons").diagnostics

for level, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. require("core.utils").capitalize(level)
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = true,
    float = {
        focusable = false,
        border = "rounded",
    },
    update_in_insert = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = "rounded"
    return opts
end

local servers = {
    clangd = {},
    cssls = {},
    -- csharp_ls = {},
    html = {},
    intelephense = {},
    jdtls = {},
    pyright = {},
    jsonls = {},
    prosemd_lsp = {},
    sqlls = {},
    tsserver = {},
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "packer_plugins" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    },
    vimls = {},
}

local on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true
    if vim.g.context_provider == "nvim-navic" then
        require("nvim-navic").attach(client, bufnr)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

for name, opts in pairs(servers) do
    local _on_attach = opts.on_attach or on_attach
    local _capabilities = opts.capabilities or capabilities
    local _settings = opts.settings or {}

    lspconfig[name].setup {
        on_attach = _on_attach,
        capabilities = _capabilities,
        settings = _settings,
    }
end
