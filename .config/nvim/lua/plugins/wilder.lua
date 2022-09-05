local present, wilder = pcall(require, "wilder")

if not present then
    return
end

wilder.setup {
    modes = { ":", "/", "?" },
    enable_cmdline_enter = false,
}

wilder.set_option("pipeline", {
    wilder.branch(
        wilder.cmdline_pipeline(),
        wilder.search_pipeline()
        -- wilder.search_pipeline({ pattern = "fuzzy" })
    ),
})

wilder.set_option("renderer", wilder.renderer_mux({
    [":"] = wilder.popupmenu_renderer(
        wilder.popupmenu_palette_theme({
            highlights = {
                border = "FloatBorder",
            },
            border = "rounded",
            max_height = "75%",
            min_height = 0,
            prompt_position = "top",
            reverse = 0,
            left = {
                " ",
                wilder.popupmenu_devicons()
            },
            right = {
                " ",
                wilder.popupmenu_scrollbar()
            },
        })),
    ["/"] = wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlights = {
                border = "FloatBorder",
            },
            border = "rounded",
            apply_incsearch_fix = true,
        })
    ),
    ["?"] = wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlights = {
                border = "FloatBorder",
            },
            border = "rounded",
        })
    ),
}))
