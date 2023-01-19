local present, pounce = pcall(require, "pounce")

if not present then
    return
end

pounce.setup {}
