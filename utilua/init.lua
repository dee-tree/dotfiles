local module = {}

--- safe `require` call like `pcall`
function prequire(mod)
    hasModule, module = pcall(require, mod)
    return hasModule, module
end

--- call callback `action` if safe `require` was succeeded for module `mod`
function onprequire(mod, action)
    has, mod = prequire(mod)

    if (has) then
        action(mod)
    end
end

module.prequire = prequire
module.onprequire = onprequire

return module