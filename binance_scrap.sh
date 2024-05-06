#!/bin/bash

Get the timestamp of the last execution
last_execution=$(date +%s -r /tmp/last_execution)

Get the current timestamp
current_time=$(date +%s)

Check if 15 seconds have passed since the last execution
if ((current_time - last_execution >= 15)); then
    # Fetch the CoinDesk Bitcoin price page
    url="https://www.coindesk.com/price/binance-coin/"
    html_content=$(curl -s -H "Cache-Control: no-cache" "$url")

    # Extract the current Bicoin to USD rate
    current_rate=$(echo "$html_content" | grep -oP '(?<=<span class="currency-pricestyles__Price-sc-1v249sx-0 fcfNRE">)[^<]+')

    # Insert data into MySQL database
    mysql -u root -proot -e "USE bitcoin_data; \
        INSERT INTO binancecoin_prices (current_rate, timestamp) VALUES ('$current_rate', NOW());"

    # Update the timestamp of the last execution
    touch /tmp/last_execution
fi
