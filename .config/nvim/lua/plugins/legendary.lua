local present, legendary = pcall(require, "legendary")

if not present then
    return
end

legendary.setup {
    auto_register_which_key = true
}
