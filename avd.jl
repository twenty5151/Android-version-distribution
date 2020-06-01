using DataFrames
using CSV
using Plots
using Dates

df = DataFrame(CSV.File("raw.csv"))

# Replace missing data with 0
df = coalesce.(df, 0)

function normalize(col)
    col ./ maximum(col)
end

# Normalize numeric columns
ndf = DataFrame(normalize.(eachcol(df[2:end])))

# Join the dates column back
df = hcat(df[1], ndf, makeunique=true)

# Convert dates String to DateTime
df[1] = DateTime.(df[1], "u yyyy")

# Shift all dates to be relative to the first date
start = df[1][1]
df[1] = convert.(Dates.Day, Dates.Period.(df[1] .- start))

# Shift all percentages to start at first date
for i in 1:ncol(df)-3
    tmp = df[df[i+2] .!= 0, :][i+2]
    while length(df[i+2]) > length(tmp)
        push!(tmp, 0)
    end
    df[i+2] = tmp
end

# Remove trailing zeros
allowmissing!(df)
df .= ifelse.(df .== 0, missing, df)

# Rename
rename!(df, :x1 => :Days)
rename!(df, :x1_1 => "4.1")
rename!(df, :x2 => "4.2")
rename!(df, :x3 => "4.3")
rename!(df, :x4 => "5.0")
rename!(df, :x5 => "5.1")
rename!(df, :x6 => "6.0")
rename!(df, :x7 => "7.0")
rename!(df, :x8 => "7.1")
rename!(df, :x9 => "8.0")
rename!(df, :x10 => "8.1")
rename!(df, :x11 => "9.0")


# Remove NaN columns
df = df[1:end-6]

# Plot (for both julia and percentage change pngs)
colors = [:aquamarine :red :brown :fuchsia :green3 :orange :pink :purple :violet :lime :deepskyblue]
labels = ["4.1" "4.2" "4.3" "5.0" "5.1" "6.0" "7.0" "7.1" "8.0" "8.1" "9.0"]
plots = []
number_of_colors = length(names(df)) - 1

for i in 1:ncol(df[2:end])
    co = hcat(fill(:grey, (1, i-1)), [colors[i]], fill(:grey, (1, number_of_colors-i)))
    alp = hcat(fill(0.3, (1, i-1)), [1], fill(0.3, (1, number_of_colors-i)))
    push!(
        plots,
        plot(df[1], [df[j] for j in 2:ncol(df)], c=co, la=alp, title=labels[i],
             w=2, leg=:none, showaxis=:y)
    )
end

png(plot(plots..., size=(1500, 1000)), "julia")
