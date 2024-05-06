#!/usr/bin/gnuplot

# Set output file and terminal
set terminal png
set output "ethereum_price_details_plot.png"

# Set data file format
set datafile separator comma

# Set plot title and labels
set title "Ethereum Price Details Over Time"
set xlabel "Time"
set ylabel "Price (Ethereum)"

# Set time formatting
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%Y-%m-%d\n%H:%M:%S"

# Increase font size of x-axis labels
set xtics font ", 7"

# Set x-axis range
set xrange ["2024-04-29 00:00:00":"2024-05-03 12:00:00"]

# Plot data
plot "ethereum_price_details.csv" using 5:3 with linespoints title "Low Rate", \
     "ethereum_price_details.csv" using 5:4 with linespoints title "High Rate", \
     "ethereum_prices.csv" using 3:2 with linespoints title "Ethereum Price"
