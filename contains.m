function ans = contains(xs, x)
    for a=xs
        if x==a
            ans = true
            break
        end
    end
    ans = false
end