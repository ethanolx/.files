local present, mason_tool_installer = pcall(require, "mason-tool-installer")

if not present then
    return
end

mason_tool_installer.setup {
    auto_update = true,
    run_on_start = true,
    start_delay = 3000,

    ensure_installed = {
        "debugpy",
        "prettierd",
    },
}
