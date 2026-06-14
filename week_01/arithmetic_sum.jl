# let's make program to verify
# sum i=1 to n of i is n*(n+1)/2

function raw_sum(n)
    s = 0
    for i in 1:n
        s += i   # s = s + i
    end
    return s
end

function formula_sum(n)
    return n*(n+1)/2  #mistake
end

has_error = false

for n in 1:10^2
    if raw_sum(n) != formula_sum(n)
        println("Found error with $n")
        global has_error = true
    end
end

if has_error
    println("sorry found an error")
else
    println("good stuff seams right for what you tested")
end