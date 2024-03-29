local present, cmp = pcall(require, "cmp")

if not present then
    return
end

require("core.utils").load_highlights(
    function(colour_palette)
        return {
            -- nvim cmp
            CmpItemAbbr = { fg = colour_palette.white },
            CmpItemAbbrMatch = { fg = colour_palette.blue, bold = true },
            -- CmpBorder = { fg = colour_palette.grey },
            -- CmpDocBorder = { fg = colour_palette.grey },
            CmPmenu = { bg = colour_palette.darker_black },

            -- cmp item kinds
            CmpItemKindConstant = { fg = colour_palette.base09 },
            CmpItemKindFunction = { fg = colour_palette.base0D },
            CmpItemKindIdentifier = { fg = colour_palette.base08 },
            CmpItemKindField = { fg = colour_palette.base08 },
            CmpItemKindVariable = { fg = colour_palette.base05 },
            CmpItemKindSnippet = { fg = colour_palette.red },
            CmpItemKindText = { fg = colour_palette.base0B },
            CmpItemKindStructure = { fg = colour_palette.base0E },
            CmpItemKindType = { fg = colour_palette.base0A },
            CmpItemKindKeyword = { fg = colour_palette.base0E },
            CmpItemKindMethod = { fg = colour_palette.base0D },
            CmpItemKindConstructor = { fg = colour_palette.blue },
            CmpItemKindFolder = { fg = colour_palette.base07 },
            CmpItemKindModule = { fg = colour_palette.base0A },
            CmpItemKindProperty = { fg = colour_palette.base08 },
            -- CmpItemKindEnum = { fg = "" },
            CmpItemKindUnit = { fg = colour_palette.base0E },
            -- CmpItemKindClass = { fg = "" },
            CmpItemKindFile = { fg = colour_palette.base07 },
            -- CmpItemKindInterface = { fg = "" },
            CmpItemKindColor = { fg = colour_palette.red },
            CmpItemKindReference = { fg = colour_palette.base05 },
            -- CmpItemKindEnumMember = { fg = "" },
            CmpItemKindStruct = { fg = colour_palette.base0E },
            -- CmpItemKindValue = { fg = "" },
            -- CmpItemKindEvent = { fg = "" },
            CmpItemKindOperator = { fg = colour_palette.base05 },
            CmpItemKindTypeParameter = { fg = colour_palette.base08 },
        }
    end
)

cmp.setup {
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or vim.bo.filetype == "dap-repl"
    end,
    preselect = cmp.PreselectMode.None,
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None", -- annoying Error highlight in docs
        },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, item)
            local icons = require("core.icons").lsp
            if entry.source.name == "vim-dadbod-completion" then
                local kinds = { schema = 0, table = 0 }
                local doc = entry.completion_item.documentation

                if kinds[doc] ~= nil then
                    item.kind = require("core.utils").capitalize(doc)
                elseif string.match(doc, "table column") then
                    item.kind = "Column"
                elseif doc == "SQL reserved word" then
                    item.kind = "Keyword"
                end
            end
            item.kind = string.format(" %s %s", icons[string.lower(item.kind)], item.kind)
            -- item.menu = ""
            -- item.word = string.gsub(item.word, "%s+$", "")
            -- if entry.completion_item.insertText ~= nil then
            --     entry.completion_item.insertText = string.gsub(entry.completion_item.insertText, "%s+$", "")
            -- end
            return item
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-y>"] = cmp.mapping.scroll_docs(-1),
        ["<C-e>"] = cmp.mapping.scroll_docs(1),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-z>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- ["<CR>"] = cmp.mapping(function(fallback)
        --     if vim.bo.filetype == "DressingInput" then
        --         fallback()
        --     elseif not cmp.confirm({ select = false }) then
        --         require("pairs.enter").type()
        --     end
        -- end),
        ["<C-h>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end),
        ["<C-l>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip", keyword_length = 1, max_item_count = 5 },
        {
            name = "buffer",
            option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end },
            keyword_length = 5,
            max_item_count = 20,
        },
        { name = "nvim_lua" },
        { name = "path" },
    },
}

-- Command Line
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        -- { name = "path" },
        { name = "cmdline", max_item_count = 12, keyword_pattern = "!\\@!\\w*" },
    })
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer", max_item_count = 10, }
    }
})

-- Unknown File Type
cmp.setup.filetype("", {
    sources = cmp.config.sources({
        { name = "buffer" },
    })
})

-- DAP
cmp.setup.filetype("dap-repl", {
    sources = cmp.config.sources({
        { name = "dap" },
        { name = "nvim_lsp" },
        { name = "buffer", max_item_count = 5 },
    })
})

-- Git
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        { name = "buffer" },
    })
})

cmp.setup.filetype("NeogitCommitMessage", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        { name = "buffer" },
    })
})

-- SQL
for _, ft in ipairs({ "sql", "mysql", "plsql" }) do
    cmp.setup.filetype(ft, {
        sources = cmp.config.sources({
            { name = "buffer" },
            { name = "vim-dadbod-completion", max_item_count = 5 },
        })
    })
end

-- Neorg
cmp.setup.filetype("norg", {
    sources = cmp.config.sources({
        { name = "neorg" }, -- You can specify the `cmp_git` source if you were installed it.
        { name = "luasnip", keyword_length = 1, max_item_count = 5 },
        { name = "buffer" },
    })
})
