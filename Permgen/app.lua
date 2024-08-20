function permgen (a,n)
    if n == 0 then
        coroutine.yield(a)
    else
        for i=1,n do
            a[n], a[i] = a[i], a[n]
            permgen(a, n - 1)
            a[n], a[i] = a[i], a[n]
        end
    end
end

function perm (a)
    local n = coroutine.create(function() permgen(a, #a) end)
    local it = function ()
        local code, res = coroutine.resume(n)
        return res
    end
    return it
end

function printResult (a)
    for i,v in ipairs(a) do
        io.write(v, "")
    end
    io.write("\n")
end

for p in perm {"a", "b", "c"} do
    printResult(p)
end


