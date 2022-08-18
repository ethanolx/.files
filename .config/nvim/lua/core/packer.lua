local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

local fresh_install = false

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })

if fn.empty(fn.glob(install_path)) > 0 then
    print "Cloning packer .."
    fresh_install = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

    -- install plugins + compile their configs
    vim.cmd "packadd packer.nvim"
end

local present, packer = pcall(require, "packer")

if not present then
    return
end

packer.init {
    auto_clean = true,
    compile_on_sync = true,
    git = { clone_timeout = 6000 },
    display = {
        working_sym = " ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        prompt_border = "rounded",
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        keybindings = {
            quit = "<Esc>",
        }
    },
}

packer.startup(function(use)
    local plugins = require "plugins"

    for plugin, opts in pairs(plugins) do
        table.insert(opts, plugin)
        use(opts)
    end

    if fresh_install then
        packer.sync()
    end
end)
