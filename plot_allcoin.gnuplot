#!/usr/bin/gnuplot

# Set output file and terminal
set terminal png
set output "plotallcoin.png"

# Set data file format
set datafile separator comma

# Set plot title and labels
set title "Cryptocurrency Prices Over Time"
set xlabel "Time"
set ylabel "Price"

# Set time formatting
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%Y-%m-%d\n%H:%M:%S"

# Increase font size of x-axis labels
set xtics font ", 7"

# Plot data
plot "Binance_coin.csv" using 3:2 with linespoints title "Binance Coin Price", \
     "ethereum_price.csv" using 3:2 with linespoints title "Ethereum Price", \
     "bitcoin_prices.csv" using 3:2 with linespoints title "Bitcoin Price"
