#!/usr/bin/gnuplot

# Set output file and terminal
set terminal png
set output "bitcoin_price_plot.png"

# Set data file format
set datafile separator comma

# Set plot title and labels
set title "Bitcoin Price Over Time"
set xlabel "Time"
set ylabel "Price (Bitcoin)"

# Set time formatting
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%Y-%m-%d\n%H:%M:%S"

# Increase font size of x-axis labels
set xtics font ", 10"

# Plot data
plot "bitcoin_prices.csv" using 3:2 with linespoints title "Bitcoin Price", \
