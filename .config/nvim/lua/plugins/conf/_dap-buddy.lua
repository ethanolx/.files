local present, dap_buddy = pcall(require, "dap-install")

if not present then
   return
end

dap_buddy.setup {
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
}

dap_buddy.config("python", {})
