using Statistics

# Standard form
function bmi(weight_kg, height_m)
    return weight_kg / height_m^2
end

# One-line form (coefficient of variation in %)
cv(x) = std(x) / mean(x) * 100

println("BMI(80, 1.75) = ", round(bmi(80, 1.75), digits=1))

data = [23.4, 25.1, 22.8, 24.6, 26.0]
println("CV = ", round(cv(data), digits=1), "%")