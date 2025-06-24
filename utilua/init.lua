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

--- merges table `from` into table `to`
function merge(to, from)
    for k,v in ipairs(from) do table.insert(to, v) end -- [k] = v end
    return to
end

function isempty(s)
  return s == nil or s == ''
end

module.prequire = prequire
module.onprequire = onprequire
module.merge = merge
module.isemtpy = isempty

return module