#!/usr/bin/gnuplot

# Set output file and terminal
set terminal png
set output "binancecoin_price_details_plot.png"

# Set data file format
set datafile separator comma

# Set plot title and labels
set title "BinanceCoin Price Details Over Time"
set xlabel "Time"
set ylabel "Price (Binancecoin)"

# Set time formatting
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%Y-%m-%d\n%H:%M:%S"

# Increase font size of x-axis labels
set xtics font ", 7"

# Plot data
plot "binance_coin_details.csv" using 5:3 with linespoints title "Low Rate", \
     "binance_coin_details.csv" using 5:4 with linespoints title "High Rate", \
     "Binance_coin.csv" using 3:2 with linespoints title "Binance Coin Price