local present, tidy = pcall(require, "tidy")

if not present then
    return
end

tidy.setup {}
