using Random, Statistics, Distributions, Plots #, StatsPlots
Random.seed!(67) # seeding means that all future "random numbers" are actually the same per run
data = rand(1:100, 5)
@show data

function my_x̄(dat) #\bar + [TAB]
    total = sum(dat) #uses the in-built sum function in julia
    n = length(dat)
    return total/n
end

function my_std_long(dat)
    x̄ = my_x̄(dat)
    n = length(dat)
    return sqrt(sum((dat .- x̄).^2)/(n-1))
end

function my_std_short(dat)
    x̄ = my_x̄(dat)
    n = length(dat)
    s2 = sum(dat.^2) #sum of squares
    return sqrt((s2 - n*x̄^2)/(n-1))
end

s_long = my_std_long(data)
s_short = my_std_short(data)
s_system = std(data) # in-built standard deviation
@show s_long
@show s_short
@show s_system;

my_dist = Gamma(3,5)
n = 2*10^2
data = rand(my_dist, n);

println("The standard deviation of the data is $(std(data))")
println("The standard deviation of the distribution (model) is $(std(my_dist))")

x_range = 0:0.01:70
plot(x_range, pdf.(my_dist, x_range), label = "Density", lw = 5, xlabel = "value, x", ylabel = "f(x)")
histogram!(data, normed = true,bins =30, lw=0, label = "Frequency Hist")
# density(data, normed = true,bins =30, lw=0, label = "Frequency KDE")

# plot(x_range, cdf.(my_dist, x_range), label = false, lw = 5, xlabel = "value, x", ylabel = "Probability CDF, F(x) = P(X ≤ x)")
