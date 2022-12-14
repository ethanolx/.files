local present, treesitter_context = pcall(require, "treesitter-context")

if not present then
    return
end

treesitter_context.setup {
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            -- Object-Oriented
            'class',
            'method',

            -- Functional
            'function',

            -- Loops
            'for',
            'while',
            'do',

            -- Conditionals
            'if',
            'else',
            'switch',
            'case',
        },
        php = {
            'foreach',
            'array',
        },
        python = {
            'elif',
            'dictionary',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
}
