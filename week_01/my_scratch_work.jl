x = 1

y = 17

println("hello")

println("world")

for _ in 1:5
    println("hello world")
end

using Plots
data = rand(1:100, 10_000)
data = log.(data)
# could have been in one line
# data = log.(rand(1:100, 10^4))

histogram(data)