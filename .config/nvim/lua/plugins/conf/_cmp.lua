local present, cmp = pcall(require, "cmp")

if not present then
    return
end

local utils = require("core.utils")
utils.load_highlight "cmp"

local options = {
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        --     or require("cmp_dap").is_dap_buffer()
    end,
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
            local icons = require("core.icons").lspkind
            if entry.source.name == "vim-dadbod-completion" then
                local kinds = { schema=0, table=0 }
                local doc = entry.completion_item.documentation

                if kinds[doc] ~= nil then
                    item.kind = utils.capitalize(doc)
                elseif string.match(doc, "table column") then
                    item.kind = "Column"
                elseif doc == "SQL reserved word" then
                    item.kind = "Keyword"
                end
            end
            item.kind = string.format(" %s %s", icons[string.lower(item.kind)], item.kind)
            item.menu = ""
            item.word = string.gsub(item.word, "%s+$", "")
            if entry.completion_item.insertText ~= nil then
                entry.completion_item.insertText = string.gsub(entry.completion_item.insertText, "%s+$", "")
            end
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
        -- ["<CR>"] = cmp.mapping.confirm(),
        ["<CR>"] = cmp.mapping(function(fallback)
            if not cmp.confirm({ select = false }) then
                require("pairs.enter").type()
            end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
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
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
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
        -- { name = "dap" },
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

cmp.setup(options)

-- vim.cmd [[autocmd FileType sql,mysql,plsql lua require("cmp").setup.buffer({ sources = {{ name = "vim-dadbod-completion" }} }) ]]

for _, ft in ipairs({ "sql", "mysql", "plsql" }) do
    cmp.setup.filetype(ft, {
        sources = cmp.config.sources({
            { name = "buffer" },
            { name = "vim-dadbod-completion", max_item_count = 5 },
        })
    })
end

cmp.setup.filetype("", {
    sources = cmp.config.sources({})
})

-- NOTE: NEORG
cmp.setup.filetype("norg", {
    sources = cmp.config.sources({
        { name = "neorg" }, -- You can specify the `cmp_git` source if you were installed it.
        { name = "luasnip", keyword_length = 1, max_item_count = 5 },
        { name = "buffer" },
    })
})

-- NOTE: GIT
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

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer", max_item_count = 10, }
    }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        -- { name = "path" },
        { name = "cmdline", max_item_count = 12, keyword_pattern = "!\\@!\\w*" },
    })
})
