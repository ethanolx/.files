local present, lspconfig = pcall(require, "lspconfig")

if not present then
    return
end

local icons = require("core.icons").diagnostic

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

local on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true
    if vim.g.providers.context == "navic" then
        require("nvim-navic").attach(client, bufnr)
    end
end

require("mason-lspconfig").setup_handlers {
    -- Default handler
    function(server)
        lspconfig[server].setup {
            on_attach = on_attach,
        }
    end,

    sumneko_lua = function()
        lspconfig.sumneko_lua.setup {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "packer_plugins" },
                    },
                    workspace = { library = { [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        }
    end,
}
