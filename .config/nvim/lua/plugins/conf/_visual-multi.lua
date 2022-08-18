vim.cmd [[
    let g:VM_maps = {}
    let g:VM_maps["Find Under"] = "<M-n>"
    let g:VM_maps["Find Subword Under"] = "<M-n>"
    let g:VM_maps["Switch Mode"] = "v"

    let g:VM_Mono_hl   = "Cursor"
    let g:VM_Extend_hl = "Visual"
    let g:VM_Cursor_hl = "Cursor"
    let g:VM_Insert_hl = "FoldColumn"
    let g:VM_highlight_matches = ""
]]

-- require("core.utils").load_highlight "visual-multi"
-- vim.g.VM_maps = {}
-- vim.g.VM_maps["Find Under"] = "<M-n>"
-- vim.g.VM_maps["Find Subword Under"] = "<M-n>"
-- -- vim.g.VM_maps["Select All"]                  = "\\A"
-- -- vim.g.VM_maps["Start Regex Search"]          = "\\/"
-- -- vim.g.VM_maps["Add Cursor Down"]             = "<C-Down>"
-- -- vim.g.VM_maps["Add Cursor Up"]               = "<C-Up>"
-- -- vim.g.VM_maps["Add Cursor At Pos"]           = "\\\"
-- -- vim.g.VM_maps["Visual Regex"]                = "\\/"
-- -- vim.g.VM_maps["Visual All"]                  = "\\A"
-- -- vim.g.VM_maps["Visual Add"]                  = "\\a"
-- -- vim.g.VM_maps["Visual Find"]                 = "\\f"
-- -- vim.g.VM_maps["Visual Cursors"]              = "\\c"
-- vim.g.VM_maps["Switch Mode"] = "v"

-- -- vim.g.VM_maps["Find Next"]                   = ']'
-- -- vim.g.VM_maps["Find Prev"]                   = '['
-- -- vim.g.VM_maps["Goto Next"]                   = '}'
-- -- vim.g.VM_maps["Goto Prev"]                   = '{'
-- -- vim.g.VM_maps["Seek Next"]                   = '<C-f>'
-- -- vim.g.VM_maps["Seek Prev"]                   = '<C-b>'
-- -- vim.g.VM_maps["Skip Region"]                 = 'q'
-- -- vim.g.VM_maps["Remove Region"]               = 'Q'
-- -- vim.g.VM_maps["Invert Direction"]            = 'o'
-- -- vim.g.VM_maps["Find Operator"]               = "m"
-- -- vim.g.VM_maps["Surround"]                    = 'S'
-- -- vim.g.VM_maps["Replace Pattern"]             = 'R'

-- -- vim.g.VM_maps["Tools Menu"]                  = '\\`'
-- -- vim.g.VM_maps["Show Registers"]              = '\\"'
-- -- vim.g.VM_maps["Case Setting"]                = '\\c'
-- -- vim.g.VM_maps["Toggle Whole Word"]           = '\\w'
-- -- vim.g.VM_maps["Transpose"]                   = '\\t'
-- -- vim.g.VM_maps["Align"]                       = '\\a'
-- -- vim.g.VM_maps["Duplicate"]                   = '\\d'
-- -- vim.g.VM_maps["Rewrite Last Search"]         = '\\r'
-- -- vim.g.VM_maps["Merge Regions"]               = '\\m'
-- -- vim.g.VM_maps["Split Regions"]               = '\\s'
-- -- vim.g.VM_maps["Remove Last Region"]          = '\\q'
-- -- vim.g.VM_maps["Visual Subtract"]             = '\\s'
-- -- vim.g.VM_maps["Case Conversion Menu"]        = '\\C'
-- -- vim.g.VM_maps["Search Menu"]                 = '\\S'

-- -- vim.g.VM_maps["Run Normal"]                  = '\\z'
-- -- vim.g.VM_maps["Run Last Normal"]             = '\\Z'
-- -- vim.g.VM_maps["Run Visual"]                  = '\\v'
-- -- vim.g.VM_maps["Run Last Visual"]             = '\\V'
-- -- vim.g.VM_maps["Run Ex"]                      = '\\x'
-- -- vim.g.VM_maps["Run Last Ex"]                 = '\\X'
-- -- vim.g.VM_maps["Run Macro"]                   = '\\@'
-- -- vim.g.VM_maps["Align Char"]                  = '\\<'
-- -- vim.g.VM_maps["Align Regex"]                 = '\\>'
-- -- vim.g.VM_maps["Numbers"]                     = '\\n'
-- -- vim.g.VM_maps["Numbers Append"]              = '\\N'
-- -- vim.g.VM_maps["Zero Numbers"]                = '\\0n'
-- -- vim.g.VM_maps["Zero Numbers Append"]         = '\\0N'
-- -- vim.g.VM_maps["Shrink"]                      = "\\-"
-- -- vim.g.VM_maps["Enlarge"]                     = "\\+"

-- -- vim.g.VM_maps["Toggle Block"]                = '\\<BS>'
-- -- vim.g.VM_maps["Toggle Single Region"]        = '\\<CR>'
-- -- vim.g.VM_maps["Toggle Multiline"]            = '\\M'
