local present, legendary = pcall(require, "legendary")

if not present then
    return
end

legendary.setup {
    which_key = {
        auto_register = true,
        do_bindings = false,
    }
}
