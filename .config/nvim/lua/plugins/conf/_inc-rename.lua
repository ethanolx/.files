local present, inc_rename = pcall(require, "inc_rename")

if not present then
    return
end

inc_rename.setup {
    cmd_name = "Re", -- the name of the command
    hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
    multifile_preview = true, -- whether to enable the command preview across multiple buffers
    show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
}
